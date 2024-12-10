@extends('layouts.Admin.default')

@section('content')
<div class="container mt-4">
    <div class="card shadow-lg border-0 rounded-lg">
        {{-- Card Header --}}
        <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
            <h3 class="mb-0">Notifications</h3>
            <a href="{{ route('admindashboard') }}" class="btn btn-secondary btn-sm">Back to Dashboard</a>
        </div>

        {{-- Card Body --}}
        <div class="card-body">
            {{-- Success Message --}}
            @if(session('success'))
                <div class="alert alert-success">
                    {{ session('success') }}
                </div>
            @endif

            {{-- Notifications Table --}}
            @if($notifications->count() > 0)
                <table class="table table-hover table-bordered">
                    <thead class="thead-light">
                        <tr>
                            <th>#</th>
                            <th>Image</th>
                            <th>Title</th>
                            <th>Status</th>
                            <th>Created At</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($notifications as $notification)
                        <tr>
                            <td>{{ $loop->iteration }}</td>
                            <td>
                                @if(file_exists(public_path('public/public/unregister_user/' . basename($notification->image))))
                                    <img src="{{ asset('public/public/unregister_user/' . basename($notification->image)) }}"
                                         alt="Notification Image"
                                         style="width: 50px; height: 50px; object-fit: cover;">
                                @else
                                    <span>No Image</span>
                                @endif
                            </td>
                            <td>{{ $notification->title }}</td>
                            <td>
                                <span class="badge {{ $notification->status == 'unread' ? 'bg-danger' : 'bg-success' }}">
                                    {{ ucfirst($notification->status) }}
                                </span>
                            </td>
                            <td>{{ $notification->created_at->format('Y-m-d H:i') }}</td>
                            <td class="d-flex">
                                <a href="{{ route('notification.show', $notification->id) }}" class="btn btn-info btn-sm mr-2">
                                    <i class="fas fa-eye"></i> View
                                </a>
                                <form action="{{ route('notification.destroy', $notification->id) }}" method="POST">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">
                                        <i class="fas fa-trash"></i> Delete
                                    </button>
                                </form>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            @else
                <p class="text-center">No notifications available.</p>
            @endif
        </div>

        {{-- Card Footer --}}
        <div class="card-footer text-muted text-center">
            Showing {{ $notifications->count() }} notifications
        </div>
    </div>
</div>
@endsection
