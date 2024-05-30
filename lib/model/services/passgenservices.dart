import 'dart:math';

class PassGen {
  String generatePass(
      {required int length,
      bool? incldnum,
      bool? incldspecialchar,
      bool? inclduppercase,
      bool? incldlowecase}) {
    const numbers = '0123456789';
    const specialCharacters = '!@#\$%^&*()_+-=[]{}|;:,.<>?';
    const uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const lowercase = 'abcdefghijklmnopqrstuvwxyz';
    String char = '';
    if (incldnum!) char += numbers;
    if (incldspecialchar!) char += specialCharacters;
    if (inclduppercase!) char += uppercase;
    if (incldlowecase!) char += lowercase;

    final rand = Random();

    return List.generate(length, (index) => char[rand.nextInt(char.length)])
        .join();
  }

  String generateCustomPass({
    required int numbercount,
    required int uppercount,
    required int lowercount,
    required int specialcount,
  }) {
    const numbers = '0123456789';
    const specialCharacters = '!@#\$%^&*()_+-=[]{}|;:,.<>?';
    const uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const lowercase = 'abcdefghijklmnopqrstuvwxyz';
    String pass = '';
    final rand = Random();
    for (int i = 1; i <= uppercount; i++) {
      pass += uppercase[rand.nextInt(uppercase.length)];
    }
    for (int i = 1; i <= lowercount; i++) {
      pass += lowercase[rand.nextInt(lowercase.length)];
    }
    for (int i = 1; i <= specialcount; i++) {
      pass += specialCharacters[rand.nextInt(specialCharacters.length)];
    }
    for (int i = 1; i <= numbercount; i++) {
      pass += numbers[rand.nextInt(numbers.length)];
    }
    return String.fromCharCodes(pass.runes.toList()..shuffle());
  }
   String generateInstagramPass() {
    return generatePass(length: 6, incldlowecase: true, incldnum: true, incldspecialchar: true, inclduppercase: true);
  }

  String generateFacebookPass() {
    return generatePass(length: 6, incldlowecase: true, incldnum: true, incldspecialchar: true, inclduppercase: true);
  }

  String generateLinkedInPass() {
    return generatePass(length: 6, incldlowecase: true, incldnum: true, incldspecialchar: false, inclduppercase: true);
  }

  String generateSnapchatPass() {
    return generatePass(length: 8, incldlowecase: true, incldnum: true, incldspecialchar: true, inclduppercase: true);
  }

}
