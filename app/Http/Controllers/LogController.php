<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Log;
use App\Models\Attendance;
use App\Models\User;
use Illuminate\Support\Facades\DB;

class LogController extends Controller
{
    // Method to display log page with search, pagination, and graph data
    public function index(Request $request)
    {
        // Handle search query
        $searchTerm = $request->input('search');

        // Paginate log records (10 per page)
        $logs = Log::with('user')
            ->when($searchTerm, function ($query) use ($searchTerm) {
                return $query->whereHas('user', function ($q) use ($searchTerm) {
                    $q->where('name', 'like', '%' . $searchTerm . '%')
                      ->orWhere('type', 'like', '%' . $searchTerm . '%');
                });
            })
            ->orderBy('log_time', 'desc') // Update column to log_time
            ->paginate(10)
            ->appends(['search' => $searchTerm]); // Maintain search term in pagination links

        // Aggregate data for bar graph
        $rooms = Log::select('room')->distinct()->pluck('room');
        $logCounts = $rooms->map(function ($room) {
            return Log::where('room', $room)->count(); // Count all log events in the room
        });

        // Pass logs, search term, and graph data to the view
        return view('Admin.log.index', compact('logs', 'searchTerm', 'rooms', 'logCounts'));
    }

    // Method to delete log record
    public function deleteLog($id)
    {
        // Find log record by ID
        $log = Log::findOrFail($id);

        // Delete the log record
        $log->delete();

        // Reset auto-increment for logs table
        $this->resetAutoIncrement('logs');

        // Redirect back with success message
        return redirect()->route('admin.log.index')->with('success', 'Log record deleted successfully!');
    }

    // Method to reset auto-increment value with error handling
    protected function resetAutoIncrement($tableName)
    {
        // Get the max ID in the table or set to 1 if empty
        $maxId = DB::table($tableName)->max('id') ?? 0;

        // Attempt to reset the AUTO_INCREMENT value
        try {
            DB::statement("ALTER TABLE $tableName AUTO_INCREMENT = " . ($maxId + 1) . ";");
        } catch (\Exception $e) {
            // Log error or handle it as needed
            \Log::error("Failed to reset auto-increment on $tableName: " . $e->getMessage());
        }
    }

    public function attendanceIndex(Request $request)
    {
        // Handle search query for attendance
        $searchTerm = $request->input('search');

        // Paginate attendance records (10 per page)
        $attendances = Attendance::with('user')
            ->when($searchTerm, function ($query) use ($searchTerm) {
                return $query->whereHas('user', function ($q) use ($searchTerm) {
                    $q->where('name', 'like', '%' . $searchTerm . '%');
                });
            })
            ->orderBy('login_time', 'desc')
            ->paginate(10)
            ->appends(['search' => $searchTerm]);

        return view('Admin.log.attendances', compact('attendances', 'searchTerm'));
    }
}
