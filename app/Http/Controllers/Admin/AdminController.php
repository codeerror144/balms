<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Log;
use App\Models\Attendance;
use App\Models\Notification;

class AdminController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    {
        // Retrieve totals
        $totalStudents = User::where('type', 'student')->count();
        $totalEmployees = User::where('type', 'employee')->count();
    
        // Count active users based on recent log entries
        $activeUsers = Log::whereNotNull('log_time')->count();
    
        // Count log entries within the last day
        $recentEntriesCount = Log::where('log_time', '>=', now()->subDay())->count();
    
        // Count distinct users who logged in today
        $loggedInToday = Log::whereDate('log_time', today())->distinct('user_id')->count();
    
        // Total log entries
        $totalLog = Log::count();
    
        // Prepare graph data for the past 7 days
        $dates = [];
        $logEntries = [];
        for ($i = 0; $i < 7; $i++) {
            $date = now()->subDays($i)->toDateString();
            $dates[] = $date;
            $logEntries[] = Log::whereDate('log_time', $date)->count();
        }
    
        // Fetch attendance data for the past 7 days
        $attendanceDates = [];
        $attendanceCounts = [];
        for ($i = 0; $i < 7; $i++) {
            $date = now()->subDays($i)->toDateString();
            $attendanceDates[] = $date;
            $attendanceCounts[] = Attendance::whereDate('login_time', $date)->count();
        }
    
        // Fetch recent log entries (optional, for table display)
        $logs = Log::with('user')->latest()->take(10)->get(); // Get the last 10 log entries
    
        // Fetch unread notifications
        $notifications = Notification::where('status', 'unread')->get();
    
        // Pass data to the view
        return view('Admin.index', compact(
            'totalStudents', 
            'totalEmployees', 
            'totalLog', 
            'activeUsers',
            'recentEntriesCount', 
            'loggedInToday', 
            'dates', 
            'logEntries', 
            'attendanceDates', 
            'attendanceCounts', 
            'notifications', 
            'logs' // Added $logs for the view
        ));
    }
}    