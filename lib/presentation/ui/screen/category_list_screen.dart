import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/presentation/ui/widgets/product_card.dart';
import 'package:get/get.dart';

class CateGoryListScreen extends StatefulWidget {
  const CateGoryListScreen({Key? key}) : super(key: key);

  @override
  State<CateGoryListScreen> createState() => _CateGoryListScreenState();
}

class _CateGoryListScreenState extends State<CateGoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text("Electronics",style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),),
       leading:  IconButton(
         onPressed: (){
           Get.back();
         }, icon: Icon(
         Icons.arrow_back_outlined,
         color: Colors.black.withOpacity(.5),
         size: 22,
       ),),
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              childAspectRatio: 7/8
            ) ,
            itemBuilder: (context, index){
              return const ProductCard();
            }
        ),
      )
    );
  }
}
