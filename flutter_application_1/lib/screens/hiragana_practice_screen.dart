import 'dart:math';
import 'package:flutter/material.dart';
import '../data/hiragana_data.dart';
import 'hiragana_results_screen.dart';

// Estados posibles dentro de la sesión de práctica
enum _PracticeStep { introCard, exercise }

// Modelo interno de una pregunta generada
class _ExerciseQuestion {
  final int type;             // 1 = kana → romaji  |  2 = romaji → palabra hiragana
  final String questionText;
  final String? displayKana;  // Solo para tipo 1
  final List<String> options; // 4 opciones
  final int correctIndex;
  final List<String> relatedKana; // Kana a penalizar si falla

  const _ExerciseQuestion({
    required this.type,
    required this.questionText,
    this.displayKana,
    required this.options,
    required this.correctIndex,
    required this.relatedKana,
  });
}

class HiraganaPracticeScreen extends StatefulWidget {
  const HiraganaPracticeScreen({super.key});

  @override
  State<HiraganaPracticeScreen> createState() => _HiraganaPracticeScreenState();
}

class _HiraganaPracticeScreenState extends State<HiraganaPracticeScreen> {
  final _random = Random();

  //Estado de la sesión
  late int _totalQuestions;
  int _answeredCount = 0;
  int _correctCount  = 0;

  // Kanas que ya conocen
  final Set<String>    _learnedKana   = {};
  // Contador de error para que salgan mas kanas si fallas varias veces
  final Map<String, int> _errorWeights = {};

  // La logica de la pantalla pa saber si es nueva palabra o ejercicio
  _PracticeStep       _step       = _PracticeStep.introCard;
  HiraganaChar?       _introChar;
  _ExerciseQuestion?  _question;
  int?                _selectedIndex;
  bool                _answered   = false;
  String?             _lastKanaUsed;
  int                 _lastExerciseType = 0;

  @override
  void initState() {
    super.initState();
    // preguntas aletorias vamos a dejarlo entre 10 y 15 
    _totalQuestions = 10 + _random.nextInt(6);
    _pickNextStep();
  }

  //  Lógica de navegación entre pasos
  void _pickNextStep() {
    if (_answeredCount >= _totalQuestions) {
      _goToResults();
      return;
    }

    final unlearned = hiraganaChars
        .where((c) => !_learnedKana.contains(c.kana))
        .toList();

    // Pa meter un kana nuevo si no a aprendido ninguno
    bool shouldIntroduce = _learnedKana.isEmpty;
    if (!shouldIntroduce &&
        unlearned.isNotEmpty &&
        _random.nextDouble() < 0.25) {
      shouldIntroduce = true;
    }

    if (shouldIntroduce && unlearned.isNotEmpty) {
      unlearned.shuffle(_random);
      setState(() {
        _introChar = unlearned.first;
        _step      = _PracticeStep.introCard;
      });
    } else {
      _generateExercise();
    }
  }

  // Pa confirmar si se entendio el kana y agregarlo
  void _onIntroConfirmed() {
    if (_introChar == null) return;
    _learnedKana.add(_introChar!.kana);
    // Peso inicial para que aparezca pronto en ejercicios
    _errorWeights[_introChar!.kana] = (_errorWeights[_introChar!.kana] ?? 0) + 1;
    _generateExercise();
  }

  // Como se generan los ejercicios por ahora solo hay 2 tipos el kana a romaji y viceversa, al rato vemos si le metemos el de audio
  void _generateExercise() {
    final availableWords = _getAvailableWords();

    // Pa mezclar los tipos de ejercicios, hay un porcentaje del 40 pa que salga del tipo 2 el de las palabras, pero no puede salir 2 veces seguidas
    int type;
    if (availableWords.isNotEmpty &&
        _lastExerciseType != 2 &&
        _random.nextDouble() < 0.40) {
      type = 2;
    } else {
      type = 1;
    }

    if (type == 1) {
      _generateType1();
    } else {
      _generateType2(availableWords);
    }

    _lastExerciseType = type;
  }

  // Palabras donde todos sus kana ya fueron introducidos al usuario
  List<PracticeWord> _getAvailableWords() {
    return practiceWords
        .where((w) => w.chars.every((c) => _learnedKana.contains(c)))
        .toList();
  }

  // Selección aleatoria de kana segun errores previos
  HiraganaChar _pickWeightedChar() {
    final learned = hiraganaChars
        .where((c) => _learnedKana.contains(c.kana))
        .toList();

    // Una lista donde aparece el kana segun su peso de errores
    final List<HiraganaChar> pool = [];
    for (final char in learned) {
      final weight = 1 + (_errorWeights[char.kana] ?? 0) * 2;
      for (int i = 0; i < weight; i++) {
        pool.add(char);
      }
    }

    // Evitar repetir el último kana usado si hay alternativas
    List<HiraganaChar> candidates =
        pool.where((c) => c.kana != _lastKanaUsed).toList();
    if (candidates.isEmpty) candidates = pool;

    candidates.shuffle(_random);
    return candidates.first;
  }

  // Tipo 1: mostrar kana → elegir romaji
  void _generateType1() {
    final char = _pickWeightedChar();

    final allRomaji = hiraganaChars
        .map((c) => c.romaji)
        .where((r) => r != char.romaji)
        .toList()
      ..shuffle(_random);

    final options = [char.romaji, ...allRomaji.take(3)]..shuffle(_random);
    final correctIndex = options.indexOf(char.romaji);

    setState(() {
      _question = _ExerciseQuestion(
        type:          1,
        questionText:  '¿Qué romaji es este carácter?',
        displayKana:   char.kana,
        options:       options,
        correctIndex:  correctIndex,
        relatedKana:   [char.kana],
      );
      _selectedIndex  = null;
      _answered       = false;
      _step           = _PracticeStep.exercise;
      _lastKanaUsed   = char.kana;
    });
  }

  // Tipo 2: mostrar romaji de una palabra → elegir hiragana correcto
  void _generateType2(List<PracticeWord> available) {
    if (available.isEmpty) {
      _generateType1();
      return;
    }

    available.shuffle(_random);
    final word = available.first;

    final allKanaList = hiraganaChars.map((c) => c.kana).toList();
    final correctChars = word.hiragana.split('');
    final Set<String> usedOptions = {word.hiragana};
    final List<String> distractors = [];

    // Generar distractores cambiando 1 o 2 posiciones del kana correcto
    int attempts = 0;
    while (distractors.length < 3 && attempts < 60) {
      attempts++;
      final modified = List<String>.from(correctChars);
      final positions = List.generate(modified.length, (i) => i)..shuffle(_random);
      final numToChange = _random.nextInt(modified.length) + 1;

      for (int i = 0; i < numToChange && i < positions.length; i++) {
        allKanaList.shuffle(_random);
        final pos = positions[i];
        final repl = allKanaList.firstWhere(
          (k) => k != modified[pos],
          orElse: () => modified[pos],
        );
        modified[pos] = repl;
      }

      final candidate = modified.join();
      if (!usedOptions.contains(candidate)) {
        usedOptions.add(candidate);
        distractors.add(candidate);
      }
    }

    // Jala otros kanas para llenar si no se generaron suficientes distractores
    while (distractors.length < 3) {
      allKanaList.shuffle(_random);
      final candidate = allKanaList.take(correctChars.length).join();
      if (!usedOptions.contains(candidate)) {
        usedOptions.add(candidate);
        distractors.add(candidate);
      } else {
        distractors.add(allKanaList.skip(1).take(correctChars.length).join());
        break;
      }
    }

    final options = [word.hiragana, ...distractors]..shuffle(_random);
    final correctIndex = options.indexOf(word.hiragana);

    setState(() {
      _question = _ExerciseQuestion(
        type:         2,
        questionText: 'Elige los símbolos correctos para "${word.romaji}"',
        options:      options,
        correctIndex: correctIndex,
        relatedKana:  word.chars,
      );
      _selectedIndex = null;
      _answered      = false;
      _step          = _PracticeStep.exercise;
    });
  }

  // Las penalizaciones de respuesta incorrecta y recompensas de respuesta correcta

  void _onAnswerSelected(int index) {
    if (_answered) return; // Bloquear respuesta doble

    final isCorrect = index == _question!.correctIndex;

    if (isCorrect) {
      _correctCount++;
      // menos penalizacion si responde bien
      for (final kana in _question!.relatedKana) {
        if ((_errorWeights[kana] ?? 0) > 0) {
          _errorWeights[kana] = _errorWeights[kana]! - 1;
        }
      }
    } else {
      // penalizar los kana si responde mal
      for (final kana in _question!.relatedKana) {
        _errorWeights[kana] = (_errorWeights[kana] ?? 0) + 1;
      }
    }

    _answeredCount++;

    setState(() {
      _selectedIndex = index;
      _answered      = true;
    });
  }

  void _onContinue() => _pickNextStep();

  void _goToResults() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HiraganaResultsScreen(
          totalQuestions: _totalQuestions,
          correctCount:   _correctCount,
        ),
      ),
    );
  }

  void _exitPractice() => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6EC),
      body: SafeArea(
        child: _step == _PracticeStep.introCard
            ? _buildIntroCard()
            : _buildExercise(),
      ),
    );
  }

  //La tarjeta cuando sale un nuevo kana, con el boton de entendido

  Widget _buildIntroCard() {
    final char = _introChar!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // barra superior
          _buildTopBar(),
          const SizedBox(height: 40),

          const Text(
            '¡Nuevo carácter!',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Color(0xFF273B68),
            ),
          ),
          const SizedBox(height: 32),

          // cuando sale un kana nuevo
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              color: const Color(0xFFD64F7A),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Center(
              child: Text(
                char.kana,
                style: const TextStyle(
                  fontSize: 90,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 28),

          // romaji
          Text(
            char.romaji.toUpperCase(),
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF273B68),
            ),
          ),
          const SizedBox(height: 10),

          // texto de como se pronuncia
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFDCE2EC)),
            ),
            child: Text(
              char.pronunciation,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFF5D6B82),
              ),
            ),
          ),

          const Spacer(),

          // Botón ¡Entendido!
          MaterialButton(
            minWidth: double.infinity,
            height: 56,
            color: const Color(0xFF4CAF50),
            textColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            onPressed: _onIntroConfirmed,
            child: const Text(
              '¡Entendido!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  //Aqui esta la ventana pa los ejercicios 

  Widget _buildExercise() {
    final question = _question;
    if (question == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        children: [
          // barra de progreso y boton de salir
          _buildTopBar(),
          const SizedBox(height: 32),

          // texto de pregunta
          Text(
            question.questionText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF273B68),
            ),
          ),
          const SizedBox(height: 28),

          // Cuadro naranja con kana (solo tipo 1)
          if (question.type == 1 && question.displayKana != null) ...[
            _buildKanaDisplay(question.displayKana!),
            const SizedBox(height: 32),
          ],

          if (question.type == 2) const SizedBox(height: 8),

          // la cuadricula
          _buildAnswerGrid(question),

          const Spacer(),

          // boton para continuar jala solo cuando responde
          MaterialButton(
            minWidth: double.infinity,
            height: 56,
            color: _answered
                ? const Color(0xFF4CAF50)
                : const Color(0xFFB0BEC5),
            textColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            onPressed: _answered ? _onContinue : null,
            child: const Text(
              'Continuar',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  // barra de progreso tambien con el boton de salir no le modifiques nada beto
  Widget _buildTopBar() {
    final progress = _totalQuestions > 0
        ? (_answeredCount / _totalQuestions).clamp(0.0, 1.0)
        : 0.0;

    return Row(
      children: [
        GestureDetector(
          onTap: _exitPractice,
          child: const Icon(Icons.close, size: 26, color: Color(0xFF273B68)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: const Color(0xFFDCE2EC),
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF4CAF50)),
              minHeight: 10,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          '$_answeredCount/$_totalQuestions',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF273B68),
          ),
        ),
      ],
    );
  }

  // este es el recuadro naranja que muestra el kana
  Widget _buildKanaDisplay(String kana) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: const Color(0xFFFF9800),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          kana,
          style: const TextStyle(
            fontSize: 85,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // la cuadricula de las respuestas 2x2
  Widget _buildAnswerGrid(_ExerciseQuestion question) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 2.1,
      ),
      itemBuilder: (context, index) => _buildOptionButton(question, index),
    );
  }

  // boton de opcion con animación de color
  Widget _buildOptionButton(_ExerciseQuestion question, int index) {
    final isSelected = _selectedIndex == index;
    final isCorrect  = index == question.correctIndex;

    Color bgColor     = Colors.white;
    Color textColor   = const Color(0xFF273B68);
    Color borderColor = const Color(0xFFDCE2EC);

    if (_answered) {
      if (isCorrect) {
        bgColor     = const Color(0xFF4CAF50);
        textColor   = Colors.white;
        borderColor = const Color(0xFF4CAF50);
      } else if (isSelected) {
        bgColor     = const Color(0xFFE53935);
        textColor   = Colors.white;
        borderColor = const Color(0xFFE53935);
      }
    }

    // Fuente más grande para palabras en hiragana (tipo 2)
    final fontSize = question.type == 2 ? 26.0 : 18.0;

    return GestureDetector(
      onTap: _answered ? null : () => _onAnswerSelected(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        decoration: BoxDecoration(
          color:        bgColor,
          borderRadius: BorderRadius.circular(14),
          border:       Border.all(color: borderColor, width: 1.5),
        ),
        child: Center(
          child: Text(
            question.options[index],
            style: TextStyle(
              fontSize:   fontSize,
              fontWeight: FontWeight.w600,
              color:      textColor,
            ),
          ),
        ),
      ),
    );
  }
}
