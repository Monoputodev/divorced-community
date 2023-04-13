<?php

namespace App\Console\Commands;

use App\Models\BasicInfo;
use Carbon\Carbon;
use App\Models\PhysicalAttribute;
use Illuminate\Console\Command;

class UpdatePhysicalAttributesAge extends Command
{
    protected $signature = 'update:physicalattributesage';

    protected $description = 'Update the age field in the physicalattributes table';

    public function handle()
    {
        $physicalAttributes = PhysicalAttribute::all();
$userInfo = BasicInfo::all();
        foreach ($physicalAttributes as $physicalAttribute) {
            $birthdate = Carbon::createFromFormat('Y-m-d', $userInfo->birth_date);
            $age = $birthdate->diffInYears(Carbon::now());

            $physicalAttribute->age = $age;
            $physicalAttribute->save();
        }

        $this->info('PhysicalAttributes age updated successfully!');
    }
}
