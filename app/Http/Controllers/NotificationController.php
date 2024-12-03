<?php

namespace App\Http\Controllers;

use App\Models\Notification;
use Illuminate\Http\Request;

class NotificationController extends Controller
{
    // Display all notifications for the admin dashboard
    public function index()
    {
        $notifications = Notification::latest()->get(); // Get all notifications
        return view('admin.notifications.index', compact('notifications'));
    }

    // Display a single notification
    public function show($id)
    {
        $notification = Notification::findOrFail($id);

        // Mark it as read when viewed
        $notification->update(['status' => 'read']);

        return view('admin.notifications.show', compact('notification'));
    }

    // Mark notification as read
    public function markAsRead($id)
    {
        $notification = Notification::findOrFail($id);
        $notification->update(['status' => 'read']);

        return redirect()->route('admin.notifications.index');
    }

    // Create a notification for an unknown user
    public function createUnknownUserNotification($imageName)
    {
        Notification::create([
            'title' => 'Unknown User Detected',
            'status' => 'unread',
            'image' => $imageName, // Image filename
        ]);
    }
}
