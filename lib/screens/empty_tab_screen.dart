import 'package:flutter/material.dart';

class EmptyTabScreen extends StatelessWidget {
  const EmptyTabScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(title),
      ),
    );
  }
}