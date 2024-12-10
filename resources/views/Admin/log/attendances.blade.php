@extends('layouts.Admin.default')

@section('content')
<div class="container-fluid mt-4">
    <!-- Page Header -->
    <div class="d-flex flex-wrap justify-content-between align-items-center mb-4">
        <!-- Back to Log History Button -->
        <a href="{{ route('adminlog') }}" class="btn btn-secondary btn-sm shadow-sm mb-2 mb-md-0">
            Back to Log History
        </a>
        
        <!-- Search Section -->
        <form action="{{ route('admin.attendance.index') }}" method="GET" class="d-flex w-auto">
    <div class="input-group" style="max-width: 300px; width: 100%;">
        <input type="text" name="search" class="form-control search-input" placeholder="Search..." value="{{ request()->input('search') }}">
        <button class="btn search-button" type="submit">
            <i class="fas fa-search"></i>
        </button>
    </div>
</form>

    </div>
    
    <!-- Attendance Header -->
    <h3 class="text-primary mb-4"><i class="fas fa-calendar-alt"></i> Attendance History</h3>

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
    border: none;
    border-right: none;
    border-radius: 25px 0 0 25px;
    height: 40px;
    font-size: 16px;
    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
    max-width: 300px; /* Set a maximum width */
    width: 100%; /* Ensure it adapts within the parent container */
}

    .search-button {
        border: none;
        border-left: none;
        border-radius: 0 25px 25px 0;
        height: 40px;
        background-color: #0056b3;
        color: #fff;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 0 15px;
        box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
    }

    .search-button:hover {
        background-color: #003d80;
    }

    .btn-secondary {
        background-color: #6c757d;
        color: #fff;
    }

    .btn-secondary:hover {
        background-color: #5a6268;
    }

    @media (max-width: 768px) {
        .d-flex.flex-wrap {
            gap: 15px;
        }

        .search-input {
            width: 100%;
        }

        .search-button {
            width: auto;
        }
    }
</style>
@endsection
