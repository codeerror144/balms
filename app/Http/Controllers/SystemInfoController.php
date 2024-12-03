<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class SystemInfoController extends Controller
{
    // Method to display the system information page
    public function index()
    {
        return view('Admin.system_info.index'); // Ensure this matches the Blade template name
    }
}
