<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Log;
use App\Models\UserRole;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use App\Models\Notification;

class UserListController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    {
        $search = $request->input('search');
        $user_roles = UserRole::all(); // Fetch roles for the dropdown

        $users = User::with('role') // Ensure role relationship is loaded
            ->when($search, function ($query) use ($search) {
                return $query->where('name', 'like', '%' . $search . '%')
                             ->orWhere('type', 'like', '%' . $search. '%')
                             ->orWhere('email', 'like', '%' . $search . '%');
            })
            ->orderBy('id', 'ASC')
            ->paginate(10);

        return view('Admin.user.index', compact('users', 'user_roles')); // Pass roles to the view
    }

    public function saveUser(Request $request)
    {
        // Validate the incoming request data
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users',
            'password' => 'required|string|min:6|confirmed', // This ensures the confirmation
            'role_id' => 'required|exists:user_roles,id', // Ensure role_id exists in user_roles
        ]);

        // Get the role name based on role_id
        $role = UserRole::findOrFail($request->role_id);

        // Create the new user
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password), // Hash the password before saving
            'type' => $role->role_name, // Assign role_name to type
            'role_id' => $role->id,
        ]);

        // Redirect with success message
        return redirect()->route('adminuser')->with('success', 'User added successfully!');
    }

    public function updateUser(Request $request, $id)
    {
        // Validate the incoming request data
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email,' . $id, // Ensure the email is unique except for the current user
            'password' => 'nullable|string|min:6|confirmed', // Only validate password if it's provided
            'role_id' => 'required|exists:user_roles,id', // Ensure role_id exists in user_roles
        ]);

        // Find the user by ID
        $user = User::findOrFail($id);

        // Get the role name based on role_id
        $role = UserRole::findOrFail($request->role_id);

        // Update user data
        $user->name = $request->name;
        $user->email = $request->email;
        $user->type = $role->role_name; // Assign the role name to type
        $user->role_id = $role->id;

        // Check if the password field is filled, then hash and update the password
        if ($request->filled('password')) {
            $user->password = Hash::make($request->password);
        }

        // Save the updated user data
        $user->save();

        // Redirect with success message
        return redirect()->route('adminuser')->with('success', 'User updated successfully!');
    }

    public function deleteUser($id)
{
    $user = User::findOrFail($id);

    // Delete associated Log records
    Log::where('user_id', $id)->delete();

    // Delete associated attendance records
    DB::table('attendances')->where('user_id', $id)->delete(); // Delete attendance records related to the user

    // Delete associated face image if it exists
    $imagePath = public_path('uploads/' . $user->id . '.png'); // Adjust extension if necessary
    if (file_exists($imagePath)) {
        unlink($imagePath); // Delete the image file
    }

    // Delete the user record
    $user->delete();

    // Reset auto-increment for users
    $this->resetAutoIncrement('users');

    // Redirect with success message
    return redirect()->route('adminuser')->with('success', 'User and associated records deleted successfully!');
}

    public function resetAutoIncrement()
    {
        DB::statement("ALTER TABLE users AUTO_INCREMENT = 1;");
        DB::statement("ALTER TABLE user_roles AUTO_INCREMENT = 1;");
        DB::statement("ALTER TABLE biometrics AUTO_INCREMENT = 1;");
        DB::statement("ALTER TABLE attendances AUTO_INCREMENT = 1;");

    }
}
