<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Corre las migraciones para crear la tabla de actividades.
     */
    public function up(): void
    {
        Schema::create('activities', function (Blueprint $table) {
            // ID único de la actividad o ejercicio
            $table->id();

            // Llave foránea: indica a qué módulo pertenece este ejercicio
            // Si el módulo se llega a eliminar, se borran automáticamente sus actividades (cascadeOnDelete)
            $table->foreignId('module_id')->constrained('modules')->cascadeOnDelete();

            // Nombre de la lección o ejercicio (ej: "Vocales en Hiragana", "Saludos básicos")
            $table->string('name');

            // Número máximo de estrellas que el estudiante puede ganar en esta lección
            $table->integer('max_stars')->default(3);

            // Guarda cuándo fue creada y actualizada la actividad (created_at, updated_at)
            $table->timestamps();
        });
    }

    /**
     * Revierte las migraciones (elimina la tabla).
     */
    public function down(): void
    {
        Schema::dropIfExists('activities');
    }
};

