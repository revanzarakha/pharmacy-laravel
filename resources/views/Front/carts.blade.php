<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart | Pharmacy</title>
    <link rel="shortcut icon" href="{{asset('assets/svgs/logo-mark.svg')}}" type="image/x-icon">
	<link rel="stylesheet" href="{{asset('css/main.css')}}">
	<link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css">
	<script src="https://cdn.tailwindcss.com"></script>
  </head>

  <body>
    <!-- Topbar -->
    <section class="relative flex items-center justify-between w-full gap-5 wrapper">
      <a href="{{route('front.index')}}" class="p-2 bg-white rounded-full">
        <img src="{{asset('assets/svgs/ic-arrow-left.svg')}}" class="size-5" alt="">
      </a>
      <p class="absolute text-base font-semibold translate-x-1/2 -translate-y-1/2 top-1/2 right-1/2">
        Shopping Carts
      </p>
    </section>

    <!-- Items -->
    <section class="wrapper flex flex-col gap-2.5">
      <div class="flex items-center justify-between">
        <p class="text-base font-bold">
          Items
        </p>
        <button type="button" class="p-2 bg-white rounded-full" data-expand="itemsList">
          <img src="{{asset('assets/svgs/ic-chevron.svg')}}" class="transition-all duration-300 -rotate-180 size-5" alt="">
        </button>
      </div>
      <div class="flex flex-col gap-4" id="itemsList">
        <!-- Softovac Rami -->

         @forelse($my_carts as $cart)
        <div class="py-3.5 pl-4 pr-[22px] bg-white rounded-2xl flex gap-1 items-center relative">
          <img src="{{Storage::url($cart->product->photo)}}" class="w-full max-w-[70px] max-h-[70px] object-contain"
            alt="">
          <div class="flex flex-wrap items-center justify-between w-full gap-1">
            <div class="flex flex-col gap-1">
              <h3
                class="text-base font-semibold whitespace-nowrap w-[150px] truncate">
                {{$cart->product->name}}
              </h3>
              <p class="text-sm text-grey  product-price" data-price=" {{$cart->product->price}}">
                {{$cart->product->price}}
              </p>
            </div>

            <form action="{{route('carts.destroy', $cart)}}" method="POST">
                @csrf
                @method('DELETE')
                <button type="submit">
                    <img src="{{asset('assets/svgs/ic-trash-can-filled.svg')}}" class="size-[30px]" alt="">
                </button>
            </form>
          </div>
        </div>
        @empty
        <p>
            Belum Ada Transaksi Tersedia
        </p>
        @endforelse
          
      </div>
    </section>

    <!-- Details Payment -->
    <section class="wrapper flex flex-col gap-2.5">
      <div class="flex items-center justify-between">
        <p class="text-base font-bold">
          Details Payment
        </p>
        <button type="button" class="p-2 bg-white rounded-full" data-expand="__detailsPayment">
          <img src="{{asset('assets/svgs/ic-chevron.svg')}}" class="transition-all duration-300 size-5" alt="">
        </button>
      </div>
      <div class="p-6 bg-white rounded-3xl" id="__detailsPayment" style="display: none;">
        <ul class="flex flex-col gap-5">
          <li class="flex items-center justify-between">
            <p class="text-base font-semibold first:font-normal">
              Sub Total
            </p>
            <p class="text-base font-semibold first:font-normal" id="checkout-sub-total">
            </p>
          </li>
          <li class="flex items-center justify-between">
            <p class="text-base font-semibold first:font-normal">
              PPN 11%
            </p>
            <p class="text-base font-semibold first:font-normal" id="checkout-ppn">
            </p>
          </li>
          <li class="flex items-center justify-between">
            <p class="text-base font-semibold first:font-normal">
              Delivery Fee
            </p>
            <p class="text-base font-semibold first:font-normal" id="checkout-delivery-fee">
            </p>
          </li>
          <li class="flex items-center justify-between">
            <p class="text-base font-bold first:font-normal">
              Grand Total
            </p>
            <p class="text-base font-bold first:font-normal text-primary" id="checkout-grand-total">
            </p>
          </li>
        </ul>
      </div>
    </section>

    <!-- Payment Method -->
    <section class="wrapper flex flex-col gap-2.5">
      <div class="flex items-center justify-between">
        <p class="text-base font-bold">
          Payment Method
        </p>
      </div>
      <div class="grid items-center grid-cols-2 gap-4">
        <label
          class="relative rounded-2xl bg-white flex gap-2.5 px-3.5 py-3 items-center justify-start has-[:checked]:ring-2 has-[:checked]:ring-primary transition-all">
          <input type="radio" name="payment_method" id="manualMethod" class="absolute opacity-0">
          <img src="{{asset('assets/svgs/ic-receipt-text-filled.svg')}}" alt="">
          <p class="text-base font-semibold">
            Transfer 
          </p>
        </label>
        <label
          class="relative rounded-2xl bg-white flex gap-2.5 px-3.5 py-3 items-center justify-start has-[:checked]:ring-2 has-[:checked]:ring-primary transition-all">
          <input type="radio" name="payment_method" id="creditMethod" class="absolute opacity-0">
          <img src="{{asset('assets/svgs/ic-card-filled.svg')}}" alt="">
          <p class="text-base font-semibold">Qris</p>
        </label>
      </div>
      <div class="p-4 mt-0.5 bg-white rounded-3xl hidden" id="manualPaymentDetail">
        <div class="flex flex-col gap-5">
          <p class="text-base font-bold">
            Send Payment to
          </p>
          <div class="inline-flex items-center gap-2.5">
            <img src="{{asset('assets/svgs/ic-bank.svg')}}" class="size-5" alt="">
            <p class="text-base font-semibold">
              Bank BCA
            </p>
          </div>
          <div class="inline-flex items-center gap-2.5">
            <img src="{{asset('assets/svgs/ic-security-card.svg')}}" class="size-5" alt="">
            <p class="text-base font-semibold">
              034798098
            </p>
          </div>
        </div>
      </div>

      <div class="p-4 mt-0.5 bg-white rounded-3xl hidden" id="qrPaymentDetail">
        <div class="flex flex-col items-center justify-center gap-3">
          <p class="text-base font-bold">Scan QR to Pay</p>
          <img src="{{asset('assets/svgs/qr-code.png')}}" class="w-40 h-40 object-contain" alt="QR Code">
        </div>
      </div>

    </section>

        <!-- Delivery to -->
    <section class="wrapper flex flex-col gap-2.5 pb-40">
      <div class="flex items-center justify-between">
        <p class="text-base font-bold">Alamat Customer</p>
        <button type="button" class="p-2 bg-white rounded-full" data-expand="deliveryForm">
          <img src="{{asset('assets/svgs/ic-chevron.svg')}}" class="transition-all duration-300 -rotate-180 size-5" alt="">
        </button>
      </div>

      <form enctype="multipart/form-data" action="{{route('product_transaction.store')}}" method="POST" class="p-6 bg-white rounded-3xl" id="deliveryForm">
        @csrf
        <div class="flex flex-col gap-5">

          <!-- Address -->
          <div class="flex flex-col gap-1">
            <label for="address" class="text-base font-semibold">Address</label>
            <input type="text" name="address" id="address" class="form-input bg-[url('{{asset('assets/svgs/ic-location.svg')}}')]">
            <p class="text-sm text-red-500 hidden" id="error-address">Address is required</p>
          </div>

          <!-- City -->
          <div class="flex flex-col gap-1">
            <label for="city" class="text-base font-semibold">City</label>
            <input type="text" name="city" id="city" class="form-input bg-[url('{{asset('assets/svgs/ic-map.svg')}}')]">
            <p class="text-sm text-red-500 hidden" id="error-city">City is required</p>
          </div>

          <!-- Post Code -->
          <div class="flex flex-col gap-1">
            <label for="post_code" class="text-base font-semibold">Post Code</label>
            <input type="number" name="post_code" id="post_code" class="form-input bg-[url('{{asset('assets/svgs/ic-house.svg')}}')]">
            <p class="text-sm text-red-500 hidden" id="error-post_code">Post code is required</p>
          </div>

          <!-- Phone Number -->
          <div class="flex flex-col gap-1">
            <label for="phone_number" class="text-base font-semibold">Phone Number</label>
            <input type="number" name="phone_number" id="phone_number" class="form-input bg-[url('{{asset('assets/svgs/ic-phone.svg')}}')]">
            <p class="text-sm text-red-500 hidden" id="error-phone_number">Phone number is required</p>
          </div>

          <!-- Notes -->
          <div class="flex flex-col gap-1">
            <label for="notes" class="text-base font-semibold">Add. Notes</label>
            <textarea name="notes" id="notes" class="form-input !rounded-2xl w-full min-h-[150px] bg-[url('{{asset('assets/svgs/ic-edit.svg')}}')] pl-10 pt-4"></textarea>
            <p class="text-sm text-red-500 hidden" id="error-notes">Please enter some notes</p>
          </div>

          <!-- Proof of Payment -->
          <div class="flex flex-col gap-1">
            <label for="proof" class="text-base font-semibold">Proof of Payment</label>
            <input type="file" name="proof" id="proof" class="form-input bg-[url('{{asset('assets/svgs/ic-folder-add.svg')}}')]">
            <p class="text-sm text-red-500 hidden" id="error-proof">Please upload proof of payment</p>
          </div>

   
        <!-- Floating grand total -->
        <div class="fixed z-50 bottom-[30px] bg-black rounded-3xl p-5 left-1/2 -translate-x-1/2 w-[calc(100dvw-32px)] max-w-[425px]">
          <section class="flex items-center justify-between gap-5">
            <div>
              <p class="text-sm text-grey mb-0.5">
                Grand Total
              </p>
              <p class="text-lg min-[350px]:text-2xl font-bold text-white" id="checkout-grand-total-price">
                Rp 3.290.000
              </p>
            </div>
          <button type="submit"
            class="inline-flex items-center justify-center px-5 py-3 text-base font-bold text-white rounded-full w-max bg-primary whitespace-nowrap">Confirm
          </button>
          </section>
        </div>

    </form>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
      integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="{{asset('scripts/global.js')}}"></script>
    <script>    

        function calcaluatePrice(){
            let subTotal = 0;
            let deliveryFee = 12000;

            document.querySelectorAll('.product-price').forEach(item => {
                subTotal  += parseFloat (item.getAttribute('data-price'));
            });

            document.getElementById('checkout-delivery-fee').textContent = 'Rp ' + deliveryFee.toLocaleString('id', {minimumFractionDigits : 2, maximumFractionDigits : 2 });

             document.getElementById('checkout-sub-total').textContent = 'Rp ' + subTotal.toLocaleString('id', {minimumFractionDigits : 2, maximumFractionDigits : 2 });

            const tax = 11 * subTotal / 100; 
            document.getElementById('checkout-ppn').textContent = 'Rp ' + tax.toLocaleString('id', {minimumFractionDigits : 2, maximumFractionDigits : 2 });

            const grandTotalPrice = subTotal + tax + deliveryFee; 
            document.getElementById('checkout-grand-total').textContent = 'Rp ' + grandTotalPrice.toLocaleString('id', {minimumFractionDigits : 2, maximumFractionDigits : 2 }); 

             document.getElementById('checkout-grand-total-price').textContent = 'Rp ' + grandTotalPrice.toLocaleString('id', {minimumFractionDigits : 0, maximumFractionDigits : 0 }); 

        }

        document.addEventListener('DOMContentLoaded',function(){
            calcaluatePrice();
        });


    </script>
  <script>
  document.addEventListener("DOMContentLoaded", function () {
    const manualRadio = document.getElementById("manualMethod");
    const qrisRadio = document.getElementById("creditMethod");

    const manualDetail = document.getElementById("manualPaymentDetail");
    const qrDetail = document.getElementById("qrPaymentDetail");

    manualRadio.addEventListener("change", function () {
      if (this.checked) {
        manualDetail.classList.remove("hidden");
        qrDetail.classList.add("hidden");
      }
    });

    qrisRadio.addEventListener("change", function () {
      if (this.checked) {
        qrDetail.classList.remove("hidden");
        manualDetail.classList.add("hidden");
      }
    });
  });
</script>

<script>
  document.querySelector("#deliveryForm").addEventListener("submit", function (e) {
    let isValid = true;

    const fields = [
      { id: "address", message: "Address is required" },
      { id: "city", message: "City is required" },
      { id: "post_code", message: "Post code is required" },
      { id: "phone_number", message: "Phone number is required" },
      { id: "notes", message: "Please enter some notes" },
      { id: "proof", message: "Please upload proof of payment" }
    ];

    fields.forEach(field => {
      const input = document.getElementById(field.id);
      const error = document.getElementById("error-" + field.id);

      if (!input.value || (input.type === 'file' && input.files.length === 0)) {
        error.classList.remove("hidden");
        isValid = false;
      } else {
        error.classList.add("hidden");
      }
    });

    if (!isValid) {
      e.preventDefault(); // stop form from submitting
    }
  });
</script>



  </body>

</html>