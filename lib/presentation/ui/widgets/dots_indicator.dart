import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({
    super.key,
    required this.selectedSlider,
  });

  final ValueNotifier selectedSlider;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 138,
      child: ValueListenableBuilder(
        valueListenable: selectedSlider,
        builder: (BuildContext context, value, _) {
          List<Widget>list = [];
          for( int i = 0; i<5; i++){
            list.add( Container(
              margin: const EdgeInsets.symmetric(horizontal:4),
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                shape: BoxShape.circle,
                color: value == i ? AppColors.primaryColor:Colors.white,
              ),
            ),);
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:list,
          );
        },
      ),
    );
  }
}