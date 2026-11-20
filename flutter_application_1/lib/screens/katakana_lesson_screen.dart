import 'package:flutter/material.dart';

// Modelo simple para cada caracter katakana y su lectura
class CaracterKatakana {
  final String caracter;
  final String romaji;

  const CaracterKatakana(this.caracter, this.romaji);
}

class KatakanaLessonScreen extends StatelessWidget {
  const KatakanaLessonScreen({super.key});

  // Lista con los caracteres de la cuadricula (null representa los espacios vacíos)
  final List<CaracterKatakana?> caracteres = const [
    // Fila A
    CaracterKatakana('ア', 'a'),
    CaracterKatakana('イ', 'i'),
    CaracterKatakana('ウ', 'u'),
    CaracterKatakana('エ', 'e'),
    CaracterKatakana('オ', 'o'),
    // Fila Ka
    CaracterKatakana('カ', 'ka'),
    CaracterKatakana('キ', 'ki'),
    CaracterKatakana('ク', 'ku'),
    CaracterKatakana('ケ', 'ke'),
    CaracterKatakana('コ', 'ko'),
    // Fila Sa
    CaracterKatakana('サ', 'sa'),
    CaracterKatakana('シ', 'shi'),
    CaracterKatakana('ス', 'su'),
    CaracterKatakana('セ', 'se'),
    CaracterKatakana('ソ', 'so'),
    // Fila Ta
    CaracterKatakana('タ', 'ta'),
    CaracterKatakana('チ', 'chi'),
    CaracterKatakana('ツ', 'tsu'),
    CaracterKatakana('テ', 'te'),
    CaracterKatakana('ト', 'to'),
    // Fila Na
    CaracterKatakana('ナ', 'na'),
    CaracterKatakana('ニ', 'ni'),
    CaracterKatakana('ヌ', 'nu'),
    CaracterKatakana('ネ', 'ne'),
    CaracterKatakana('ノ', 'no'),
    // Fila Ha
    CaracterKatakana('ハ', 'ha'),
    CaracterKatakana('ヒ', 'hi'),
    CaracterKatakana('フ', 'fu'),
    CaracterKatakana('ヘ', 'he'),
    CaracterKatakana('ホ', 'ho'),
    // Fila Ma
    CaracterKatakana('マ', 'ma'),
    CaracterKatakana('ミ', 'mi'),
    CaracterKatakana('ム', 'mu'),
    CaracterKatakana('メ', 'me'),
    CaracterKatakana('モ', 'mo'),
    // Fila Ya (con espacios vacíos)
    CaracterKatakana('ヤ', 'ya'),
    null,
    CaracterKatakana('ユ', 'yu'),
    null,
    CaracterKatakana('ヨ', 'yo'),
    // Fila Ra
    CaracterKatakana('ラ', 'ra'),
    CaracterKatakana('リ', 'ri'),
    CaracterKatakana('ル', 'ru'),
    CaracterKatakana('レ', 're'),
    CaracterKatakana('ロ', 'ro'),
    // Fila Wa y Wo
    CaracterKatakana('ワ', 'wa'),
    null,
    null,
    null,
    CaracterKatakana('ヲ', 'wo'),
    // Fila N
    CaracterKatakana('ン', 'n'),
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
              'Katakana',
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
                          // Caracter en japonés (Katakana)
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
