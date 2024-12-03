@extends('layouts.Admin.default')

@section('content')

<h2 class="text-center my-4">Admin Dashboard</h2>
<div class="content-wrapper">
    

    <!-- Metrics Section -->
    <div class="row mb-4">
        <!-- Total Students -->
        <div class="col-lg-3 col-md-6 mb-4">
            <div class="card bg-primary text-white">
                <div class="card-body text-center">
                    <h5 class="card-title"><i class="fas fa-user-graduate"></i> Total Students</h5>
                    <h2>{{ $totalStudents }}</h2>
                </div>
            </div>
        </div>
        <!-- Total Employees -->
        <div class="col-lg-3 col-md-6 mb-4">
            <div class="card bg-primary text-white">
                <div class="card-body text-center">
                    <h5 class="card-title"><i class="fas fa-user-tie"></i> Total Employees</h5>
                    <h2>{{ $totalEmployees }}</h2>
                </div>
            </div>
        </div>
        <!-- Total Logs -->
        <div class="col-lg-3 col-md-6 mb-4">
            <div class="card bg-primary text-white">
                <div class="card-body text-center">
                    <h5 class="card-title"><i class="fas fa-database"></i> Total Logs</h5>
                    <h2>{{ $totalLog }}</h2>
                </div>
            </div>
        </div>
        <!-- Unread Notifications -->
        <div class="col-lg-3 col-md-6 mb-4">
            <div class="card bg-primary text-white">
                <div class="card-body text-center">
                    <h5 class="card-title"><i class="fas fa-bell"></i>Notifications</h5>
                    <h2>{{ $notifications->count() }}</h2>
                </div>
            </div>
        </div>
    </div>

    <!-- Graphs Section -->
    <div class="row mb-4">
        <!-- Log Entries Chart -->
        <div class="col-md-6 mb-4">
            <div class="card shadow">
                <div class="card-body">
                    <h5 class="card-title text-center">Log Entries Overview</h5>
                    <div class="chart-container">
                        <canvas id="logEntriesChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <!-- Attendance Chart -->
        <div class="col-md-6 mb-4">
            <div class="card shadow">
                <div class="card-body">
                    <h5 class="card-title text-center">Attendance Overview</h5>
                    <div class="chart-container">
                        <canvas id="attendanceChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Recent Activity Section -->
    <div class="row">
        <div class="col-md-12">
            <div class="card shadow">
                <div class="card-body">
                    <h5 class="card-title">Recent Activities</h5>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>User</th>
                                <th>Type</th>
                                <th>Time</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($logs as $index => $log)
                            <tr>
                                <td>{{ $index + 1 }}</td>
                                <td>{{ $log->user->name }}</td>
                                <td>{{ $log->user->type }}</td>
                                <td>{{ $log->log_time }}</td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    // Log Entries Chart
    const logDates = @json($dates);
    const logEntries = @json($logEntries);

    new Chart(document.getElementById('logEntriesChart').getContext('2d'), {
        type: 'line',
        data: {
            labels: logDates,
            datasets: [{
                label: 'Log Entries',
                data: logEntries,
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 2,
                fill: true
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    // Attendance Chart
    const attendanceDates = @json($attendanceDates);
    const attendanceCounts = @json($attendanceCounts);

    new Chart(document.getElementById('attendanceChart').getContext('2d'), {
        type: 'bar',
        data: {
            labels: attendanceDates,
            datasets: [{
                label: 'Attendance',
                data: attendanceCounts,
                backgroundColor: 'rgba(75, 192, 192, 0.6)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>
<style>
    .chart-container {
        position: relative;
        height: 350px;
    }
</style>
@endsection
