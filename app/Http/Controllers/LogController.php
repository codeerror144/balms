<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Log;
use App\Models\Attendance;
use App\Models\User;
use Illuminate\Support\Facades\DB;

class LogController extends Controller
{
    public function index(Request $request)
    {
        $searchTerm = $request->input('search');

        $logs = Log::with('user')
            ->when($searchTerm, function ($query) use ($searchTerm) {
                $query->whereHas('user', function ($q) use ($searchTerm) {
                    $q->where('name', 'like', '%' . $searchTerm . '%');
                });
            })
            ->orderBy('log_time', 'desc')
            ->paginate(10);

        return view('Admin.log.index', compact('logs'));
    }

    public function deleteLog($id)
    {
        $log = Log::findOrFail($id);
        $log->delete();

        $this->resetAutoIncrement('logs');

        return redirect()->route('adminlog')->with('success', 'Log deleted successfully.');
    }

    protected function resetAutoIncrement($tableName)
    {
        $maxId = DB::table($tableName)->max('id') ?? 0;
        try {
            DB::statement("ALTER TABLE $tableName AUTO_INCREMENT = " . ($maxId + 1));
        } catch (\Exception $e) {
            \Log::error("Failed to reset auto-increment: " . $e->getMessage());
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

    public function receiveLogs(Request $request)
    {
        // Validate incoming request
        $validatedData = $request->validate([
            'user_id' => 'required|integer',
            'room' => 'required|string|max:255',
            'log_time' => 'required|date',
            'type' => 'required|string|max:255',
        ]);

        // Save the log to the database
        $log = new Log();
        $log->user_id = $validatedData['user_id'];
        $log->room = $validatedData['room'];
        $log->log_time = $validatedData['log_time'];
        $log->type = $validatedData['type'];
        $log->save();

        return response()->json(['message' => 'Log received successfully!'], 201);
    }

        public function receiveAttendances(Request $request)
    {
        // Validate incoming request
        $validatedData = $request->validate([
            'user_id' => 'required|integer',
            'login_time' => 'required|date',
            'logout_time' => 'required|date',
            'session' => 'required|string|max:255',
        ]);

        
        $attendances = new Attendance();
        $attendances->user_id = $validatedData['user_id'];
        $attendances->login_time = $validatedData['login_time'];
        $attendances->logout_time = $validatedData['logout_time'];
        $attendances->save();

        return response()->json(['message' => 'Attendance received successfully!'], 201);
    }
}
