<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
use Illuminate\View\View;

class RegisteredUserController extends Controller
{
    /**
     * Display the registration view.
     */
    public function create(): View
    {
        return view('auth.register');
    }

    /**
     * Handle an incoming registration request.
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request): RedirectResponse
    {
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'lowercase', 'email', 'max:255', 'unique:' . User::class],
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
        ], [
            'name.required' => 'Nama wajib diisi ya',
            'email.required' => 'Emailnya Wajib Diisi',
            'email.email' => 'Format email tidak valid',
            'email.unique' => 'Email ini sudah terdaftar',
            'password.required' => 'Password harus diisi',
            'password.confirmed' => 'Password Tidak Cocok',
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        // ✨ Tentukan role berdasarkan email
        if (str_ends_with($user->email, '@owner.com')) {
            $user->assignRole('owner');
        } else {
            $user->assignRole('buyer');
        }

        event(new Registered($user));

        Auth::login($user);

        return redirect()->route('front.index')->with('success', 'Akun berhasil dibuat, selamat datang!');

    }
}
