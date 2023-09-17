import 'package:flutter/material.dart';

class HeadLineText extends StatelessWidget {
  const HeadLineText({
    super.key, required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,style: const TextStyle(
      fontSize: 20,
      color: Colors.black87,
      fontWeight: FontWeight.bold,
    ),);
  }
}