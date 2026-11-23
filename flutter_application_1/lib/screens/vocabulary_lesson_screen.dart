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

  // Lista con los temas de vocabulario y sus imagenes
  final List<CategoriaVocabulario> categorias = const [
    CategoriaVocabulario(
      titulo: 'Animales',
      imagenAsset: 'assets/images/animales_voca.png',
    ),
    CategoriaVocabulario(
      titulo: 'Comida',
      imagenAsset: 'assets/images/comida_voca.png',
    ),
    CategoriaVocabulario(
      titulo: 'Familia',
      imagenAsset: 'assets/images/familia_voca.png',
    ),
    CategoriaVocabulario(
      titulo: 'Objetos',
      imagenAsset: 'assets/images/objetos_voca.png',
    ),
    CategoriaVocabulario(
      titulo: 'Números',
      imagenAsset: 'assets/images/numeros_voca.png',
    ),
    CategoriaVocabulario(
      titulo: 'Colores',
      imagenAsset: 'assets/images/colores_voca.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fondo crema caracteristico de la app
      backgroundColor: const Color(0xFFFDF6EC),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),

            // Barra superior con boton para regresar y titulo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF273B68)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Vocabulario',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF273B68),
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ),
                  ),
                  // Espacio fantasma para centrar el titulo perfectamente
                  const SizedBox(width: 48),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Boton superior decorativo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    // Por el momento solo estetico
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF383838),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Aprende el vocabulario',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Nunito',
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Cuadricula con las tarjetas de los temas
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  itemCount: categorias.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 0.88,
                  ),
                  itemBuilder: (context, index) {
                    final categoria = categorias[index];

                    // Recuadro de la categoria
                    return InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        // Accion para entrar a la leccion mas adelante
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: const Color(0xFFF6C99B),
                            width: 2.0,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x10000000),
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Imagen alusiva a la categoria
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Image.asset(
                                  categoria.imagenAsset,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            // Titulo de la categoria
                            Padding(
                              padding: const EdgeInsets.only(bottom: 14.0),
                              child: Text(
                                categoria.titulo,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF273B68),
                                  fontFamily: 'Nunito',
                                ),
                              ),
                            ),
                          ],
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
    );
  }
}
