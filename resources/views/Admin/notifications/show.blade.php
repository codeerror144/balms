@extends('layouts.Admin.default')

@section('content')
<div class="container" style="max-width: 600px;">
    <div class="card shadow-lg border-0 rounded-lg">
        {{-- Card Header --}}
        <div class="card-header bg-primary text-white text-center py-3">
            <h3 class="mb-0">Notification Details</h3>
        </div>

        {{-- Card Body --}}
        @php
            // Debug the notification message
            $message = $notification->message;

            // Extract the image path
            preg_match('/public\\\\unregister_user\\\\[^ ]+/', $message, $matches);
            $imagePath = isset($matches[0]) ? str_replace('\\', '/', $matches[0]) : null;
        @endphp

        {{-- Debugging Output --}}
        <div class="text-center my-4">
            
            {{-- Display Image --}}
            @if($imagePath && file_exists(public_path($imagePath)))
                <img src="{{ asset($imagePath) }}"
                     alt="Notification Image"
                     class="img-thumbnail shadow-sm"
                     style="max-width: 300px; height: auto;">
            @else
                <p class="text-danger">No image available.</p>
            @endif
        </div>

        <p class="text-center text-muted">
            Unknown User Detected!!!
        </p>

        {{-- Status --}}
        <p class="text-center">
            <span class="badge bg-info text-dark px-3 py-2">
                Status: {{ ucfirst($notification->status) }}
            </span>
        </p>
    </div>

    {{-- Card Footer --}}
    <div class="card-footer bg-light d-flex justify-content-center py-3">

    </div>
</div>
@endsection
