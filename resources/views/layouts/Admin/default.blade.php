<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>@yield('title') | Admin Dashboard</title>

    <!-- plugins:css -->
    <link rel="stylesheet" href="{{ asset('mytemplate/vendors/feather/feather.css') }}">
    <link rel="stylesheet" href="{{ asset('mytemplate/vendors/ti-icons/css/themify-icons.css') }}">
    <link rel="stylesheet" href="{{ asset('mytemplate/vendors/css/vendor.bundle.base.css') }}">

    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="{{ asset('mytemplate/vendors/datatables.net-bs4/dataTables.bootstrap4.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('mytemplate/js/select.dataTables.min.css') }}">

    <!-- inject:css -->
    <link rel="stylesheet" href="{{ asset('mytemplate/css/vertical-layout-light/style.css') }}">

    <link rel="shortcut icon" href="{{ asset('images/logo.jpg') }}" />

    <!-- Add FontAwesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" />

    <!-- External CSS files -->
    <link rel="stylesheet" href="{{ asset('css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('css/app.css') }}" type="text/css" />

    <!-- External JS Files -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Face API and TensorFlow -->
    <script defer src="https://cdn.jsdelivr.net/npm/face-api.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs"></script>

    


</head>

<body>
    <div class="container-scroller">
        <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
            <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
                <a class="navbar-brand brand-logo mr-10" href="#">
                    <img src="{{ asset('images/bitslog.png') }}" class="mr-8" alt="logo" style="width: 200px; height: auto;" />
                </a>
                <a class="navbar-brand brand-logo-mini" href="#">
                    <img src="{{ asset('images/bitslog.png') }}" alt="logo" style="width: auto; height: auto;" />
                </a>
            </div>
            <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
                <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                    <span class="icon-menu"></span>
                </button>

                <!-- User Profile and Notifications -->
                <ul class="navbar-nav navbar-nav-right d-flex align-items-center">

                    <!-- Notification Dropdown -->
                    <li class="nav-item dropdown mr-3">
                        <a class="nav-link" href="javascript:void(0);" id="notificationBell" data-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-bell"></i>
                            <!-- Badge for new notifications -->
                            <span class="badge badge-danger" id="notification-count">
                                {{ is_countable($notifications) ? count($notifications) : 0 }}
                            </span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" id="notification-menu" style="display: none;">
                            <br>
                            <h6 class="dropdown-header">Notifications</h6>
                            <div id="notifications-list" style="max-height: 1000px; overflow-y: auto;">
                                @if(!empty($notifications) && $notifications->count() > 0)
                                @foreach($notifications as $notification)
                                    <a class="dropdown-item" href="{{ route('notification.show', $notification->id) }}">
                                        <img src="{{ asset('unregister_user/' . basename($notification->image)) }}" alt="Notification Image" style="width: 50px; height: 50px; object-fit: cover;">
                                        {{ $notification->title }} - {{ \Carbon\Carbon::parse($notification->created_at)->diffForHumans() }}
                                    </a>
                                @endforeach

                                @else
                                    <p class="dropdown-item">No new notifications</p>
                                @endif
                            </div>
                        </div>
                    </li>

                    <!-- Profile Dropdown -->
                    <li class="nav-item nav-profile dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
                            <img src="{{ asset('images/logo.png') }}" alt="profile" class="nav-profile-img">
                            <span class="profile-name">{{ Auth::user()->name }}</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
                            <a class="dropdown-item" href="{{ route('signout') }}">
                                <i class="ti-power-off text-primary"></i>
                                Logout
                            </a>
                        </div>
                    </li>
                </ul>

                <!-- Toggle Button for Mobile -->
                <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
                    <span class="icon-menu"></span>
                </button>
            </div>
        </nav>

        <div class="container-fluid page-body-wrapper ">
            <!-- Sidebar -->
            <nav class="sidebar sidebar-offcanvas active" id="sidebar">
                <ul class="nav position-fixed">
                    <li class="nav-item active">
                        <a class="nav-link" href="{{ route('admindashboard') }}">
                            <i class="icon-grid menu-icon"></i>
                            <span class="menu-title">Dashboard</span>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="{{ route('adminuser') }}">
                            <i class="nav-icon fas fa-users menu-icon"></i>
                            <span class="menu-title">User Management</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{ route('adminlog') }}">
                            <i class="icon-clock menu-icon"></i>
                            <span class="menu-title">Manage Logs</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{ route('adminreports') }}">
                            <i class="icon-layout menu-icon"></i>
                            <span class="menu-title">Reports</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{ route('adminsysteminfo') }}">
                            <i class="nav-icon fas fa-users-cog menu-icon"></i>
                            <span class="menu-title">System Information</span>
                        </a>
                    </li>
                    <li class="nav-item">
    <a class="nav-link" href="{{ url('/logbook') }}">
        <i class="nav-icon fas fa-book menu-icon"></i>
        <span class="menu-title">Logbook Monitoring</span>
    </a>
</li>
<li class="nav-item">
    <a class="nav-link" href="{{ url('/attendance') }}">
        <i class="nav-icon fas fa-calendar-check menu-icon"></i>
        <span class="menu-title">Attendance Monitoring</span>
    </a>
</li>

                   
                </ul>
            </nav>

            <!-- Main content -->
            <div class="main-panel">
                <div class="content-wrapper">
                    @yield('content')
                </div>
            </div>
            <!-- End of main content -->
        </div>
    </div>

    <!-- plugins:js -->
    <script src="{{ asset('mytemplate/vendors/js/vendor.bundle.base.js') }}"></script>
    <!-- Plugin js for this page -->
    <script src="{{ asset('mytemplate/vendors/chart.js/Chart.min.js') }}"></script>
    <script src="{{ asset('mytemplate/vendors/datatables.net/jquery.dataTables.js') }}"></script>
    <script src="{{ asset('mytemplate/vendors/datatables.net-bs4/dataTables.bootstrap4.js') }}"></script>
    <script src="{{ asset('mytemplate/js/dataTables.select.min.js') }}"></script>
    <!-- End plugin js for this page -->

    <!-- inject:js -->
    <script src="{{ asset('mytemplate/js/off-canvas.js') }}"></script>
    <script src="{{ asset('mytemplate/js/hoverable-collapse.js') }}"></script>
    <script src="{{ asset('mytemplate/js/template.js') }}"></script>
    <script src="{{ asset('mytemplate/js/settings.js') }}"></script>
    <script src="{{ asset('mytemplate/js/todolist.js') }}"></script>

    <script>
        $(document).ready(function() {
            // Toggle notification dropdown on bell icon click
            $('#notificationBell').on('click', function() {
                $('#notification-menu').stop(true, true).slideToggle(); // Slide effect for smooth opening/closing
            });

            // Close dropdown if clicking anywhere outside the dropdown
            $(document).on('click', function(event) {
                if (!$(event.target).closest('#notificationBell').length && !$(event.target).closest('#notification-menu').length) {
                    $('#notification-menu').hide();
                }
            });
        });
    </script>
</body>

</html>