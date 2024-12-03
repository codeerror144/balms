@extends('layouts.Employee.default')

@section('content')
<div class="container mt-5">
    <div class="card shadow">
        <div class="card-header text-center">
            <h2 class="mb-0">Attendance Monitoring System</h2>
            <h5 class="text-muted">BS Information Technology Department</h5>
        </div>
        <div class="card-body">
            <div class="mb-4">
                <h4 class="font-weight-bold">Programmer Information</h4>
                <p>
                    This system was developed by <strong>Codeerror Group</strong>, a dedicated team of students from the BS Information Technology program.
                </p>
            </div>

            <div class="mb-4">
                <h4 class="font-weight-bold">Year of Development</h4>
                <p>
                    This project was developed in <strong>2024</strong>.
                </p>
            </div>

            <div class="mb-4">
                <h4 class="font-weight-bold">Contact Information</h4>
                <p>For inquiries or support, please contact:</p>
                <ul class="list-unstyled">
                    <li>
                        <i class="fas fa-envelope"></i> Email:
                        <a href="mailto:codeerror@gmail.com">codeerror@gmail.com</a>
                    </li>
                    <li>
                        <i class="fas fa-phone"></i> Phone: <strong>0912345677</strong>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
@endsection
