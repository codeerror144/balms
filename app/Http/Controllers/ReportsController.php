<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Log;
use App\Models\Attendance;
use Maatwebsite\Excel\Facades\Excel; // For CSV export
use App\Exports\LogExport; // Custom export class for Log
use App\Exports\AttendanceExport; // Custom export class for Attendance
use Barryvdh\DomPDF\Facade\Pdf;




class ReportsController extends Controller
{
    // Method to display paginated log report
    public function index(Request $request)
    {
        $searchTerm = $request->input('search');
        $startDate = $request->input('start_date');
        $endDate = $request->input('end_date');
        $userType = $request->input('user_type');

        $logs = Log::with('user')
            ->when($searchTerm, function ($query) use ($searchTerm) {
                return $query->whereHas('user', function ($q) use ($searchTerm) {
                    $q->where('name', 'like', '%' . $searchTerm . '%')
                      ->orWhere('type', 'like', '%' . $searchTerm . '%');
                });
            })
            ->when($startDate, function ($query) use ($startDate) {
                return $query->whereDate('log_time', '>=', $startDate);
            })
            ->when($endDate, function ($query) use ($endDate) {
                return $query->whereDate('log_time', '<=', $endDate);
            })
            ->when($userType, function ($query) use ($userType) {
                return $query->whereHas('user', function ($q) use ($userType) {
                    $q->where('type', $userType);
                });
            })
            ->paginate(10);

        $totalLog = $logs->total();
        $logPercentage = $totalLog > 0 ? ($logs->count() / $totalLog) * 100 : 0;

        return view('Admin.reports.index', compact('logs', 'totalLog', 'logPercentage'));
    }

    // Method to export log reports
    public function export(Request $request, $format)
    {
        $logs = Log::with('user')
            ->when($request->input('search'), function ($query) use ($request) {
                $searchTerm = $request->input('search');
                return $query->whereHas('user', function ($q) use ($searchTerm) {
                    $q->where('name', 'like', '%' . $searchTerm . '%')
                      ->orWhere('type', 'like', '%' . $searchTerm . '%');
                });
            })
            ->when($request->input('start_date'), function ($query) use ($request) {
                return $query->whereDate('log_time', '>=', $request->input('start_date'));
            })
            ->when($request->input('end_date'), function ($query) use ($request) {
                return $query->whereDate('log_time', '<=', $request->input('end_date'));
            })
            ->get();

        if ($format === 'csv') {
            return Excel::download(new LogExport($logs), 'log_report.csv');
        }

        return redirect()->route('adminreports')->with('error', 'Invalid export format.');
    }

    // Method to display attendance reports
    public function attendanceReports(Request $request)
    {
        $searchTerm = $request->input('search');
        $startDate = $request->input('start_date');
        $endDate = $request->input('end_date');

        $attendances = Attendance::with('user')
            ->when($searchTerm, function ($query) use ($searchTerm) {
                return $query->whereHas('user', function ($q) use ($searchTerm) {
                    $q->where('name', 'like', '%' . $searchTerm . '%');
                });
            })
            ->when($startDate, function ($query) use ($startDate) {
                return $query->whereDate('login_time', '>=', $startDate);
            })
            ->when($endDate, function ($query) use ($endDate) {
                return $query->whereDate('login_time', '<=', $endDate);
            })
            ->paginate(10);

        // Use a separate view for attendance reports
        return view('Admin.reports.attendance', compact('attendances'));
    }

    // Method to export attendance reports
    public function exportAttendance(Request $request, $format)
    {
        $attendances = Attendance::with('user')
            ->when($request->input('search'), function ($query) use ($request) {
                $searchTerm = $request->input('search');
                return $query->whereHas('user', function ($q) use ($searchTerm) {
                    $q->where('name', 'like', '%' . $searchTerm . '%');
                });
            })
            ->when($request->input('start_date'), function ($query) use ($request) {
                return $query->whereDate('login_time', '>=', $request->input('start_date'));
            })
            ->when($request->input('end_date'), function ($query) use ($request) {
                return $query->whereDate('login_time', '<=', $request->input('end_date'));
            })
            ->get();

        if ($format === 'csv') {
            return Excel::download(new AttendanceExport($attendances), 'attendance_report.csv');
        }

        return redirect()->route('adminattendancereports')->with('error', 'Invalid export format.');
    }


   
public function exportToPdf(Request $request)
{
    // Fetch attendance data based on filters
    $attendances = Attendance::with('user')
        ->when($request->start_date, function ($query) use ($request) {
            $query->whereDate('login_time', '>=', $request->start_date);
        })
        ->when($request->end_date, function ($query) use ($request) {
            $query->whereDate('logout_time', '<=', $request->end_date);
        })
        ->when($request->search, function ($query) use ($request) {
            $query->whereHas('user', function ($userQuery) use ($request) {
                $userQuery->where('name', 'like', '%' . $request->search . '%');
            });
        })
        ->get();

    // Pass data to PDF view
    $pdf = Pdf::loadView('Admin.reports.attendance_pdf', compact('attendances'));

    // Return PDF for download
    return $pdf->download('attendance_report.pdf');
}

}
