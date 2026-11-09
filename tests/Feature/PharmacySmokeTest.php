<?php

namespace Tests\Feature;

use App\Models\Category;
use App\Models\Product;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Spatie\Permission\Models\Role;
use Tests\TestCase;

class PharmacySmokeTest extends TestCase
{
    use RefreshDatabase;

    protected function setUp(): void
    {
        parent::setUp();
        Role::create(['name' => 'owner']);
        Role::create(['name' => 'buyer']);
    }

    public function test_homepage_loads_successfully(): void
    {
        $category = Category::create([
            'name' => 'Vitamins',
            'slug' => 'vitamins',
            'icon' => 'category_icons/dummy.png',
        ]);

        Product::create([
            'name' => 'Sample Vitamin',
            'slug' => 'sample-vitamin',
            'about' => 'Healthy supplement',
            'price' => 50000,
            'category_id' => $category->id,
            'photo' => 'product_photos/dummy.png',
        ]);

        $response = $this->get('/');
        $response->assertStatus(200);
        $response->assertSee('Sample Vitamin');
    }

    public function test_buyer_can_view_cart(): void
    {
        $buyer = User::factory()->create();
        $buyer->assignRole('buyer');

        $response = $this->actingAs($buyer)->get(route('carts'));
        $response->assertStatus(200);
    }
}
