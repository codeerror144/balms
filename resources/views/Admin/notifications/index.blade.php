@extends('layouts.Admin.default')

@section('content')
    <div class="container-fluid">
        <h3>Notifications</h3>
        <div class="list-group">
            @foreach($notifications as $notification)
                <a href="{{ route('notification.show', $notification->id) }}" class="list-group-item list-group-item-action">
                    <!-- Dynamically fetching and displaying the first image for each notification -->
                    @php
                        // Get all images from public/unregister_user folder
                        $imageFiles = File::glob(public_path('unregister_user/*.jpg'));
                        $imagePath = !empty($imageFiles) ? asset('unregister_user/' . basename($imageFiles[0])) : asset('images/default-image.jpg');
                    @endphp

                    <img src="{{ $imagePath }}" alt="User Image" style="width: 50px; height: 50px; object-fit: cover; margin-right: 10px;">

                    <!-- Notification title and time ago -->
                    <strong>{{ $notification->title }}</strong> -
                    <small>{{ \Carbon\Carbon::parse($notification->created_at)->diffForHumans() }}</small>
                </a>
            @endforeach
        </div>
    </div>
@endsection
