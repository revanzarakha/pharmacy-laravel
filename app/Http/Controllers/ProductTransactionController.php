<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\ProductTransaction;
use App\Models\TransactionDetail;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;


class ProductTransactionController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        
        $user = Auth::user();

        if($user->hasRole('buyer')){
            $product_transaction = $user->product_transactions()->orderBy('id', 'DESC')->get();
        }
        else {
            $product_transaction = ProductTransaction::orderBy('id', 'DESC')->get();
        }

        return view('admin.product_transactions.index', ['product_transaction' => $product_transaction
    ]);

    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
          
    }

    /**
     * Store a newly created resource in storage.
     */
   public function store(Request $request)
{
    $user = Auth::user();

    // Validasi input dari form
    $validated = $request->validate([
        'address' => 'required|string|max:255',
        'city' => 'required|string|max:255',
        'proof' => 'required|image|mimes:png,jpg,jpeg',
        'notes' => 'required|string|max:255',
        'post_code' => 'required|integer',
        'phone_number' => 'required|integer',
    ]);

    // Cek apakah cart kosong
    if ($user->carts->isEmpty()) {
        return redirect()->back()->with('error', 'Keranjang kamu masih kosong!');
    }

    DB::beginTransaction();

    try {
        $subTotalCents = 0;
        $deliveryFeeCents = 12000 * 100;

        // Ambil semua item dari cart user
        $cartItems = $user->carts;

        foreach ($cartItems as $item) {
            $subTotalCents += $item->product->price * 100;
        }

        $taxCents = (int) round(11 * $subTotalCents / 100);
        $grandTotalCents = $subTotalCents + $taxCents + $deliveryFeeCents;

        $grandTotal = $grandTotalCents / 100;

        // Tambahkan user_id dan total ke validated array
        $validated['user_id'] = $user->id;
        $validated['total_amount'] = $grandTotal;
        $validated['is_paid'] = false;

        // Simpan file bukti pembayaran
        if ($request->hasFile('proof')) {
            $proofPath = $request->file('proof')->store('payment_proofs', 'public');
            $validated['proof'] = $proofPath;
        }

        // Buat transaksi
        $newTransaction = ProductTransaction::create($validated);

        // Simpan detail transaksi dan hapus cart
        foreach ($cartItems as $item) {
            TransactionDetail::create([
                'product_transaction_id' => $newTransaction->id,
                'product_id' => $item->product_id,
                'price' => $item->product->price,
            ]);

            $item->delete();
        }

        DB::commit();

        return redirect()->route('product_transaction.index')
                         ->with('success', 'Transaksi berhasil dibuat!');
    } catch (\Exception $e) {
        DB::rollBack();
        $error = ValidationException::withMessages([
            'system_error' => ['System error! ' . $e->getMessage()],
        ]);
        throw $error;
    }
}

    

    /**
     * Display the specified resource.
     */
   
     public function show(ProductTransaction $productTransaction)
    {
        //
        $productTransaction = ProductTransaction::with('transactionDetails.product')->find($productTransaction->id);

        return view('admin.product_transactions.details', [ 'productTransaction'=> $productTransaction
    ]);
    }

    /**
     * Show the form for editing the specified resource.
     */

    public function edit(ProductTransaction $productTransaction)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, ProductTransaction $productTransaction)
    {
        //
        $productTransaction->update([
            'is_paid' => true 
        ]);
        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ProductTransaction $productTransaction)
    {
        //
    }
}


