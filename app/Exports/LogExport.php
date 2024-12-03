<?php

namespace App\Exports;

use App\Models\Log;
use Barryvdh\DomPDF\Facade as PDF;
use App\Models\User;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class LogExport implements FromCollection, WithHeadings, WithMapping
{
    protected $logs;

    // Constructor to accept the log records
    public function __construct($logs)
    {
        $this->logs = $logs; // Store log records
    }

    /**
     * Return the collection of log records
     *
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        return $this->logs; // Return the stored log records
    }

    /**
     * Define the headings for the Excel sheet
     *
     * @return array
     */
    public function headings(): array
    {
        return [
            'ID',
            'Name',
            'Type',
            'User ID',
            'Log Time',
            'Log Type',
            // Add more headings as necessary
        ];
    }

    /**
     * Map the log records to the headings defined
     *
     * @param mixed $log
     * @return array
     */
    public function map($log): array
    {
        // Fetch the user details based on user_id
        $user = User::find($log->user_id);

        return [
            $log->id,
            $user ? $user->name : 'N/A', // Use 'N/A' if user is not found
            $user ? $user->type : 'N/A', // Use 'N/A' if user is not found
            $log->user_id,
            $log->log_time,
            $log->log_type,

        ];
    }
}
