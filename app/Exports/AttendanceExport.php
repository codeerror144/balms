<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Illuminate\Support\Collection;

class AttendanceExport implements FromCollection, WithHeadings
{
    protected $attendances;

    public function __construct($attendances)
    {
        $this->attendances = $attendances;
    }

    public function collection()
    {
        // Map the attendance data to include user name
        return $this->attendances->map(function ($attendance) {
            return [
                'Name' => $attendance->user->name, // Include the user's name
                'Login Time' => $attendance->login_time,
                'Logout Time' => $attendance->logout_time ?? 'N/A',
            ];
        });
    }

    public function headings(): array
    {
        // Add headings for the export
        return [
            'Name',
            'Login Time',
            'Logout Time',
        ];
    }
}
