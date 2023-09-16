import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    super.key, required this.title, required this.buttonName, this.fontSize,
  });
  final String title;
  final String buttonName;
  final double ? fontSize;



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(.2),
        borderRadius: const BorderRadius.only(
          topLeft:Radius.circular(16),
          topRight:Radius.circular(16),
        ),
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5,),
          Text(title,style: TextStyle(
            fontSize: fontSize ?? 12,
          ),),
          Row(
            children: [
              const Text("\$100000.00",style: TextStyle(
                fontSize: 18,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              )),
              const Spacer(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(14),
                  ),
                  onPressed: (){

                  },
                  child:  Text(buttonName,style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.white,
                      letterSpacing: 0.7
                  ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}