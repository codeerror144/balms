<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Login Page</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="{{ asset('mytemplate/vendors/feather/feather.css') }}">
  <link rel="stylesheet" href="{{ asset('mytemplate/vendors/ti-icons/css/themify-icons.css') }}">
  <link rel="stylesheet" href="{{ asset('mytemplate/vendors/css/vendor.bundle.base.css') }}">
  <!-- inject:css -->
  <link rel="stylesheet" href="{{ asset('mytemplate/css/vertical-layout-light/style.css') }}">
  <!-- endinject -->
  <link rel="shortcut icon"  href="{{ asset('images/logo.jpg') }}" />

</head>

<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-6 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              <div class="brand-logo text-center">
                <img src="{{ asset('images/bitslog.png') }}" alt="Logo" style="width: 400px; height: auto;">
              </div>
             


              <form action="{{ route('login.custom') }}" method="POST" class="pt-3">
    @csrf
    <div class="form-group">
        <label for="email">Email</label>
        <input type="email" class="form-control form-control-lg @error('email') is-invalid @enderror" id="email" name="email" value="{{ old('email') }}" placeholder="Email" required>
        @error('email')
            <span class="text-danger">{{ $message }}</span>
        @enderror
    </div>

    <div class="form-group">
        <label for="password">Password</label>
        <input type="password" class="form-control form-control-lg @error('password') is-invalid @enderror" id="password" name="password" placeholder="Password" required>
        @error('password')
            <span class="text-danger">{{ $message }}</span>
        @enderror
    </div>
    <div class="mt-3">
        <input type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" value="Login">
    </div>
 
</form>

            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->


  <script src="{{ asset('mytemplate/vendors/js/vendor.bundle.base.js') }}"></script>
  <!-- inject:js -->
  <script src="{{ asset('mytemplate/js/off-canvas.js') }}"></script>
  <script src="{{ asset('mytemplate/js/hoverable-collapse.js') }}"></script>
  <script src="{{ asset('mytemplate/js/template.js') }}"></script>
  <script src="{{ asset('mytemplate/js/settings.js') }}"></script>
  <script src="{{ asset('mytemplate/js/todolist.js') }}"></script>
  <!-- endinject -->

</body>

</html>
