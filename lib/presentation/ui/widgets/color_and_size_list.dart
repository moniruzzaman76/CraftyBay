import 'package:flutter/material.dart';

class ColorAndSizeList extends StatelessWidget {
  const ColorAndSizeList({Key? key, required this.itemCount, required this.builder, }) : super(key: key);

  final int itemCount;
   final IndexedWidgetBuilder builder;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 28,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (context,index){
          return const SizedBox();
        },
        separatorBuilder: (context,index){
          return const SizedBox(
            width: 8,
          );},
      ),
    );
  }
}
