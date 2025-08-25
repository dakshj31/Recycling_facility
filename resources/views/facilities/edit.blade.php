<!DOCTYPE html>
<html>
<head>
    <title>Edit Facility</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-4">

    <h2>Edit Facility</h2>

    <form action="{{ route('facilities.update', $facility->id) }}" method="POST">
        @csrf
        @method('PUT')

        <div class="mb-3">
            <label class="form-label">Business Name</label>
            <input type="text" name="business_name" class="form-control"
                   value="{{ old('business_name', $facility->business_name) }}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Street Address</label>
            <input type="text" name="street_address" class="form-control"
                   value="{{ old('street_address', $facility->street_address) }}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">City</label>
            <input type="text" name="city" class="form-control"
                   value="{{ old('city', $facility->city) }}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">State</label>
            <input type="text" name="state" class="form-control"
                   value="{{ old('state', $facility->state) }}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Postal Code</label>
            <input type="text" name="postal_code" class="form-control"
                   value="{{ old('postal_code', $facility->postal_code) }}" required>
        </div>

        <!-- Materials multi-checkbox -->
        <div class="mb-3">
            <label class="form-label">Materials Accepted</label>
            <div class="row">
                @foreach($materials as $material)
                    <div class="col-md-3">
                        <div class="form-check">
                            <input type="checkbox"
                                   name="materials[]"
                                   value="{{ $material->id }}"
                                   class="form-check-input"
                                   id="material_{{ $material->id }}"
                                   {{ in_array($material->id, $facility->materials->pluck('id')->toArray()) ? 'checked' : '' }}>
                            <label class="form-check-label" for="material_{{ $material->id }}">
                                {{ $material->name }}
                            </label>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>

        <button type="submit" class="btn btn-primary">Update Facility</button>
        <a href="{{ route('facilities.index') }}" class="btn btn-secondary">Cancel</a>
    </form>

</body>
</html>
