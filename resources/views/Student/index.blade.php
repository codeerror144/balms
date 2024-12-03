@extends('layouts.Student.default')

@section('content')
    <div class="container-fluid"> <!-- Full-width container for responsiveness -->
        <h2 class="text-center mt-4 mb-5">Welcome, {{ Auth::user()->name }}!</h2> <!-- Add spacing -->

        <div class="content-wrapper">
            <div class="row">
                <!-- Bar Graph for Log History -->
                <div class="col-lg-6 col-md-12 mb-4"> <!-- Adjust for responsiveness -->
                    <div class="card shadow">
                        <div class="card-body">
                            <h4 class="card-title text-center">Log History</h4> <!-- Centered chart title -->
                            <div class="chart-container" style="position: relative; height: 300px; width: 100%;"> <!-- Chart container -->
                                <canvas id="logHistoryChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Pie Chart for Log Type Distribution -->
                <div class="col-lg-6 col-md-12 mb-4"> <!-- Adjust for responsiveness -->
                    <div class="card shadow">
                        <div class="card-body">
                            <h4 class="card-title text-center">Log Type Distribution</h4> <!-- Centered chart title -->
                            <div class="chart-container" style="position: relative; height: 300px; width: 100%;"> <!-- Chart container -->
                                <canvas id="logTypePieChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Include Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // Bar Chart for Log History
        const barCtx = document.getElementById('logHistoryChart').getContext('2d');
        const logData = @json($logCounts); // Log counts
        const logLabels = @json($logLabels); // Labels for dates

        new Chart(barCtx, {
            type: 'bar',
            data: {
                labels: logLabels, // X-axis labels (dates)
                datasets: [{
                    label: 'Log Count',
                    data: logData, // Y-axis data (counts)
                    backgroundColor: 'rgba(75, 192, 192, 0.7)', // Better colors
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false, // Allow custom resizing
                plugins: {
                    legend: {
                        position: 'top' // Better legend position
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        // Pie Chart for Log Type Distribution
        const pieCtx = document.getElementById('logTypePieChart').getContext('2d');
        const logTypeLabels = @json($logTypeLabels); // Log type labels
        const logTypeCounts = @json($logTypeCounts); // Log type counts

        new Chart(pieCtx, {
            type: 'pie',
            data: {
                labels: logTypeLabels, // Labels for log types
                datasets: [{
                    label: 'Log Type Distribution',
                    data: logTypeCounts, // Data for each log type
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.7)', // Red
                        'rgba(54, 162, 235, 0.7)', // Blue
                        'rgba(255, 206, 86, 0.7)', // Yellow
                        'rgba(75, 192, 192, 0.7)', // Green
                        'rgba(153, 102, 255, 0.7)' // Purple
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false, // Allow custom resizing
                plugins: {
                    legend: {
                        position: 'top', // Better legend position
                        labels: {
                            padding: 15, // Add padding for readability
                            font: {
                                size: 14 // Improve readability
                            }
                        }
                    }
                }
            }
        });
    </script>
@endsection
