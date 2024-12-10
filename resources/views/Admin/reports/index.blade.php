@extends('layouts.Admin.default')

@section('content')

<div class="container-fluid mt-4">
    <!-- Page Header -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="text-primary"><i class="fas fa-file-alt"></i> Logs Report</h3>
        <div class="d-flex gap-2">
            <a href="{{ route('log.export', ['format' => 'csv', 'search' => request()->input('search'), 'start_date' => request()->input('start_date'), 'end_date' => request()->input('end_date'), 'user_type' => request()->input('user_type')]) }}" class="btn btn-secondary btn-sm shadow-sm">
                <i class="fas fa-file-export"></i> Export
            </a>
            <a href="{{ route('adminattendancereports') }}" class="btn btn-primary btn-sm shadow-sm">
                <i class="fas fa-users"></i> Employee Attendance
            </a>
        </div>
    </div>

    <!-- Filters Section -->
    <div class="card shadow mb-4">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0"><i class="fas fa-filter"></i> Filters</h4>
        </div>
        <div class="card-body">
            <form action="{{ route('adminreports') }}" method="GET" class="row g-3 align-items-center">
                <div class="col-lg-3 col-md-6">
                    <label for="start_date" class="form-label">Start Date</label>
                    <input type="date" name="start_date" id="start_date" class="form-control form-control-sm" value="{{ request()->input('start_date') }}">
                </div>
                <div class="col-lg-3 col-md-6">
                    <label for="end_date" class="form-label">End Date</label>
                    <input type="date" name="end_date" id="end_date" class="form-control form-control-sm" value="{{ request()->input('end_date') }}">
                </div>
                <div class="col-lg-6 col-md-12">
                    <label for="user_type" class="form-label">User Type</label>
                    <div class="input-group input-group-sm">
                        <select name="user_type" id="user_type" class="form-select">
                            <option value="">All User Types</option>
                            <option value="student" {{ request()->input('user_type') == 'student' ? 'selected' : '' }}>Student</option>
                            <option value="employee" {{ request()->input('user_type') == 'employee' ? 'selected' : '' }}>Employee</option>
                        </select>
                        <button type="submit" class="btn btn-primary shadow-sm">
                            </i> Filter
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- Logs Table -->
    <div class="card shadow">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0"><i class="fas fa-table"></i> Detailed Log Entries</h4>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead class="table-primary">
                        <tr>
                            <th>Name</th>
                            <th>Type</th>
                            <th>Room</th>
                            <th>Log Time</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse ($logs as $log)
                            <tr>
                                <td>{{ $log->user->name }}</td>
                                <td>{{ ucfirst($log->user->type) }}</td>
                                <td>{{ $log->room }}</td>
                                <td>{{ $log->log_time }}</td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="4" class="text-center">No log entries found.</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
            <!-- Pagination -->
            <div class="d-flex justify-content-center mt-3">
                {{ $logs->links() }}
            </div>
        </div>
    </div>
</div>

@endsection
