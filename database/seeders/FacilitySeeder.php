<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Facility;
use App\Models\Material;

class FacilitySeeder extends Seeder
{
    public function run()
    {
        $facilities = [
            [
                'business_name'   => 'Green Earth Recycling',
                'last_update_date'=> '2022-11-14',
                'street_address'  => '123 Main Ave',
                'city'            => 'New York',
                'state'           => 'NY',
                'postal_code'     => '11001',
                'materials'       => ['Computers', 'Smartphones', 'Laptops']
            ],
            [
                'business_name'   => 'E-Waste Recycling',
                'last_update_date'=> '2022-09-10',
                'street_address'  => '45 Main St',
                'city'            => 'New York',
                'state'           => 'NY',
                'postal_code'     => '11201',
                'materials'       => ['Paper', 'Glass', 'Aluminum']
            ],
            [
                'business_name'   => 'Hudson Valley E-Waste',
                'last_update_date'=> '2022-10-01',
                'street_address'  => '200 Market St',
                'city'            => 'Albany',
                'state'           => 'NY',
                'postal_code'     => '12207',
                'materials'       => ['Laptops', 'Servers', 'Cables']
            ],
            [
                'business_name'   => 'Manhattan Green Disposal',
                'last_update_date'=> '2022-07-15',
                'street_address'  => '70 Broadway',
                'city'            => 'New York',
                'state'           => 'NY',
                'postal_code'     => '10007',
                'materials'       => ['Cellphones', 'Chargers', 'Small Electronics']
            ],
            [
                'business_name'   => 'Upstate Reuse Center',
                'last_update_date'=> '2022-08-12',
                'street_address'  => '141 Elm St',
                'city'            => 'Rochester',
                'state'           => 'NY',
                'postal_code'     => '14604',
                'materials'       => ['Batteries', 'Power Supplies', 'Printers']
            ],
            [
                'business_name'   => 'Bronx Eco Center',
                'last_update_date'=> '2022-05-22',
                'street_address'  => '1200 Grand St',
                'city'            => 'Bronx',
                'state'           => 'NY',
                'postal_code'     => '10451',
                'materials'       => ['Computers', 'Monitors', 'Printer Cartridges']
            ],
            [
                'business_name'   => 'Staten Island Reuse',
                'last_update_date'=> '2022-07-12',
                'street_address'  => '201 Bay St',
                'city'            => 'Staten Island',
                'state'           => 'NY',
                'postal_code'     => '10301',
                'materials'       => ['Paper', 'Cardboard', 'Desktops']
            ],
            [
                'business_name'   => 'Queens Recycling Hub',
                'last_update_date'=> '2022-10-18',
                'street_address'  => '99-12 150th St',
                'city'            => 'Queens',
                'state'           => 'NY',
                'postal_code'     => '11435',
                'materials'       => ['Smartphones', 'Tablets', 'Lithium Batteries']
            ],
            [
                'business_name'   => 'Brooklyn Materials Recovery',
                'last_update_date'=> '2022-07-25',
                'street_address'  => '405 Atlantic Ave',
                'city'            => 'Brooklyn',
                'state'           => 'NY',
                'postal_code'     => '11217',
                'materials'       => ['Glass', 'Aluminum', 'Steel']
            ],
            [
                'business_name'   => 'NY Sustainable Solutions',
                'last_update_date'=> '2022-11-21',
                'street_address'  => '900 Madison Ave',
                'city'            => 'New York',
                'state'           => 'NY',
                'postal_code'     => '10021',
                'materials'       => ['Computers', 'LED Bulbs', 'Printers']
            ],
        ];

        foreach ($facilities as $data) {
            $facility = Facility::create([
                'business_name'   => $data['business_name'],
                'street_address'  => $data['street_address'],
                'city'            => $data['city'],
                'state'           => $data['state'],
                'postal_code'     => $data['postal_code'],
                'last_update_date'=> $data['last_update_date'],
            ]);

            foreach ($data['materials'] as $mat) {
                $material = Material::firstOrCreate(['name' => $mat]);
                $facility->materials()->attach($material->id);
            }
        }
    }
}

