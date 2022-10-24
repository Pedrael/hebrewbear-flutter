
const Map<String, String> vowels = {
  'e': '\u05B5',
  'a': '\u05B7',
  'i': '\u05B4',
  'A': '\u05B8',
  '_e': '\u05B0',
  'u': '\u05BB',
  'E': '\u05B6'};

const Map<String, String> letters = {
    "alef": "\u05d0",
    "bet": "\u05d1",
    "gimel": "\u05d2",
    "dalet": "\u05d3",
    "he": "\u05d4",
    "vav": "\u05d5",
    "zayin": "\u05d6",
    "het": "\u05d7",
    "tet": "\u05d8",
    "yod": "\u05d9",
    "kaf": "\u05db",
    "kafSofit": "\u05da",
    "lamed": "\u05dc",
    "mem": "\u05de",
    "memSofit": "\u05dd",
    "nun": "\u05e0",
    "nunSofit": "\u05df",
    "samekh": "\u05e1",
    "ayin": "\u05e2",
    "pe": "\u05e4",
    "peSofit": "\u05e3",
    "tsadi": "\u05e6",
    "tsadiSofit": "\u05e5", 
    "qof": "\u05e7",
    "resh": "\u05e8",
    "shin": "\u05e9",
    "tav": "\u05ea"
};

// String normaliseWord (String word) {
//     String result = word;
//     result.replaceAll(RegExp(r"${letters}"), replace)
//     if(word[last] === letters.kaf) result[last] = letters.kafSofit;
//     if(word[last] === letters.mem) result[last] = letters.memSofit;
//     if(word[last] === letters.nun) result[last] = letters.nunSofit;
//     if(word[last] === letters.pe) result[last] = letters.peSofit;
//     if(word[last] === letters.tsadi) result[last] = letters.tsadiSofit;
//     return result;
// }