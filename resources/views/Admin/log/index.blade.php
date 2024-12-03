@extends('layouts.Admin.default')

@section('content')
<div class="container-fluid mt-4">
    <!-- Page Header -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="text-primary"><i class="fas fa-history"></i> History Logs</h3>
    </div>

    <!-- Search and Attendance History Section -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <!-- Attendance History Button -->
        <a href="{{ route('admin.attendance.index') }}" class="btn btn-primary btn-sm shadow-sm">
            <i class="fas fa-calendar-alt"></i> Attendance History
        </a>

        <!-- Search Bar -->
        <form action="{{ route('adminlog') }}" method="GET" style="width: auto;">
            <div class="input-group" style="width: 300px;"> <!-- Fixed width -->
                <input type="text" name="search" class="form-control search-input" placeholder="Search..." value="{{ request('search') }}">
                <button class="btn search-button" type="submit">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </form>
    </div>

    <!-- Logs Table -->
    <div class="card shadow">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0"><i class="fas fa-table"></i> Logs</h4>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead class="table-primary">
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Type</th>
                            <th>Room</th>
                            <th>Log Time</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($logs as $index => $log)
                            <tr>
                                <td>{{ $logs->firstItem() + $index }}</td>
                                <td>{{ $log->user->name }}</td>
                                <td>{{ ucfirst($log->user->type) }}</td>
                                <td>{{ $log->room }}</td>
                                <td>{{ $log->log_time }}</td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="5" class="text-center">No log entries found.</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>

            <!-- Pagination -->
            <div class="d-flex justify-content-center mt-3">
                {{ $logs->links('pagination::bootstrap-4') }}
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

    .d-flex.justify-content-between {
        gap: 15px; /* Spacing between Attendance History button and Search bar */
    }
</style>
@endsection
