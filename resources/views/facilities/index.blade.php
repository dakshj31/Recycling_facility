<!DOCTYPE html>
<html>
<head>
    <title>Recycling Facilities</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="container mt-4">

    <!--Auth Navbar -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2><a href="{{ route('facilities.index') }}" class="text-decoration-none text-dark">
            Recycling Facilities
        </a></h2>

        <div>
            @auth
                <span class="me-2">Welcome, {{ auth()->user()->name }}</span>
                <form action="{{ route('logout') }}" method="POST" class="d-inline">
                    @csrf
                    <button type="submit" class="btn btn-sm btn-danger">Logout</button>
                </form>
            @else
                <a href="{{ route('login') }}" class="btn btn-sm btn-primary">Login</a>
                {{--  --}}
            @endauth
        </div>
    </div>

    

    <!-- Success/Error Messages -->
    @if(session('success'))
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            {{ session('success') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    @endif

    @if(session('error'))
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            {{ session('error') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    @endif

    <!-- Add Facility (only for logged-in users) -->
    @auth
        <div>
            <a href="{{ route('facilities.create') }}" 
               class="btn btn-primary mb-3" 
               style="float: right; max-width:150px;">
                Add Facility
            </a>
        </div>
    @endauth

    <!-- Filter Form -->
<form method="GET" action="{{ route('facilities.index') }}" class="d-flex">
    <select name="material" class="form-select me-2" onchange="this.form.submit()">
        <option value="">-- Filter by Material --</option>
        @foreach($materials as $mat)
            <option value="{{ $mat->id }}" {{ request('material') == $mat->id ? 'selected' : '' }}>
                {{ $mat->name }}
            </option>
        @endforeach
    </select>
    <noscript>
        <button type="submit" class="btn btn-sm btn-secondary">Filter</button>
    </noscript>
</form>


    <!-- Facilities Table -->
    <table class="table table-bordered">

        <thead>
            <tr>
                <th>Business Name</th>
                <th>Last Updated</th>
                <th>Address</th>
                <th>Materials Accepted</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            @foreach($facilities as $facility)
            <tr>
                <td>{{ $facility->business_name }}</td>
                <td>{{ $facility->last_update_date }}</td>
                <td>{{ $facility->street_address }}, {{ $facility->city }}, {{ $facility->state }} {{ $facility->postal_code }}</td>
                <td>
                    @foreach($facility->materials as $material)
                        {{ $material->name }}@if(!$loop->last), @endif
                    @endforeach
                </td>
                <td>
                      <a href="{{ route('facilities.show', $facility->id) }}" class="btn btn-sm btn-info">
                            <i class="fas fa-eye"></i>
                     </a>
                    @auth
                        <a href="{{ route('facilities.edit', $facility->id) }}" class="btn btn-sm btn-warning">
                            <i class="fas fa-edit"></i>
                        </a>
                        <form action="{{ route('facilities.destroy', $facility->id) }}" method="POST" style="display:inline;">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">
                                <i class="fas fa-trash"></i>
                            </button>
                        </form>
                    @else
                        <small class="text-muted">Login to manage</small>
                    @endauth
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>

</body>
</html>
