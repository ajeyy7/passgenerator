import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passgenerator/view/pages/splashpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.exo2TextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashinfoPage(),
    );
  }
}
