<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Module extends Model
{
    use HasFactory;

    // Campos que permitimos guardar de forma masiva en la tabla modules
    protected $fillable = [
        'name',
        'description',
    ];

    // RELACIÓN: Un módulo tiene muchas actividades o ejercicios asociados
    // (Por ejemplo, el módulo "Hiragana" tiene actividades como "Vocales", "Fila K", etc.)
    public function activities()
    {
        return $this->hasMany(Activity::class);
    }
}

