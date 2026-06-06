import 'package:alu_connect/screens/homeScreen.dart';
import 'package:alu_connect/theme/index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AluConnect());
}

class AluConnect extends StatelessWidget {
  const AluConnect({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Alu Connect",
      theme: AppTheme.darkTheme,
      home: const Homescreen(),
    );
  }
}