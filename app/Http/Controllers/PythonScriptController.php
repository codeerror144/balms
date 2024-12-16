<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class PythonScriptController extends Controller
{
    private $pythonBackendUrl;

    public function __construct()
    {
        // Get the Python backend URL from the .env file
        $this->pythonBackendUrl = env('PYTHON_BACKEND_URL', 'http://127.0.0.1:5000'); // Fallback to localhost if not set
    }

    public function fetchRfidUid()
    {
        try {
            $response = Http::get("{$this->pythonBackendUrl}/fetch-rfid-uid");

            if ($response->successful()) {
                return response()->json($response->json());
            } else {
                return response()->json(['error' => 'Failed to fetch RFID UID'], $response->status());
            }
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function logbook()
    {
        try {
            $response = Http::get("{$this->pythonBackendUrl}/logbook");

            if ($response->successful()) {
                return response()->json($response->json());
            } else {
                return response()->json(['error' => 'Failed to fetch logbook data'], $response->status());
            }
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function attendance()
    {
        try {
            $response = Http::get("{$this->pythonBackendUrl}/attendance");

            if ($response->successful()) {
                return response()->json($response->json());
            } else {
                return response()->json(['error' => 'Failed to start attendance monitoring'], $response->status());
            }
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
