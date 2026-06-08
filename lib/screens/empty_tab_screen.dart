import 'package:alu_connect/theme/index.dart';
import 'package:flutter/material.dart';

class EmptyTabScreen extends StatelessWidget {
  const EmptyTabScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          '$title coming soon',
          style: AppTextStyles.headingLg,
        ),
      ),
    );
  }
}
