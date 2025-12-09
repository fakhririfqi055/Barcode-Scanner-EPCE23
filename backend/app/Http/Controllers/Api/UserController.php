<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function index()
    {
        return User::all();
    }

    public function store(Request $request)
    {
        $request->validate([
            'username' => 'required|unique:users',
            'password' => 'required|min:6',
            'role'     => 'required|in:admin,kasir,manager',
        ]);

        $user = User::create([
            'username' => $request->username,
            'password' => Hash::make($request->password),
            'role'     => $request->role,
        ]);

        return response()->json($user, 201);
    }

    public function show($id)
    {
        return User::findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $user = User::findOrFail($id);

        $user->update([
            'username' => $request->username ?? $user->username,
            'password' => $request->password ? Hash::make($request->password) : $user->password,
            'role'     => $request->role ?? $user->role,
        ]);

        return response()->json($user);
    }

    public function destroy($id)
    {
        User::destroy($id);
        return response()->json(['message' => 'User deleted']);
    }
}
