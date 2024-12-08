    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>@yield('title') | Student Dashboard</title>

        <link rel="stylesheet" href="{{ asset('mytemplate/vendors/feather/feather.css') }}">
        <link rel="stylesheet" href="{{ asset('mytemplate/vendors/ti-icons/css/themify-icons.css') }}">
        <link rel="stylesheet" href="{{ asset('mytemplate/vendors/css/vendor.bundle.base.css') }}">
        <link rel="stylesheet" href="{{ asset('mytemplate/css/vertical-layout-light/style.css') }}">
        <link rel="shortcut icon" href="{{ asset('images/logo.jpg') }}" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    </head>

    <body>
        <div class="container-scroller">
            <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
                <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
                    <a class="navbar-brand brand-logo mr-10" href="#">
                        <img src="{{ asset('images/bitslog.png') }}" class="mr-8" alt="logo" style="width: 200px; height: auto;"/>
                    </a>
                    <a class="navbar-brand brand-logo-mini" href="#">
                        <img src="{{ asset('images/logo.png') }}" alt="logo" style="width: 300px; height: 50px;"/>
                    </a>
                </div>
                <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
                    <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                        <span class="icon-menu"></span>
                    </button>
                    <ul class="navbar-nav navbar-nav-right">
                        <li class="nav-item nav-profile dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
                                <span class="profile-name">{{ Auth::user()->name }}</span> <!-- Change to Auth::user() -->
                            </a>
                            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">


                                <a class="dropdown-item" href="{{ route('signout') }}">
                                    <i class="ti-power-off text-primary"></i>
                                    Logout
                                </a>
                            </div>
                        </li>
                    </ul>
                    <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
                        <span class="icon-menu"></span>
                    </button>
                </div>
            </nav>

            <div class="container-fluid page-body-wrapper">
                <nav class="sidebar sidebar-offcanvas active" id="sidebar">
                    <ul class="nav position-fixed">
                        <li class="nav-item active">
                            <a class="nav-link" href="{{ route('studentdashboard') }}">
                                <i class="icon-grid menu-icon"></i>
                                <span class="menu-title">Dashboard</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('student.log.history') }}">
                                <i class="ti-calendar menu-icon"></i>
                                <span class="menu-title">Log History</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('studentsysteminfo') }}">
                                <i class="icon-layout menu-icon"></i>
                                <span class="menu-title">System Information</span>
                            </a>
                        </li>
            </li>
                    </ul>
                </nav>

                <div class="main-panel">
                    <div class="content-wrapper">
                        @yield('content')
                    </div>

                </div>
            </div>
        </div>

        <script src="{{ asset('mytemplate/vendors/js/vendor.bundle.base.js') }}"></script>
        <script src="{{ asset('mytemplate/js/off-canvas.js') }}"></script>
        <script src="{{ asset('mytemplate/js/hoverable-collapse.js') }}"></script>
        <script src="{{ asset('mytemplate/js/template.js') }}"></script>
    </body>
    </html>
