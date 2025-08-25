<!DOCTYPE html>
<html>
<head>
    <title>{{ $facility->business_name }} - Details</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-4">

    <h2>{{ $facility->business_name }}</h2>

    <div class="mb-3">
        <strong>Last Updated:</strong> {{ $facility->last_update_date }}
    </div>

    <div class="mb-3">
        <strong>Address:</strong><br>
        {{ $facility->street_address }}, {{ $facility->city }}, {{ $facility->state }} {{ $facility->postal_code }}
    </div>

  <div class="mb-3">
    <strong>Materials Accepted:</strong><br>
    @foreach($facility->materials as $mat)
        <span style="background:#f0f0f0; color:#333; padding:3px 8px; margin:2px; border-radius:6px; display:inline-block;">
            {{ $mat->name }}
        </span>
    @endforeach
</div>


    <!-- Google Maps Embed -->
    <div class="mb-4">
        <h4>Location Map</h4>
        @php
            $fullAddress = urlencode($facility->street_address . ', ' . $facility->city . ', ' . $facility->state . ' ' . $facility->postal_code);
        @endphp
        <iframe
    width="100%"
    height="400"
    style="border:0"
    loading="lazy"
    src="https://www.google.com/maps?q={{ $fullAddress }}&output=embed">
</iframe>
    </div>

    <a href="{{ route('facilities.index') }}" class="btn btn-secondary">Back</a>

</body>
</html>
