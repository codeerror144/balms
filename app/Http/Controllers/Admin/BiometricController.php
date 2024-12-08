<?php


namespace App\Http\Controllers\Admin;


use App\Models\Biometric;
use App\Models\User; // Import the User model to check the user type
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use App\Http\Controllers\Controller;
use App\Models\Notification;


class BiometricController extends Controller
{


    public function saveCapturedFacialData(Request $request)
{
    $request->validate([
        'user_id' => 'required|exists:users,id',
        'captured_image' => 'required', // Base64 encoded image
    ]);


    $userId = $request->input('user_id');
    $capturedImage = $request->input('captured_image');
    $decodedImage = base64_decode(preg_replace('#^data:image/\w+;base64,#i', '', $capturedImage));


    // Save the image to uploads/faces
    $path = public_path('uploads/');
    if (!File::exists($path)) {
        File::makeDirectory($path, 0755, true);
    }


    $filename = 'face_' . $userId . '_' . time() . '.png';
    $filePath = $path . $filename;
    File::put($filePath, $decodedImage);


    // Update or create biometric data
    $existingFacialData = Biometric::where('user_id', $userId)->first();
    if ($existingFacialData) {
        $existingFacialData->update(['captured_image' => 'uploads/' . $filename]);
        session()->flash('success', 'Facial Data updated successfully!');
    } else {
        Biometric::create([
            'user_id' => $userId,
            'captured_image' => 'uploads/' . $filename,
        ]);
        session()->flash('success', 'Facial Data added successfully!');
    }


    return redirect()->back(); // Redirect back to the previous page
}
}



