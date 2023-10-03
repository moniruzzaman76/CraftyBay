import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key, required this.title, this.maxLine, this.fontSize,
  });

  final String title;
  final int? maxLine;
  final double ? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(title,maxLines:maxLine ?? 1 ,style: TextStyle(
      fontSize: fontSize ?? 20,
      color: Colors.black87,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
    ),);
  }
}