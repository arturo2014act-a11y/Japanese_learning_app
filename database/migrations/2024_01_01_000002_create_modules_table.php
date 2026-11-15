<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Corre las migraciones para crear la tabla de módulos.
     */
    public function up(): void
    {
        Schema::create('modules', function (Blueprint $table) {
            // ID principal numérico y único para cada módulo
            $table->id();

            // Nombre del módulo (por ejemplo: "Hiragana", "Katakana", "Vocabulario")
            $table->string('name');

            // Explicación de lo que aprenderá el usuario en este módulo
            $table->text('description');

            // Guarda cuándo fue creado y cuándo fue modificado (created_at, updated_at)
            $table->timestamps();
        });
    }

    /**
     * Revierte las migraciones (elimina la tabla).
     */
    public function down(): void
    {
        Schema::dropIfExists('modules');
    }
};

