<x-app-layout>
    <x-slot name="header">
      <div class="flex flex-row w-full justify-between items-center">
          <h2 class="font-semibold text-xl text-gray-800 leading tight">
            {{ Auth::user()->hasRole('owner') ? __('Apotek Orders') : __('My Transaction') }}
        </h2>
      </div>          
    </x-slot>

    <div class="py-12">
        <div class="max-w-5xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white flex flex-col gap-y-5 overflow-hidden p-10 shadow-sm sm:rounded-lg">

            
            @forelse($product_transaction as $transaction)
            
                <div class="item-card flex flex-row justify-between items-center">
                <a href="{{route('product_transaction.show', $transaction)}}">
                    <div class="flex flex-row items-center gap-x-3"> 
                        <div>
                            <p class="text-base text-slate-500">
                        Total Transaksi
                            </p>
                            <h3 class="text-xl font-bold text-black items-center">
                           {{$transaction->total_amount}}
                            </h3>
                        </div>
                    </div>
                </a>
                        <div class="hidden md:flex flex-col">   
                            <p class="text-base text-slate-500">
                        Date 
                            </p>
                            <h3 class="text-xl font-bold text-black items-center">
                            {{$transaction->created_at}}
                            </h3>
                        </div>
                        @if($transaction->is_paid)
                        <span class="py-4 px-5 rounded-full bg-green-500">
                        <p class="text-white font-bold text-sm">SUCCES</p>
                        </span>
                        @else
                        <span class="py-4 px-3 rounded-full bg-orange-500">
                        <p class="text-white font-bold text-sm">PENDING</p>
                        </span>
                        @endif
                        <div class="hidden md:flex flex-row items-center gap-x-3">
                            <a href="{{route('product_transaction.show', $transaction)}}" class=" font-bold py-3 px-5 rounded-full text-white bg-blue-700">View Details</a>
                        
                        </div>
                    </div>
                    <hr class="my-3">
            @empty
            <p class="font-bold">
                Belum Terdapat Transaksi Terbaru
            </p>
            @endforelse
            

            
            </div>
        </div>
    </div>
</x-app-layout>

