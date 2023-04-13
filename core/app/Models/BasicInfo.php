<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class BasicInfo extends Model
{
    protected $casts = [
        'present_address' => 'object',
        'permanent_address' => 'object',
        'language' => 'array',
    ];

    public static function getMaxMinAge()
    {
        return self::selectRaw('MAX(TIMESTAMPDIFF(YEAR, birth_date, CURDATE())) AS maxAge, MIN(TIMESTAMPDIFF(YEAR, birth_date, CURDATE())) AS minAge')->first();
    }
}
