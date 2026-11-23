import 'package:flutter/material.dart';

// Modelo para cada tema o leccion de frases basicas
class TemaFrases {
  final String titulo;
  final String imagenAsset;

  const TemaFrases({
    required this.titulo,
    required this.imagenAsset,
  });
}

class BasicPhrasesLessonScreen extends StatelessWidget {
  const BasicPhrasesLessonScreen({super.key});

  // Lista con los temas de frases basicas y sus imagenes
  final List<TemaFrases> temas = const [
    TemaFrases(
      titulo: 'Saludos',
      imagenAsset: 'assets/images/saludos_bas.png',
    ),
    TemaFrases(
      titulo: 'Despedidas',
      imagenAsset: 'assets/images/despedida_bas.png',
    ),
    TemaFrases(
      titulo: 'Presentación',
      imagenAsset: 'assets/images/presentacion_bas.png',
    ),
    TemaFrases(
      titulo: 'Preguntar',
      imagenAsset: 'assets/images/preguntar_bas.png',
    ),
    TemaFrases(
      titulo: 'La Hora',
      imagenAsset: 'assets/images/hora_bas.png',
    ),
    TemaFrases(
      titulo: 'Describir',
      imagenAsset: 'assets/images/describir_bas.png',
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
                        'Frases Básicas',
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
                    'Aprende las frases',
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
                  itemCount: temas.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 0.88,
                  ),
                  itemBuilder: (context, index) {
                    final tema = temas[index];

                    // Recuadro del tema
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
                            // Imagen del tema
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Image.asset(
                                  tema.imagenAsset,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            // Titulo del tema
                            Padding(
                              padding: const EdgeInsets.only(bottom: 14.0),
                              child: Text(
                                tema.titulo,
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
