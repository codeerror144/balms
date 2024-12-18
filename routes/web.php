<?php
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CustomAuthController;
use App\Http\Controllers\Student\StudentController;
use App\Http\Controllers\Admin\UserListController;
use App\Http\Controllers\Employee\EmployeeController;
use App\Http\Controllers\LogController;
use App\Http\Controllers\ReportsController;
use App\Http\Controllers\Admin\BiometricController;
use App\Http\Controllers\SystemInfoController;
use App\Http\Controllers\Student\StudentSystemInfoController;
use App\Http\Controllers\Employee\EmployeeSystemInfoController;
use App\Http\Controllers\NotificationController;



    Route::group(['namespace' => 'App\Http\Controllers'], function() {
        // Redirect to login page
        Route::get('/', function () {
        return redirect('/login');
    });

        // Guest routes (not authenticated users)
    Route::group(['middleware' => ['guest']], function() {
        Route::get('/login', [CustomAuthController::class, 'index'])->name('login');
        Route::post('custom-login', [CustomAuthController::class, 'customLogin'])->name('login.custom');

        Route::get('registration', [CustomAuthController::class, 'registration'])->name('register-user');
        Route::post('custom-registration', [CustomAuthController::class, 'customRegistration'])->name('register.custom');
    });
        // Authenticated user routes
    Route::group(['middleware' => ['auth']], function() {
        Route::get('signout', [CustomAuthController::class, 'signOut'])->name('signout');
    });
        // Admin routes (admin role required)
    Route::group(['middleware' => ['ifAdmin']], function () {
        Route::get('/Admin/Dashboard', [App\Http\Controllers\Admin\AdminController::class, 'index'])->name('admindashboard');
        // user Management Routes
        Route::get('/admin/user', [UserListController::class, 'index'])->name('adminuser');
        Route::get('/admin/add/user', [UserListController::class, 'addUser'])->name('admin.user.add');
        Route::post('/admin/add_user/save', [UserListController::class, 'saveUser'])->name('adminadd_user.save');
        Route::get('/admin/edit_user/{id}', [UserListController::class, 'editUser'])->name('adminedit_user');
        Route::put('/admin/edit_user/update/{id}', [UserListController::class, 'updateUser'])->name('adminedit_user.update');
        Route::get('/admin/view_user/{id}', [UserListController::class, 'view_User'])->name('adminview_user');
        Route::delete('/admin/delete_user/{id}', [UserListController::class, 'deleteUser'])->name('admindelete_user.delete');
        Route::get('/admin/student', [UserListController::class, 'studentsList'])->name('adminstudent');
        Route::get('/admin/employee', [UserListController::class, 'employeesList'])->name('adminemployee');
        Route::post('/recognize-face', [UserListController::class, 'recognizeFace']);
        Route::post('/adminuser/facial/save', [BiometricController::class, 'saveFacialData'])->name('adminuser.facial.save');
        Route::post('/adminuser/facial/capture', [BiometricController::class, 'saveCapturedFacialData'])->name('adminuser.facial.capture');
        Route::delete('/biometric/{userId}', [BiometricController::class, 'deleteBiometricData'])->name('biometric.delete');
        
        Route::get('/notifications', [NotificationController::class, 'index'])->name('admin.notifications.index');
        Route::get('/notifications/{id}', [NotificationController::class, 'show'])->name('notification.show');
        Route::delete('/notifications/{id}', [NotificationController::class, 'destroy'])->name('notification.destroy');
                
        
        Route::post('/save-rfid/{userId}', 'RfidController@saveRFID')->name('save.rfid');
        Route::get('/admin/systeminfo', [SystemInfoController::class, 'index'])->name('adminsysteminfo');
        Route::get('/admin/reports', [ReportsController::class, 'index'])->name('adminreports');
        Route::get('/admin/reports/export/{format}', [ReportsController::class, 'export'])->name('log.export');

        Route::get('/admin/attendance-reports', [ReportsController::class, 'attendanceReports'])->name('adminattendancereports');
        Route::get('/admin/attendance-export/{format}', [ReportsController::class, 'exportAttendance'])->name('export.attendance');
        Route::get('/attendance-report/pdf', [ReportsController::class, 'exportToPdf'])->name('export.attendance.pdf');

        Route::get('/logs', [LogController::class, 'index'])->name('adminlog');
        Route::post('/logs', [LogController::class, 'store']);
        Route::get('/logs/{userId}', [LogController::class, 'show']);
        Route::get('/admin/attendance', [LogController::class, 'attendanceIndex'])->name('admin.attendance.index');

    });

 

    
    });
        // Employee routes (employee role required)
    Route::group(['middleware' => ['ifEmployee']], function () {
        Route::get('/Employee/Dashboard', [App\Http\Controllers\Employee\EmployeeController::class, 'index'])->name('employeedashboard');
        Route::get('/employee/logs', [EmployeeController::class, 'logHistory'])->name('employee.log.history');
        Route::get('/employee/systeminfo', [EmployeeSystemInfoController::class, 'index'])->name('employeesysteminfo');

    });
        // Student routes (student role required)
    Route::group(['middleware' => ['ifStudent']], function () {
        Route::get('/Student/Dashboard', [App\Http\Controllers\Student\StudentController::class, 'index'])->name('studentdashboard');
        Route::get('/student/logs', [StudentController::class, 'logHistory'])->name('student.log.history');
        Route::get('/student/systeminfo', [StudentSystemInfoController::class, 'index'])->name('studentsysteminfo');
    });

