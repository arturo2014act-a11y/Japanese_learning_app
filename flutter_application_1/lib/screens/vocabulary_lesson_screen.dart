import 'package:flutter/material.dart';

// Modelo para cada categoria de vocabulario
class CategoriaVocabulario {
  final String titulo;
  final String imagenAsset;

  const CategoriaVocabulario({
    required this.titulo,
    required this.imagenAsset,
  });
}

class VocabularyLessonScreen extends StatelessWidget {
  const VocabularyLessonScreen({super.key});

  // Lista de las 6 categorias en el orden exacto de la imagen
  final List<CategoriaVocabulario> categorias = const [
    CategoriaVocabulario(
      titulo: 'Comida',
      imagenAsset: 'assets/images/comida_voca.png',
    ),
    CategoriaVocabulario(
      titulo: 'Números',
      imagenAsset: 'assets/images/numeros_voca.png',
    ),
    CategoriaVocabulario(
      titulo: 'Objetos',
      imagenAsset: 'assets/images/objetos_voca.png',
    ),
    CategoriaVocabulario(
      titulo: 'Colores',
      imagenAsset: 'assets/images/colores_voca.png',
    ),
    CategoriaVocabulario(
      titulo: 'Animales',
      imagenAsset: 'assets/images/animales_voca.png',
    ),
    CategoriaVocabulario(
      titulo: 'Familia',
      imagenAsset: 'assets/images/familia_voca.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6EC),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Titulo principal
            const Text(
              'Vocabulario',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF273B68),
                fontFamily: 'Nunito',
              ),
            ),
            const SizedBox(height: 6),

            // Subtitulo de seleccion
            const Text(
              'Selecciona Lección',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF273B68),
                fontFamily: 'Nunito',
              ),
            ),

            const SizedBox(height: 24),

            // Cuadricula con las tarjetas de vocabulario
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: categorias.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 18,
                    childAspectRatio: 0.88,
                  ),
                  itemBuilder: (context, index) {
                    final categoria = categorias[index];

                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFF6C99B),
                          width: 2.2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFE0C4A4).withValues(alpha: 0.35),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          // Accion de la leccion para mas adelante
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0),
                          child: Column(
                            children: [
                              // Titulo de la categoria arriba
                              Text(
                                categoria.titulo,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF273B68),
                                  fontFamily: 'Nunito',
                                ),
                              ),
                              const SizedBox(height: 8),
                              // Imagen alusiva centrada abajo
                              Expanded(
                                child: Image.asset(
                                  categoria.imagenAsset,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),

      // Barra inferior de navegacion
      bottomNavigationBar: Container(
        height: 64,
        decoration: const BoxDecoration(
          color: Color(0xFFF3ECE0),
          border: Border(
            top: BorderSide(
              color: Color(0xFFE5DDD0),
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home, size: 30, color: Color(0xFF273B68)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: const Icon(Icons.menu_book, size: 28, color: Color(0xFF273B68)),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.bar_chart, size: 30, color: Color(0xFF273B68)),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.person, size: 28, color: Color(0xFF273B68)),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
