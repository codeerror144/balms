        @extends('layouts.Employee.default')

        @section('content')
            <div class="container">
                <h2>Welcome, {{ Auth::user()->name }}!</h2>

                <div class="content-wrapper">
                    <div class="row">
                        <div class="col-md-12 grid-margin">
                            <div class="row">
                                <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                                    <!-- Add any additional content here -->
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Bar Graphs for Log and Attendance History (Side by Side) -->
                    <div class="row mb-4">
                        <!-- Log History Graph -->
                        <div class="col-md-6 mb-4">
                            <div class="card">
                                <div class="card-body bg-light">
                                    <h4 class="card-title text-center">Your Log History</h4>
                                    <div class="chart-container">
                                        <canvas id="logHistoryChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Attendance History Graph -->
                        <div class="col-md-6 mb-4">
                            <div class="card">
                                <div class="card-body bg-light">
                                    <h4 class="card-title text-center">Your Attendance History</h4>
                                    <div class="chart-container">
                                        <canvas id="attendanceHistoryChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Chart.js Scripts -->
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <script>
                // Log History Chart
                const logHistoryLabels = @json($logHistory->keys());
                const logHistoryData = @json($logHistory->values());

                const logHistoryCtx = document.getElementById('logHistoryChart').getContext('2d');
                new Chart(logHistoryCtx, {
                    type: 'bar',
                    data: {
                        labels: logHistoryLabels,
                        datasets: [{
                            label: 'Log Entries',
                            data: logHistoryData,
                            backgroundColor: 'rgba(54, 162, 235, 0.6)',
                            borderColor: 'rgba(54, 162, 235, 1)',
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

                // Attendance History Chart
                const attendanceHistoryLabels = @json($attendanceHistory->keys());
                const attendanceHistoryData = @json($attendanceHistory->values());

                const attendanceHistoryCtx = document.getElementById('attendanceHistoryChart').getContext('2d');
                new Chart(attendanceHistoryCtx, {
                    type: 'bar',
                    data: {
                        labels: attendanceHistoryLabels,
                        datasets: [{
                            label: 'Attendance Count',
                            data: attendanceHistoryData,
                            backgroundColor: 'rgba(255, 99, 132, 0.6)',
                            borderColor: 'rgba(255, 99, 132, 1)',
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
                    width: 100%;
                    height: 400px; /* Specify a height for the chart */
                }
            </style>
        @endsection
