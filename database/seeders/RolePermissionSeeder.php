<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;

use function Laravel\Prompts\password;

class RolePermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        $ownerRole = Role::create([
            'name' => 'owner'
        ]);
        $buyerRole = Role::create([
            'name' => 'buyer'
        ]);
        $user = User::create([
            'name'=> 'Rakha Pemilik',
            'email'=>'rakha@owner.com',
            'password'=> bcrypt('123456')
        ]); 

        $user->assignRole($ownerRole);
    }
}
