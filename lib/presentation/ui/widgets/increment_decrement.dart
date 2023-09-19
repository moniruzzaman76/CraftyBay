import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
class IncrementDecrement extends StatefulWidget {
  const IncrementDecrement({Key? key}) : super(key: key);

  @override
  State<IncrementDecrement> createState() => _IncrementDecrementState();
}

class _IncrementDecrementState extends State<IncrementDecrement> {

  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: (){
            if(count > 1){
              count --;
            }
            setState(() {});
          },
          child: Container(
            height: 22,
            width: 22,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(.7),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text("–", style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ),

        const SizedBox(width:8,),
        Text( count.toString(),style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),),
        const SizedBox(width:8,),

        InkWell(
          onTap: (){
            count++;
            setState(() {});
          },
          child: Container(
            height: 22,
            width: 22,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text("+", style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),
          ),
        )
      ],
    );
  }
}
