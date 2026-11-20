import 'package:flutter/material.dart';

// Modelo simple para cada caracter hiragana y su lectura
class CaracterHiragana {
  final String caracter;
  final String romaji;

  const CaracterHiragana(this.caracter, this.romaji);
}

class HiraganaLessonScreen extends StatelessWidget {
  const HiraganaLessonScreen({super.key});

  // Lista con los caracteres de la cuadrícula (null representa los espacios vacíos)
  final List<CaracterHiragana?> caracteres = const [
    // Fila A
    CaracterHiragana('あ', 'a'),
    CaracterHiragana('い', 'i'),
    CaracterHiragana('う', 'u'),
    CaracterHiragana('え', 'e'),
    CaracterHiragana('お', 'o'),
    // Fila Ka
    CaracterHiragana('か', 'ka'),
    CaracterHiragana('き', 'ki'),
    CaracterHiragana('く', 'ku'),
    CaracterHiragana('け', 'ke'),
    CaracterHiragana('こ', 'ko'),
    // Fila Sa
    CaracterHiragana('さ', 'sa'),
    CaracterHiragana('し', 'shi'),
    CaracterHiragana('す', 'su'),
    CaracterHiragana('せ', 'se'),
    CaracterHiragana('そ', 'so'),
    // Fila Ta
    CaracterHiragana('た', 'ta'),
    CaracterHiragana('ち', 'chi'),
    CaracterHiragana('つ', 'tu'),
    CaracterHiragana('て', 'te'),
    CaracterHiragana('と', 'to'),
    // Fila Na
    CaracterHiragana('な', 'na'),
    CaracterHiragana('に', 'ni'),
    CaracterHiragana('ぬ', 'nu'),
    CaracterHiragana('ね', 'ne'),
    CaracterHiragana('の', 'no'),
    // Fila Ha
    CaracterHiragana('は', 'ha'),
    CaracterHiragana('ひ', 'hi'),
    CaracterHiragana('ふ', 'fu'),
    CaracterHiragana('へ', 'he'),
    CaracterHiragana('ほ', 'ho'),
    // Fila Ma
    CaracterHiragana('ま', 'ma'),
    CaracterHiragana('み', 'mi'),
    CaracterHiragana('む', 'mu'),
    CaracterHiragana('め', 'me'),
    CaracterHiragana('も', 'mo'),
    // Fila Ya (con espacios vacíos)
    CaracterHiragana('や', 'ya'),
    null,
    CaracterHiragana('ゆ', 'yu'),
    null,
    CaracterHiragana('よ', 'yu'),
    // Fila Ra
    CaracterHiragana('ら', 'ra'),
    CaracterHiragana('り', 'ri'),
    CaracterHiragana('る', 'ru'),
    CaracterHiragana('れ', 're'),
    CaracterHiragana('ろ', 'ro'),
    // Fila Wa y Wo
    CaracterHiragana('わ', 'wa'),
    null,
    null,
    null,
    CaracterHiragana('を', 'wo'),
    // Fila N
    CaracterHiragana('ん', 'n'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fondo crema de la app
      backgroundColor: const Color(0xFFFDF6EC),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),

            // Título de la pantalla
            const Text(
              'Hiragana',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF273B68),
                fontFamily: 'Nunito',
              ),
            ),

            const SizedBox(height: 16),

            // Botón superior "Aprende los caracteres"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    // Sin función por el momento
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
                    'Aprende los caracteres',
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

            // Cuadrícula de caracteres con scroll
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  itemCount: caracteres.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.72,
                  ),
                  itemBuilder: (context, index) {
                    final item = caracteres[index];

                    // Si la celda es null, dejamos el espacio vacío
                    if (item == null) {
                      return const SizedBox.shrink();
                    }

                    // Cuadro individual de cada caracter
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xFFF6C99B),
                          width: 1.5,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x10000000),
                            blurRadius: 2,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Caracter en japonés
                          Text(
                            item.caracter,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF273B68),
                              fontFamily: 'RoundedMplus',
                            ),
                          ),
                          const SizedBox(height: 2),
                          // Texto debajo del caracter
                          Text(
                            item.romaji,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF5D6B82),
                              fontFamily: 'Nunito',
                            ),
                          ),
                        ],
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
