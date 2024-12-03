@extends('layouts.Student.default')

@section('content')
    <div class="container">
        <h3 class="text-primary mb-4">Your Log Records</h3>

        <div class="d-flex justify-content-center align-items-center mb-4">
    <form action="{{ route('student.log.history') }}" method="GET" class="d-flex" style="max-width: 400px; width: 100%;">
        <div class="input-group">
            <input 
                type="date" 
                name="search" 
                class="form-control" 
                placeholder="Search..." 
                value="{{ request('search') }}" 
                style="border-radius: 25px 0 0 25px; border: 1px solid #ccc; height: 38px;"
            >
            <button 
                class="btn btn-primary" 
                type="submit" 
                style="border-radius: 0 25px 25px 0; background-color: #0056b3; border: none; height: 38px;"
            >
                <i class="fas fa-search"></i>
            </button>
        </div>
    </form>
</div>


        <!-- Log Records Table -->
        <div class="row">
            <div class="col-md-12">
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white">
                        <h4 class="mb-0"><i class="fas fa-list"></i> Log Records</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead class="table-primary">
                                    <tr>
                                        <th>Room</th>
                                        <th>Log Time</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @forelse($logs as $log)
                                        <tr>
                                            <td>{{ $log->room }}</td>
                                            <td>{{ $log->log_time }}</td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td colspan="2" class="text-center">No log records found for the selected date.</td>
                                        </tr>
                                    @endforelse
                                </tbody>
                            </table>
                        </div>
                        <!-- Pagination -->
                        <div class="d-flex justify-content-between align-items-center mt-3">
                            <div>
                                Showing {{ $logs->firstItem() ?? 0 }} to {{ $logs->lastItem() ?? 0 }} of {{ $logs->total() ?? 0 }} results
                            </div>
                            <div>
                                {{ $logs->links('pagination::bootstrap-4') }}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        .input-group .form-control {
            font-size: 16px;
            padding: 10px 15px;
        }

        .input-group .btn {
            font-size: 16px;
            padding: 10px 15px;
            color: #fff;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f9f9f9;
        }

        .table-striped tbody tr:hover {
            background-color: #f1f1f1;
        }

        .card-header {
            font-size: 18px;
        }
    </style>
@endsection
