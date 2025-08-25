<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Facility extends Model
{
    protected $fillable = [
        'business_name', 'street_address', 'city', 'state', 'postal_code', 'last_update_date'
    ];

    public function materials()
    {
        return $this->belongsToMany(Material::class);
    }
}
