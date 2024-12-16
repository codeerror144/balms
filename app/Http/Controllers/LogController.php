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
}
