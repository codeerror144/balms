<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Log;

class StudentController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }public function index()
    {
        // Fetch log records for the authenticated user grouped by date
        $logLabels = Log::where('user_id', Auth::id())
            ->selectRaw('DATE(log_time) as log_date')
            ->groupBy('log_date')
            ->orderBy('log_date', 'asc')
            ->pluck('log_date'); // Get unique dates as labels
    
        $logCounts = $logLabels->map(function ($date) {
            return Log::where('user_id', Auth::id())
                ->whereDate('log_time', $date)
                ->count(); // Count logs for each date
        });
    
        // Data for Pie Chart
        $logTypeLabels = Log::where('user_id', Auth::id())
            ->select('log_type')
            ->distinct()
            ->pluck('log_type'); // Get unique log types
    
        $logTypeCounts = $logTypeLabels->map(function ($type) {
            return Log::where('user_id', Auth::id())
                ->where('log_type', $type)
                ->count(); // Count logs for each type
        });
    
        // Return the view with data for both charts
        return view('Student.index', compact('logLabels', 'logCounts', 'logTypeLabels', 'logTypeCounts'));
    }
    

    public function logHistory(Request $request)
{
    // Fetch the search term from the request (date filter)
    $searchDate = $request->input('search');

    // Fetch log records for the authenticated user, with pagination and optional filtering by date
    $logs = Log::where('user_id', Auth::id())
        ->when($searchDate, function ($query) use ($searchDate) {
            $query->whereDate('log_time', $searchDate);
        })
        ->orderBy('log_time', 'desc')
        ->paginate(10); // 10 records per page

    // Return the log history view with logs
    return view('Student.log_history', compact('logs'));
}

}
