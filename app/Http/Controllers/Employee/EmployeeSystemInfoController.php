<?php

namespace App\Http\Controllers\Employee;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class EmployeeSystemInfoController extends Controller
{
    // Method to display the system information page
    public function index()
    {
        return view('Employee.system_info'); // Ensure this matches the Blade template name
    }
}
