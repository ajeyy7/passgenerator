import 'package:flutter/material.dart';
import 'package:passgenerator/view/pages/components/buttons.dart';
import 'package:passgenerator/view/pages/homepage.dart';

class SplashinfoPage extends StatelessWidget {
  const SplashinfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF22308C), // Navy blue
                Color(0xFF2356C5), // Lighter shade of navy blue
                Color(0xFF3A7ED2),
                Color(0xFF1C2475), // Even lighter shade of navy blue
                Color(0xFF101D4A), // Navy blue
                Color(0xFF05122D), // Darker shade of navy blue
              ],
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Container(
                height: 150,
                width: 400,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/secure.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const Text(
                'Your Ultimate Password Companion!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  'Safeguard your online presence with ease as we tailor passwords to fit each of your social media accounts perfectly.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 80),
              CommonButton(
                name: "Get Started",
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomePage()));
                },
                backgroundColor: Colors.indigo,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
