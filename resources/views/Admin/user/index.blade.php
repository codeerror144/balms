@extends('layouts.Admin.default')


@section('content')


@if(session('success'))
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        {{ session('success') }}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
@endif


@if(session('error'))
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        {{ session('error') }}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
@endif




<div class="container-fluid mt-4">
    <!-- Page Header -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="text-primary"><i class="fas fa-users"></i> User Management</h3>
    </div>


   <!-- Search and Add User Section -->
<div class="d-flex justify-content-between align-items-center mb-4">
    <!-- Add New User Button -->
    <button type="button" class="btn btn-primary btn-sm shadow-sm" data-toggle="modal" data-target="#addUserModal">
       </i> Add New User
    </button>

    <!-- Search Bar -->
    <form action="{{ route('adminuser') }}" method="GET" style="width: auto;">
        <div class="input-group" style="width: 300px;"> <!-- Fixed width -->
            <input type="text" name="search" class="form-control search-input" placeholder="Search..." value="{{ request('search') }}">
            <button class="btn search-button" type="submit">
                <i class="fas fa-search"></i>
            </button>
        </div>
    </form>
</div>

<!-- CSS -->
<style>
    .search-input {
        border: none; /* Remove border */
        border-right: none; /* Ensure no right border */
        border-radius: 25px 0 0 25px; /* Rounded left side */
        height: 40px; /* Adjust height */
        font-size: 16px; /* Font size for text */
        box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1); /* Optional subtle shadow for depth */
    }

    .search-button {
        border: none; /* Remove border */
        border-left: none; /* Ensure no left border */
        border-radius: 0 25px 25px 0; /* Rounded right side */
        height: 40px; /* Adjust height */
        background-color: #0056b3; /* Blue button color */
        color: #fff; /* White text */
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 0 15px; /* Padding for spacing */
        box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1); /* Optional subtle shadow for depth */
    }

    .search-button:hover {
        background-color: #003d80; /* Darker blue on hover */
    }

    .d-flex.justify-content-between {
        gap: 15px; /* Spacing between Add New User button and Search bar */
    }
</style>


    <!-- User Table -->
    <div class="card shadow">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0"><i class="fas fa-table"></i> User List</h4>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead class="table-primary">
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>User Role</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($users as $index => $userItem)
                            <tr>
                                <td>{{ $users->firstItem() + $index }}</td>
                                <td>{{ $userItem->name }}</td>
                                <td>{{ $userItem->email }}</td>
                                <td>{{ $userItem->role->role_name }}</td>
                                <td>
                                    <div class="btn-group" role="group">
                                        <button type="button" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#editUserModal{{ $userItem->id }}">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteUserModal{{ $userItem->id }}">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                        @if($userItem->type == 'Employee')
                                            <button type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#registerRFIDModal{{ $userItem->id }}" title="Register RFID">
                                                <i class="fas fa-id-card"></i>
                                            </button>
                                        @endif
                                        <button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#facialRegistrationModal{{ $userItem->id }}" title="Register Facial Data">
                                            <i class="fas fa-user"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="5" class="text-center">No users found.</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>


            <!-- Pagination -->
            <div class="d-flex justify-content-between align-items-center mt-3">
                <div>
                    Showing {{ $users->firstItem() }} to {{ $users->lastItem() }} of {{ $users->total() }} results
                </div>
                <div>
                    {{ $users->links('pagination::bootstrap-4') }}
                </div>
            </div>
        </div>
    </div>
</div>


@foreach($users as $userItem)
<div class="modal fade" id="registerRFIDModal{{ $userItem->id }}" tabindex="-1" role="dialog" aria-labelledby="registerRFIDModalLabel{{ $userItem->id }}" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="registerRFIDModalLabel{{ $userItem->id }}">Register RFID</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                @if($userItem->biometric && $userItem->biometric->rfid_data)
                    <div class="alert alert-warning">
                        This user is already registered with an RFID. Would you like to update the RFID UID?
                    </div>
                @endif
                <form action="{{ route('save.rfid', $userItem->id) }}" method="POST" id="rfidForm{{ $userItem->id }}">
                    @csrf
                    <div class="form-group">
                        <label for="rfid_data">RFID UID</label>
                        <input type="text" class="form-control" id="rfid_data{{ $userItem->id }}" name="rfid_data" value="{{ $userItem->biometric->rfid_data ?? '' }}" readonly>
                    </div>
                    <button type="submit" class="btn btn-primary">
                        {{ $userItem->biometric && $userItem->biometric->rfid_data ? 'Update' : 'Save' }}
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>
@endforeach

<script>
    $(document).ready(function () {
        const nodeApiUrl = "http://localhost:3000"; // Update this to your server's URL in production

        $('[id^="registerRFIDModal"]').on('show.bs.modal', function () {
            const modal = $(this);
            const userId = modal.attr('id').replace('registerRFIDModal', '');
            const inputField = modal.find('#rfid_data' + userId);

            // Fetch RFID UID
            $.ajax({
                url: nodeApiUrl + '/fetch-rfid-uid',
                method: 'GET',
                success: function (data) {
                    if (data.uid) {
                        inputField.val(data.uid);
                    } else {
                        alert('No RFID UID detected.');
                    }
                },
                error: function () {
                    alert('Error connecting to Node.js server.');
                }
            });
        });
    });
</script>









        <!-- Add User Modal -->
        <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="addUserModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-md" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title" id="addUserModalLabel">User Personal Information</h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                    @csrf


            @if($errors->any())
                <div class="alert alert-danger">
                    <ul>
                        @foreach($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif


                        <form action="{{ route('adminadd_user.save') }}" method="POST">
            @csrf
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" name="name" id="name" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" name="email" id="email" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="password_confirmation">Confirm Password</label>
                <input type="password" name="password_confirmation" id="password_confirmation" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="role_id">User Role</label>
                <select name="role_id" id="role_id" class="form-control" required>
                    <option value="" disabled selected>Select Role</option>
                    @foreach($user_roles as $role)
                        <option value="{{ $role->id }}">{{ $role->role_name }}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Add</button>
            </div>
        </form>
                    </div>
                </div>
            </div>
        </div>


        <!-- Edit User Modal -->
        @foreach($users as $userItem)
            <div class="modal fade" id="editUserModal{{ $userItem->id }}" tabindex="-1" role="dialog" aria-labelledby="editUserModalLabel{{ $userItem->id }}" aria-hidden="true">
                <div class="modal-dialog modal-md" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title" id="editUserModalLabel{{ $userItem->id }}">Edit User</h3>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">


                                <form action="{{ route('adminedit_user.update', $userItem->id) }}" method="POST">
                                    @csrf
                                    @method('PUT')
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input type="text" name="name" value="{{ old('name', $userItem->name) }}" id="name" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="email" name="email" value="{{ old('email', $userItem->email) }}" id="email" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label for="password">New Password (leave blank to keep current)</label>
                                    <input type="password" name="password" id="password" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="role_id">User Role</label>
                                    <select name="role_id" id="role_id" class="form-control" required>
                                        @foreach($user_roles as $role)
                                            <option value="{{ $role->id }}" {{ $role->id == old('role_id', $userItem->role_id) ? 'selected' : '' }}>
                                                {{ $role->role_name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary">Update</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


            <!-- Delete User Modal -->
            <div class="modal fade" id="deleteUserModal{{ $userItem->id }}" tabindex="-1" role="dialog" aria-labelledby="deleteUserModalLabel{{ $userItem->id }}" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="deleteUserModalLabel{{ $userItem->id }}">Delete User</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>Are you sure you want to delete this user?</p>
                        </div>
                        <div class="modal-footer">
                            <form action="{{ route('admindelete_user.delete', $userItem->id) }}" method="POST">
                                @csrf
                                @method('DELETE')
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                <button type="submit" class="btn btn-danger">Delete</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


            <div class="modal fade" id="facialRegistrationModal{{ $userItem->id }}" tabindex="-1" role="dialog" aria-labelledby="facialRegistrationModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" style="max-width: 50%;" role="document">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="facialRegistrationModalLabel">Facial Registration for {{ $userItem->name }}</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <!-- Left Section: Webcam & Capture Button -->
                    <div class="col-12 col-md-6 d-flex flex-column align-items-center mb-4 mb-md-0">
                        <div class="form-group text-center">
                            <label for="webCamera" class="font-weight-bold mb-3">Web Camera</label>
                            <div class="camera border rounded p-2 mb-3">
                                <video id="camera-stream{{ $userItem->id }}" width="100%" autoplay class="border"></video>
                                <canvas id="camera-canvas{{ $userItem->id }}" style="display:none;" width="640" height="480"></canvas>
                            </div>
                            <button type="button" class="btn btn-primary btn-block mt-2 capture-button" data-modal-id="{{ $userItem->id }}">Train Face</button>
                        </div>
                    </div>


                    <!-- Right Section: Display Cropped Captured Image & User Info -->
                    <div class="col-12 col-md-6">
                        <div class="card shadow-sm">
                            <div class="card-body text-center">
                                <div class="mb-3" style="text-align: center;">
                                    <div style="display: inline-block; padding: 50px; border: 2px solid #007bff; border-radius: 10px; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); background-color: #f8f9fa;">
                                        <img id="captured-face-preview{{ $userItem->id }}" class="img-fluid rounded mb-2" style="max-width: 100%; max-height: 100%; border-radius: 20px;">
                                    </div>
                                </div>


                                <!-- User Information -->
                                <div class="text-left">
                                    <p><strong>ID: </strong> <span id="user_id">{{ $userItem->id }}</span></p>
                                    <p><strong>Name: </strong> <span id="name">{{ $userItem->name }}</span></p>
                                </div>


                                @php
                                    $existingFacialData = \App\Models\Biometric::where('user_id', $userItem->id)->first();
                                @endphp


                                <!-- Check if the user already has facial data -->
                                @if($existingFacialData)
                                    <div class="alert alert-info mt-3">This user already has facial data. You can update the existing image.</div>
                                @endif


                                <form action="{{ route('adminuser.facial.capture') }}" method="POST" class="capture-form" id="capture-form{{ $userItem->id }}">
                                    @csrf
                                    <input type="hidden" name="user_id" value="{{ $userItem->id }}">
                                    <input type="hidden" name="captured_image" id="captured-image{{ $userItem->id }}">
                                    <button type="submit" class="btn btn-success btn-block mt-3 save-button" data-modal-id="{{ $userItem->id }}">
                                        @if($existingFacialData)
                                            Update Facial Data
                                        @else
                                            Save Facial Data
                                        @endif
                                    </button>
                                </form>


                                <div class="alert alert-success mt-3" id="success-message-{{ $userItem->id }}" style="display:none;">Successfully saved!</div>
                                <div class="alert alert-danger mt-3" id="error-message-{{ $userItem->id }}" style="display:none;">Error saving data. Please try again.</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@3.20.0"></script>
<script src="https://cdn.jsdelivr.net/npm/@tensorflow-models/facemesh@0.0.4"></script>


<script>
document.addEventListener("DOMContentLoaded", function () {
    let facemeshModel;
    let capturing = false; // To toggle the continuous capture


    // Load the FaceMesh model
    async function loadFacemeshModel() {
        try {
            facemeshModel = await facemesh.load();
            console.log("FaceMesh model loaded successfully");
        } catch (error) {
            console.error("Error loading FaceMesh model:", error);
        }
    }


    loadFacemeshModel();


    document.querySelectorAll(".capture-button").forEach(button => {
        const modalId = button.getAttribute("data-modal-id");
        const video = document.getElementById(`camera-stream${modalId}`);
        const canvas = document.getElementById(`camera-canvas${modalId}`);
        const ctx = canvas.getContext("2d");
        const facePreview = document.getElementById(`captured-face-preview${modalId}`);
        const hiddenInput = document.getElementById(`captured-image${modalId}`);


        // Start webcam stream
        navigator.mediaDevices.getUserMedia({ video: true }).then(stream => {
            video.srcObject = stream;
        }).catch(error => {
            console.error("Error accessing webcam:", error);
            alert("Unable to access webcam. Please check browser permissions.");
        });


        // Toggle continuous face capturing
        button.addEventListener("click", function () {
            capturing = !capturing; // Toggle capturing state
            if (capturing) {
                button.textContent = "Stop Capture";
                startContinuousCapture(video, canvas, ctx, facePreview, hiddenInput, modalId);
            } else {
                button.textContent = "Train Face";
            }
        });
    });


    async function startContinuousCapture(video, canvas, ctx, facePreview, hiddenInput, modalId) {
        const captureInterval = 2000; // Capture every 2 seconds


        const captureProcess = setInterval(async () => {
            if (!capturing) {
                clearInterval(captureProcess);
                return;
            }


            if (!facemeshModel) {
                console.error("Model not loaded.");
                return;
            }


            // Draw the video frame to the canvas
            ctx.drawImage(video, 0, 0, canvas.width, canvas.height);


            // Detect faces using the FaceMesh model
            const predictions = await facemeshModel.estimateFaces(canvas);


            if (predictions.length > 0) {
                predictions.forEach(prediction => {
                    const [x, y] = prediction.boundingBox.topLeft;
                    const [x2, y2] = prediction.boundingBox.bottomRight;
                    const width = x2 - x;
                    const height = y2 - y;


                    // Create a canvas for the cropped face
                    const faceCanvas = document.createElement("canvas");
                    faceCanvas.width = width;
                    faceCanvas.height = height;
                    const faceCtx = faceCanvas.getContext("2d");


                    // Crop the detected face
                    faceCtx.drawImage(canvas, x, y, width, height, 0, 0, width, height);


                    // Convert the cropped face to a Base64 string
                    const croppedFace = faceCanvas.toDataURL("image/png");


                    // Set the hidden input value for the final image
                    facePreview.src = croppedFace;
                    hiddenInput.value = croppedFace;


                    // Save the image to the server
                    saveCapturedImage(croppedFace, modalId);
                });
            } else {
                console.warn("No face detected.");
            }
        }, captureInterval);
    }


    async function saveCapturedImage(base64Image, userId) {
        try {
            const response = await fetch("{{ route('adminuser.facial.capture') }}", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "X-CSRF-TOKEN": "{{ csrf_token() }}",
                },
                body: JSON.stringify({
                    user_id: userId,
                    captured_image: base64Image,
                }),
            });


            if (!response.ok) {
                console.error("Error saving image to the server:", await response.text());
            } else {
                console.log("Image saved successfully.");
            }
        } catch (error) {
            console.error("Error during image save:", error);
        }
    }
});
</script>




@endforeach
@endsection











