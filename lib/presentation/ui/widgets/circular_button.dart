import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  const CircularIconButton({
    super.key, required this.onPress, required this.icon,
  });

  final VoidCallback onPress;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: CircleAvatar(
          radius: 15,
          backgroundColor: Colors.grey[200],
          child: Icon(
            icon,
            color: Colors.grey,
            size: 18,
          )
      ),
    );
  }
}