import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CalculationContainer extends StatelessWidget {
  const CalculationContainer({
    super.key, this.padding, required this.title, required this.totalCount, required this.buttonName, this.titleFontSize, required this.child,
  });

  final EdgeInsetsGeometry? padding;
  final String title;
  final String totalCount;
  final String  buttonName;
  final double? titleFontSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: titleFontSize ?? 16,
                  color: Colors.black54
              ),),
              const SizedBox(height: 4,),
              Text(totalCount, style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: AppColors.primaryColor
              ),),
            ],
          ),
          SizedBox(
            width: 120,
            child: child,
            // child: ElevatedButton(
            //   onPressed: onTab, child: Text(buttonName),),
          )
        ],
      ),
    );
  }
}