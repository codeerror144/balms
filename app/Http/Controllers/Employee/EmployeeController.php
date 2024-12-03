<?php

namespace App\Http\Controllers\Employee;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Log;
use App\Models\Attendance;

class EmployeeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        // Fetch log records for the authenticated user
        $logs = Log::where('user_id', Auth::id())->get();

        // Fetch attendance records for the authenticated user
        $attendance = Attendance::where('user_id', Auth::id())->get();

        // Prepare data for log history (group by date)
        $logHistory = Log::where('user_id', Auth::id())
                        ->selectRaw('DATE(log_time) as date, count(*) as count')
                        ->groupBy('date')
                        ->orderBy('date', 'asc')
                        ->pluck('count', 'date');

        // Prepare data for attendance history (group by date)
        $attendanceHistory = Attendance::where('user_id', Auth::id())
                                       ->selectRaw('DATE(login_time) as date, count(*) as count')
                                       ->groupBy('date')
                                       ->orderBy('date', 'asc')
                                       ->pluck('count', 'date');

        // Pass data to the view
        return view('Employee.index', compact('logs', 'attendance', 'logHistory', 'attendanceHistory'));
    }
    public function logHistory()
{
    // Fetch log records for the authenticated user (paginate 10 per page)
    $logs = Log::where('user_id', Auth::id())->paginate(10);

    // Fetch attendance records for the authenticated user (paginate 10 per page)
    $attendance = Attendance::where('user_id', Auth::id())->paginate(10);

    // Return the log history view with both logs and attendance records
    return view('Employee.log_history', compact('logs', 'attendance'));
}
}
