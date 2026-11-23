// Modelo de un carácter hiragana
class HiraganaChar {
  final String kana;
  final String romaji;
  final String pronunciation;

  const HiraganaChar({
    required this.kana,
    required this.romaji,
    required this.pronunciation,
  });
}

// Modelo de una palabra de práctica
class PracticeWord {
  final String romaji;
  final String spanish;
  final String hiragana;
  final List<String> chars; // Kana que el usuario debe conocer para que aparezca la pregunta

  const PracticeWord({
    required this.romaji,
    required this.spanish,
    required this.hiragana,
    required this.chars,
  });
}

// Los 46 caracteres del hiragana
const List<HiraganaChar> hiraganaChars = [
  // Fila A
  HiraganaChar(kana: 'あ', romaji: 'a',   pronunciation: 'Se pronuncia: "a"'),
  HiraganaChar(kana: 'い', romaji: 'i',   pronunciation: 'Se pronuncia: "i"'),
  HiraganaChar(kana: 'う', romaji: 'u',   pronunciation: 'Se pronuncia: "u"'),
  HiraganaChar(kana: 'え', romaji: 'e',   pronunciation: 'Se pronuncia: "e"'),
  HiraganaChar(kana: 'お', romaji: 'o',   pronunciation: 'Se pronuncia: "o"'),
  // Fila Ka
  HiraganaChar(kana: 'か', romaji: 'ka',  pronunciation: 'Se pronuncia: "ka"'),
  HiraganaChar(kana: 'き', romaji: 'ki',  pronunciation: 'Se pronuncia: "ki"'),
  HiraganaChar(kana: 'く', romaji: 'ku',  pronunciation: 'Se pronuncia: "ku"'),
  HiraganaChar(kana: 'け', romaji: 'ke',  pronunciation: 'Se pronuncia: "ke"'),
  HiraganaChar(kana: 'こ', romaji: 'ko',  pronunciation: 'Se pronuncia: "ko"'),
  // Fila Sa
  HiraganaChar(kana: 'さ', romaji: 'sa',  pronunciation: 'Se pronuncia: "sa"'),
  HiraganaChar(kana: 'し', romaji: 'shi', pronunciation: 'Se pronuncia: "shi"'),
  HiraganaChar(kana: 'す', romaji: 'su',  pronunciation: 'Se pronuncia: "su"'),
  HiraganaChar(kana: 'せ', romaji: 'se',  pronunciation: 'Se pronuncia: "se"'),
  HiraganaChar(kana: 'そ', romaji: 'so',  pronunciation: 'Se pronuncia: "so"'),
  // Fila Ta
  HiraganaChar(kana: 'た', romaji: 'ta',  pronunciation: 'Se pronuncia: "ta"'),
  HiraganaChar(kana: 'ち', romaji: 'chi', pronunciation: 'Se pronuncia: "chi"'),
  HiraganaChar(kana: 'つ', romaji: 'tsu', pronunciation: 'Se pronuncia: "tsu"'),
  HiraganaChar(kana: 'て', romaji: 'te',  pronunciation: 'Se pronuncia: "te"'),
  HiraganaChar(kana: 'と', romaji: 'to',  pronunciation: 'Se pronuncia: "to"'),
  // Fila Na
  HiraganaChar(kana: 'な', romaji: 'na',  pronunciation: 'Se pronuncia: "na"'),
  HiraganaChar(kana: 'に', romaji: 'ni',  pronunciation: 'Se pronuncia: "ni"'),
  HiraganaChar(kana: 'ぬ', romaji: 'nu',  pronunciation: 'Se pronuncia: "nu"'),
  HiraganaChar(kana: 'ね', romaji: 'ne',  pronunciation: 'Se pronuncia: "ne"'),
  HiraganaChar(kana: 'の', romaji: 'no',  pronunciation: 'Se pronuncia: "no"'),
  // Fila Ha
  HiraganaChar(kana: 'は', romaji: 'ha',  pronunciation: 'Se pronuncia: "ha"'),
  HiraganaChar(kana: 'ひ', romaji: 'hi',  pronunciation: 'Se pronuncia: "hi"'),
  HiraganaChar(kana: 'ふ', romaji: 'fu',  pronunciation: 'Se pronuncia: "fu"'),
  HiraganaChar(kana: 'へ', romaji: 'he',  pronunciation: 'Se pronuncia: "he"'),
  HiraganaChar(kana: 'ほ', romaji: 'ho',  pronunciation: 'Se pronuncia: "ho"'),
  // Fila Ma
  HiraganaChar(kana: 'ま', romaji: 'ma',  pronunciation: 'Se pronuncia: "ma"'),
  HiraganaChar(kana: 'み', romaji: 'mi',  pronunciation: 'Se pronuncia: "mi"'),
  HiraganaChar(kana: 'む', romaji: 'mu',  pronunciation: 'Se pronuncia: "mu"'),
  HiraganaChar(kana: 'め', romaji: 'me',  pronunciation: 'Se pronuncia: "me"'),
  HiraganaChar(kana: 'も', romaji: 'mo',  pronunciation: 'Se pronuncia: "mo"'),
  // Fila Ya
  HiraganaChar(kana: 'や', romaji: 'ya',  pronunciation: 'Se pronuncia: "ya"'),
  HiraganaChar(kana: 'ゆ', romaji: 'yu',  pronunciation: 'Se pronuncia: "yu"'),
  HiraganaChar(kana: 'よ', romaji: 'yo',  pronunciation: 'Se pronuncia: "yo"'),
  // Fila Ra
  HiraganaChar(kana: 'ら', romaji: 'ra',  pronunciation: 'Se pronuncia: "ra"'),
  HiraganaChar(kana: 'り', romaji: 'ri',  pronunciation: 'Se pronuncia: "ri"'),
  HiraganaChar(kana: 'る', romaji: 'ru',  pronunciation: 'Se pronuncia: "ru"'),
  HiraganaChar(kana: 'れ', romaji: 're',  pronunciation: 'Se pronuncia: "re"'),
  HiraganaChar(kana: 'ろ', romaji: 'ro',  pronunciation: 'Se pronuncia: "ro"'),
  // Fila Wa / N
  HiraganaChar(kana: 'わ', romaji: 'wa',  pronunciation: 'Se pronuncia: "wa"'),
  HiraganaChar(kana: 'を', romaji: 'wo',  pronunciation: 'Se pronuncia: "wo"'),
  HiraganaChar(kana: 'ん', romaji: 'n',   pronunciation: 'Se pronuncia: "n"'),
];

// Palabras reales para los ejercicios de tipo 2
const List<PracticeWord> practiceWords = [
  PracticeWord(romaji: 'asa',    spanish: 'mañana',       hiragana: 'あさ',   chars: ['あ', 'さ']),
  PracticeWord(romaji: 'ie',     spanish: 'casa',          hiragana: 'いえ',   chars: ['い', 'え']),
  PracticeWord(romaji: 'ue',     spanish: 'arriba',        hiragana: 'うえ',   chars: ['う', 'え']),
  PracticeWord(romaji: 'eki',    spanish: 'estación',      hiragana: 'えき',   chars: ['え', 'き']),
  PracticeWord(romaji: 'oka',    spanish: 'colina',        hiragana: 'おか',   chars: ['お', 'か']),
  PracticeWord(romaji: 'kiku',   spanish: 'crisantemo',    hiragana: 'きく',   chars: ['き', 'く']),
  PracticeWord(romaji: 'kusa',   spanish: 'hierba',        hiragana: 'くさ',   chars: ['く', 'さ']),
  PracticeWord(romaji: 'kesa',   spanish: 'esta mañana',   hiragana: 'けさ',   chars: ['け', 'さ']),
  PracticeWord(romaji: 'koe',    spanish: 'voz',           hiragana: 'こえ',   chars: ['こ', 'え']),
  PracticeWord(romaji: 'sakana', spanish: 'pez',           hiragana: 'さかな', chars: ['さ', 'か', 'な']),
  PracticeWord(romaji: 'shio',   spanish: 'sal',           hiragana: 'しお',   chars: ['し', 'お']),
  PracticeWord(romaji: 'sushi',  spanish: 'sushi',         hiragana: 'すし',   chars: ['す', 'し']),
  PracticeWord(romaji: 'sora',   spanish: 'cielo',         hiragana: 'そら',   chars: ['そ', 'ら']),
  PracticeWord(romaji: 'tako',   spanish: 'pulpo',         hiragana: 'たこ',   chars: ['た', 'こ']),
  PracticeWord(romaji: 'tsuki',  spanish: 'luna',          hiragana: 'つき',   chars: ['つ', 'き']),
  PracticeWord(romaji: 'teki',   spanish: 'enemigo',       hiragana: 'てき',   chars: ['て', 'き']),
  PracticeWord(romaji: 'tori',   spanish: 'pájaro',        hiragana: 'とり',   chars: ['と', 'り']),
  PracticeWord(romaji: 'natsu',  spanish: 'verano',        hiragana: 'なつ',   chars: ['な', 'つ']),
  PracticeWord(romaji: 'neko',   spanish: 'gato',          hiragana: 'ねこ',   chars: ['ね', 'こ']),
  PracticeWord(romaji: 'hana',   spanish: 'flor',          hiragana: 'はな',   chars: ['は', 'な']),
  PracticeWord(romaji: 'hiru',   spanish: 'mediodía',      hiragana: 'ひる',   chars: ['ひ', 'る']),
  PracticeWord(romaji: 'fune',   spanish: 'barco',         hiragana: 'ふね',   chars: ['ふ', 'ね']),
  PracticeWord(romaji: 'machi',  spanish: 'ciudad',        hiragana: 'まち',   chars: ['ま', 'ち']),
  PracticeWord(romaji: 'mushi',  spanish: 'insecto',       hiragana: 'むし',   chars: ['む', 'し']),
  PracticeWord(romaji: 'mori',   spanish: 'bosque',        hiragana: 'もり',   chars: ['も', 'り']),
  PracticeWord(romaji: 'yama',   spanish: 'montaña',       hiragana: 'やま',   chars: ['や', 'ま']),
  PracticeWord(romaji: 'yuki',   spanish: 'nieve',         hiragana: 'ゆき',   chars: ['ゆ', 'き']),
  PracticeWord(romaji: 'yoru',   spanish: 'noche',         hiragana: 'よる',   chars: ['よ', 'る']),
];
