@extends('layouts.Admin.default')

@section('content')

<div class="container-fluid mt-4">
    <!-- Page Header -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="text-primary"><i class="fas fa-user-check"></i> Attendance Report</h3>
        <div class="d-flex gap-2">
            <a href="{{ route('export.attendance', ['format' => 'csv']) }}" class="btn btn-secondary btn-sm shadow-sm">
                <i class="fas fa-file-export"></i> Export
            </a>
            <a href="{{ route('adminreports') }}" class="btn btn-primary btn-sm shadow-sm">
                <i class="fas fa-history"></i> Log History
            </a>
        </div>
    </div>

    <!-- Filters Section -->
    <div class="card shadow mb-4">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0"><i class="fas fa-filter"></i> Filters</h4>
        </div>
        <div class="card-body">
            <form action="{{ route('adminattendancereports') }}" method="GET" class="row g-3">
                <div class="col-lg-4 col-md-6">
                    <label for="start_date" class="form-label">Start Date</label>
                    <div class="input-group input-group-sm">
                        <input type="date" name="start_date" id="start_date" class="form-control" value="{{ request()->input('start_date') }}">
                        <span class="input-group-text bg-primary text-white"><i class="fas fa-calendar-alt"></i></span>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <label for="end_date" class="form-label">End Date</label>
                    <div class="input-group input-group-sm">
                        <input type="date" name="end_date" id="end_date" class="form-control" value="{{ request()->input('end_date') }}">
                        <span class="input-group-text bg-primary text-white"><i class="fas fa-calendar-alt"></i></span>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <label for="search" class="form-label">Search Name</label>
                    <div class="input-group input-group-sm">
                        <input type="text" name="search" id="search" class="form-control" placeholder="Search..." value="{{ request()->input('search') }}">
                        <button class="btn btn-primary btn-sm shadow-sm" type="submit">
                            <i class="fas fa-search"></i> Filter
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- Attendance Table -->
    <div class="card shadow">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0"><i class="fas fa-table"></i> Attendance Records</h4>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead class="table-primary">
                        <tr>
                            <th>Name</th>
                            <th>Login Time</th>
                            <th>Logout Time</th>
                           
                        </tr>
                    </thead>
                    <tbody>
                        @forelse ($attendances as $attendance)
                            <tr>
                                <td>{{ $attendance->user->name }}</td>
                                <td>{{ $attendance->login_time }}</td>
                                <td>{{ $attendance->logout_time }}</td>
                                
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
                {{ $attendances->links() }}
            </div>
        </div>
    </div>
</div>

@endsection
