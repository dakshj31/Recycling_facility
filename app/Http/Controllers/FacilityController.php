<?php

// app/Http/Controllers/FacilityController.php
namespace App\Http\Controllers;

use App\Models\Facility;
use App\Models\Material;
use Illuminate\Http\Request;

class FacilityController extends Controller
{
   public function index(Request $request)
{
    $query = Facility::with('materials');

    //  Search (business name, city, state)
    if ($search = $request->input('search')) {
        $query->where(function ($q) use ($search) {
            $q->where('business_name', 'like', "%{$search}%")
              ->orWhere('city', 'like', "%{$search}%")
              ->orWhere('state', 'like', "%{$search}%");
        });
    }

    //  Filter by material
    if ($materialId = $request->input('material')) {
        $query->whereHas('materials', fn($q) =>
            $q->where('materials.id', $materialId));
    }

    //  Sorting
    if ($request->input('sort') === 'last_update') {
        $query->orderBy('last_update_date', 'desc');
    } elseif ($request->input('sort') === 'name') {
        $query->orderBy('business_name', 'asc');
    }

    $facilities = $query->paginate(10)->appends($request->query()); // keep filters in pagination
    $materials = Material::all();

    return view('facilities.index', compact('facilities', 'materials'));
}


    public function create()
    {
        $materials = Material::all();
        return view('facilities.create', compact('materials'));
    }

    public function store(Request $request)
{
    $facility = Facility::create([
        'business_name'   => $request->business_name,
        'street_address'  => $request->street_address,
        'city'            => $request->city,
        'state'           => $request->state,
        'postal_code'     => $request->postal_code,
        'last_update_date'=> now(), // auto-set when creating
    ]);

    $facility->materials()->sync($request->input('materials', []));
    return redirect()->route('facilities.index')->with('success', 'Facility created successfully.');
}

    public function show(Facility $facility)
    {
        return view('facilities.show', compact('facility'));
    }

    public function edit(Facility $facility)
    {
        $materials = Material::all();
        return view('facilities.edit', compact('facility','materials'));
    }

    public function update(Request $request, Facility $facility)
{
    $facility->update([
        'business_name'   => $request->business_name,
        'street_address'  => $request->street_address,
        'city'            => $request->city,
        'state'           => $request->state,
        'postal_code'     => $request->postal_code,
        'last_update_date'=> now(), // auto-update on edit
    ]);

    $facility->materials()->sync($request->input('materials', []));
    return redirect()->route('facilities.index')->with('success', 'Facility updated successfully.');
}

    public function destroy($id)
{
    $facility = Facility::findOrFail($id);
    $facility->delete();

    return redirect()->route('facilities.index')->with('success', 'Facility deleted successfully.');
}
}
