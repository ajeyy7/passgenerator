import 'package:flutter/material.dart';
import 'package:passgenerator/model/services/passgenservices.dart';
import 'package:passgenerator/view/pages/components/buttons.dart';
import 'package:passgenerator/view/pages/components/passcopybox.dart';

class PasswordGenerationPage extends StatefulWidget {
  final String platform;

  PasswordGenerationPage({required this.platform, Key? key}) : super(key: key);

  @override
  State<PasswordGenerationPage> createState() => _PasswordGenerationPageState();
}

class _PasswordGenerationPageState extends State<PasswordGenerationPage> {
  final PassGen _passGen = PassGen();

  String generatePassword() {
    switch (widget.platform) {
      case 'Instagram':
        return _passGen.generateInstagramPass();
      case 'Facebook':
        return _passGen.generateFacebookPass();
      case 'LinkedIn':
        return _passGen.generateLinkedInPass();
      case 'Snapchat':
        return _passGen.generateSnapchatPass();
      default:
        return '';
    }
  }

  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF1C2475),
        title: Text(
          '${widget.platform} Password Generator',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF22308C),
              Color(0xFF1C2475), // Slightly lighter shade of navy blue
              Color(0xFF101D4A), // Navy blue
              Color(0xFF05122D), // Darker shade of navy blue
              Color(0xFF061A40), // Slightly darker shade of navy blue
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 400,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/passpng.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              child: Text(
                'Generate a strong password for ${widget.platform}',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              child: Text(
                'Policy: ${getPolicy(widget.platform)}',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              child: PassCopy(
                generatedPass: password ?? '',
              ),
            ),
            SizedBox(height: 20),
            CommonButton(
                name: "Generate",
                onPressed: () {
                  setState(() {
                    password = generatePassword();
                  });
                },
                backgroundColor: Colors.indigo),
          ],
        ),
      ),
    );
  }

  String getPolicy(String platform) {
    switch (platform) {
      case 'Instagram':
        return 'Use a combination of at least six numbers, letters, and special characters.';
      case 'Facebook':
        return 'A minimum of 6 characters is required. Use numbers, letters, and punctuation marks.';
      case 'LinkedIn':
        return 'Passwords must have at least 6 characters. Use a mix of capital and lower-case letters, numbers, and symbols.';
      case 'Snapchat':
        return 'At least eight characters in length. Includes at least one uppercase letter, one lowercase letter, one number, and one symbol.';
      default:
        return '';
    }
  }
}
