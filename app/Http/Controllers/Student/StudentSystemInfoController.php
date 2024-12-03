<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class StudentSystemInfoController extends Controller
{
    // Method to display the system information page
    public function index()
    {
        return view('Student.system_info'); // Ensure this matches the Blade template name
    }
}
