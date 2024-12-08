    @extends('layouts.Employee.default')

    @section('content')
        <div class="container">
            <!-- Tab Navigation -->
            <ul class="nav nav-tabs mb-4" id="historyTabs" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active text-primary" id="logs-tab" data-toggle="tab" href="#logs" role="tab" aria-controls="logs" aria-selected="true">
                        <i class="fas fa-list"></i> Log Records
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-primary" id="attendance-tab" data-toggle="tab" href="#attendance" role="tab" aria-controls="attendance" aria-selected="false">
                        <i class="fas fa-clock"></i> Attendance History
                    </a>
                </li>
            </ul>

            <!-- Tab Content -->
            <div class="tab-content" id="historyTabContent">
                <!-- Log Records Tab -->
                <div class="tab-pane fade show active" id="logs" role="tabpanel" aria-labelledby="logs-tab">
                    <div class="card shadow-sm">
                        <div class="card-header bg-primary text-white">
                            <h5 class="card-title"><i class="fas fa-list"></i> Your Log Records</h5>
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
                                        @foreach($logs as $log)
                                            <tr>
                                                <td>{{ $log->room }}</td>
                                                <td>{{ $log->log_time }}</td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                            <!-- Pagination for Logs -->
                            <div class="d-flex justify-content-center mt-3">
                                {{ $logs->links('pagination::bootstrap-4') }}
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Attendance History Tab -->
                <div class="tab-pane fade" id="attendance" role="tabpanel" aria-labelledby="attendance-tab">
                    <div class="card shadow-sm">
                        <div class="card-header bg-primary text-white">
                            <h5 class="card-title"><i class="fas fa-clock"></i> Your Attendance History</h5>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead class="table-secondary">
                                        <tr>
                                            <th>Login Time</th>
                                            <th>Logout Time</th>
                                            <th>Duration (hrs)</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($attendance as $record)
                                            <tr>
                                                <td>{{ $record->login_time }}</td>
                                                <td>{{ $record->logout_time ?? 'N/A' }}</td>
                                                <td>
                                                    @if($record->logout_time)
                                                        {{ round((strtotime($record->logout_time) - strtotime($record->login_time)) / 3600, 2) }}
                                                    @else
                                                        N/A
                                                    @endif
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                            <!-- Pagination for Attendance -->
                            <div class="d-flex justify-content-center mt-3">
                                {{ $attendance->links('pagination::bootstrap-4') }}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Optional Styling -->
        <style>
            .table-responsive {
                margin-top: 20px;
            }
            .nav-tabs .nav-link {
                font-size: 16px;
                font-weight: bold;
            }
            .tab-pane {
                margin-top: 20px;
            }
            .card-header {
                font-size: 18px;
            }
            .table-striped tbody tr:nth-of-type(odd) {
                background-color: #f9f9f9;
            }
            .table-striped tbody tr:hover {
                background-color: #f1f1f1;
            }
        </style>
    @endsection
