<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            font-size: 12px;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .header h1 {
            margin: 0;
        }
        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .table th, .table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        .table th {
            background-color: #f4f4f4;
        }
        .footer {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Daily Time Record (DTR)</h1>
        <p>Attendance Report</p>
    </div>
    <table class="table">
        <thead>
            <tr>
                <th>Name</th>
                <th>Date</th>
                <th>Login Time</th>
                <th>Logout Time</th>
                <th>Session</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($attendances as $attendance)
                <tr>
                    <td>{{ $attendance->user->name }}</td>
                    <td>{{ \Carbon\Carbon::parse($attendance->login_time)->format('Y-m-d') }}</td>
                    <td>{{ \Carbon\Carbon::parse($attendance->login_time)->format('h:i A') }}</td>
                    <td>{{ $attendance->logout_time ? \Carbon\Carbon::parse($attendance->logout_time)->format('h:i A') : 'N/A' }}</td>
                    <td>{{ ucfirst($attendance->session) }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
    <div class="footer">
        <p>Generated on {{ now()->format('Y-m-d h:i A') }}</p>
    </div>
</body>
</html>


