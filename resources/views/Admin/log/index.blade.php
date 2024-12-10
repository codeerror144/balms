@extends('layouts.Admin.default')

@section('content')
<div class="container-fluid mt-4">
    <!-- Page Header -->
    <div class="d-flex flex-wrap justify-content-between align-items-center mb-4">
        <h3 class="text-primary"><i class="fas fa-history"></i> History Logs</h3>
    </div>

    <!-- Search and Attendance History Section -->
    <div class="d-flex flex-wrap justify-content-between align-items-center mb-4">
        <!-- Attendance History Button -->
        <a href="{{ route('admin.attendance.index') }}" class="btn btn-primary btn-sm shadow-sm mb-2 mb-md-0">
            <i class="fas fa-calendar-alt"></i> Attendance History
        </a>

        <!-- Search Bar -->
        <form action="{{ route('adminlog') }}" method="GET" class="d-flex w-100 w-md-auto">
            <div class="input-group flex-grow-1 flex-md-grow-0">
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
        border: none;
        border-right: none;
        border-radius: 25px 0 0 25px;
        height: 40px;
        font-size: 16px;
        box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
        width: 100%; /* Dynamic width */
        max-width: 300px; /* Max width to avoid overflow */
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

    .d-flex.flex-wrap {
        gap: 15px;
    }

    @media (max-width: 768px) {
        .search-input {
            max-width: 100%;
        }

        .search-button {
            width: auto;
        }

        .btn-primary {
            width: 100%; /* Make the button full width on small screens */
        }

        form {
            width: 100%;
        }
    }
</style>
@endsection
