<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Activity extends Model
{
    use HasFactory;

    // Campos que permitimos guardar en la tabla activities
    protected $fillable = [
        'module_id',
        'name',
        'max_stars',
    ];

    // Conversión de tipos de datos
    protected $casts = [
        'max_stars' => 'integer',
    ];

    // RELACIÓN: Una actividad pertenece a un único módulo
    public function module()
    {
        return $this->belongsTo(Module::class);
    }

    // RELACIÓN: Una actividad puede tener varios registros de progreso (uno por cada usuario que la juegue)
    public function progress()
    {
        return $this->hasMany(Progress::class);
    }
}

