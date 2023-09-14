import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key, required this.onTap, required this.title,
  });

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        )),
        const Spacer(),
        TextButton(
            onPressed: onTap,
            child: const Text("See All",style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
            ))
        )

      ],
    );
  }
}