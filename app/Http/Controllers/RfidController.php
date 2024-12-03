<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Biometric;
use App\Models\User;

class RfidController extends Controller
{
    public function saveRFID(Request $request, $userId)
    {
        $request->validate([
            'rfid_data' => 'required|string',
        ]);

        // Retrieve the user by ID
        $user = User::findOrFail($userId);

        // Update or create a biometric record for the user with the new RFID data
        $user->biometric()->updateOrCreate(
            ['user_id' => $userId], // Match on user_id to ensure uniqueness
            ['rfid_data' => $request->rfid_data] // Save the RFID data
        );

        return redirect()->back()->with('success', 'RFID registered successfully.');
    }
}
