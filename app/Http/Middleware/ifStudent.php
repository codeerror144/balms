<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\UserRole;

class ifStudent
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */

public function handle(Request $request, Closure $next)
{
    if (Auth::check() && Auth::user()->role_id == 3) { // Assuming '3' is the Student role
        return $next($request);
    }

    return redirect('/login'); // Redirect if not a student
}
}
