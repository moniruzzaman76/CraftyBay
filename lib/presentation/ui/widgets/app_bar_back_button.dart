import 'package:flutter/material.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({
    super.key, required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const BackButton(
        color: Colors.black54,
      ),
      title: Text(title, style: const TextStyle(
          color: Colors.black54
      ),),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}