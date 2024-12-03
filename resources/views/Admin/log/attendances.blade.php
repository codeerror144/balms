@extends('layouts.Admin.default')

@section('content')
<div class="container-fluid mt-4">
    <!-- Page Header -->
    <div class="d-flex justify-content-between align-items-center mb-4">
   
        <!-- Back to Log History Button -->
        <a href="{{ route('adminlog') }}" class="btn btn-secondary btn-sm shadow-sm">
            Back to Log History
        </a>
    </div>
    
    <!-- Search Section -->

    <div class="d-flex justify-content-between align-items-center mb-4">
    <h3 class="text-primary"><i class="fas fa-calendar-alt"></i> Attendance History</h3>
    <form action="{{ route('admin.attendance.index') }}" method="GET" style="width: auto;">
        <div class="input-group" style="width: 300px;"> <!-- Fixed width -->
            <input type="text" name="search" class="form-control search-input" placeholder="Search..." value="{{ request()->input('search') }}">
            <button class="btn search-button" type="submit">
                <i class="fas fa-search"></i>
            </button>
        </div>
    </form>
</div>


    <!-- Attendance Table -->
    <div class="card shadow">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0"><i class="fas fa-table"></i> Attendance Records</h4>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead class="table-secondary">
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Login Time</th>
                            <th>Logout Time</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($attendances as $index => $attendance)
                            <tr>
                                <td>{{ $attendances->firstItem() + $index }}</td>
                                <td>{{ $attendance->user->name }}</td>
                                <td>{{ $attendance->login_time }}</td>
                                <td>{{ $attendance->logout_time ?? 'N/A' }}</td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="4" class="text-center">No attendance records found.</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>

            <!-- Pagination -->
            <div class="d-flex justify-content-center mt-3">
                {{ $attendances->links('pagination::bootstrap-4') }}
            </div>
        </div>
    </div>
</div>

<!-- CSS -->
<style>
    .search-input {
        border: none; /* Remove border */
        border-right: none; /* Ensure no right border */
        border-radius: 25px 0 0 25px; /* Rounded left side */
        height: 40px; /* Adjust height */
        font-size: 16px; /* Font size for text */
        box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1); /* Optional subtle shadow for depth */
    }

    .search-button {
        border: none; /* Remove border */
        border-left: none; /* Ensure no left border */
        border-radius: 0 25px 25px 0; /* Rounded right side */
        height: 40px; /* Adjust height */
        background-color: #0056b3; /* Blue button color */
        color: #fff; /* White text */
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 0 15px; /* Padding for spacing */
        box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1); /* Optional subtle shadow for depth */
    }

    .search-button:hover {
        background-color: #003d80; /* Darker blue on hover */
    }

    .btn-secondary {
        background-color: #6c757d; /* Bootstrap default secondary color */
        color: #fff;
    }

    .btn-secondary:hover {
        background-color: #5a6268; /* Darker gray for hover effect */
    }

    .d-flex.justify-content-between {
        gap: 15px; /* Spacing between Back button and Search bar */
    }
</style>
@endsection
