@extends('layouts.Admin.default')

@section('content')
<div class="container-fluid mt-4">
    <!-- Page Header -->
    <div class="d-flex flex-wrap justify-content-between align-items-center mb-4">
        <h3 class="text-primary"><i class="fas fa-history"></i> History Logs</h3>
    </div>

    <!-- Search Section -->
    <div class="d-flex flex-wrap justify-content-end align-items-center mb-4">
        <a href="{{ route('admin.attendance.index') }}" class="btn btn-primary btn-sm shadow-sm mb-2 mb-md-0">
            <i class="fas fa-calendar-alt"></i> Attendance History
        </a>

       
    </div>
     
    <form action="{{ route('adminlog') }}" method="GET" class="d-flex w-100 w-md-auto">
            <div class="input-group flex-grow-1 flex-md-grow-0">
                <input type="text" name="search" class="form-control search-input" placeholder="Search..." value="{{ request('search') }}">
                <button class="btn search-button" type="submit">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </form>
<br>
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
                            <th>Action</th>
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
                                <td>
                                    <!-- View Button -->
                                    <button class="btn btn-sm btn-info" data-toggle="modal" data-target="#viewModal{{ $log->id }}">
                                        <i class="fas fa-eye"></i> View
                                    </button>
                                </td>
                            </tr>

                            <!-- Modal for Viewing Details -->
                            <div class="modal fade" id="viewModal{{ $log->id }}" tabindex="-1" aria-labelledby="viewModalLabel{{ $log->id }}" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header bg-primary text-white">
                                            <h5 class="modal-title" id="viewModalLabel{{ $log->id }}">User Log Details</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body text-center">
                                            <div>
                                                <img src="{{ asset('public/log_pictures/' . $log->pictures) }}" alt="User Image" class="img-fluid rounded mb-3" style="max-width: 200px;">
                                            </div>
                                            <p><strong>Name:</strong> {{ $log->user->name }}</p>
                                            <p><strong>Type:</strong> {{ ucfirst($log->user->type) }}</p>
                                            <p><strong>Room:</strong> {{ $log->room }}</p>
                                            <p><strong>Log Time:</strong> {{ $log->log_time }}</p>
                                            <p><strong>Location:</strong> Computer Laboratory 3</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @empty
                            <tr>
                                <td colspan="6" class="text-center">No log entries found.</td>
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

<!-- Custom CSS -->
<style>
    .search-input {
        border-radius: 25px 0 0 25px;
        height: 40px;
        font-size: 16px;
        max-width: 300px;
    }

    .search-button {
        border-radius: 0 25px 25px 0;
        height: 40px;
        background-color: #0056b3;
        color: #fff;
    }

    .search-button:hover {
        background-color: #003d80;
    }
</style>
@endsection
