@extends('layouts.Admin.default')

@section('content')
<div class="container">
    <h1>Real Time Monitoring</h1>
    
    @if(isset($error))
        <div class="alert alert-danger">{{ $error }}</div>
    @elseif(isset($output))
        <div class="alert alert-success">
            <!-- Format the output, if it's an array, show a more readable version -->
            @if(is_array($output))
                <ul>
                    @foreach($output as $item)
                        <li>{{ $item }}</li>
                    @endforeach
                </ul>
            @else
                <p>{{ $output }}</p>
            @endif
        </div>
    @else
        <p>No output yet.</p>
    @endif
</div>
@endsection
