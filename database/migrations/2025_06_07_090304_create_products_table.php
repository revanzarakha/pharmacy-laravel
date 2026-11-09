<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('slug');
            $table->string('photo');
            $table->text('about');
            $table->unsignedBigInteger('price');
            $table->foreignId('category_id')->constrained()->onDelete('cascade');
            $table->string('icon');
            $table->timestamps();
            $table->dropColumn('icon');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
         Schema::table('products', function (Blueprint $table) {
        $table->string('icon')->nullable(); 
    });
}
};