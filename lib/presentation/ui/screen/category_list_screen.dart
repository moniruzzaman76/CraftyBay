import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/State_holders/product_popular_controller.dart';
import 'package:get/get.dart';
import '../widgets/product_card.dart';

class CateGoryListScreen extends StatelessWidget {
  const CateGoryListScreen({Key? key}) : super(key: key);

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
        child: GetBuilder<ProductPopularController>(
          builder: (productRemarkController) {
            return GridView.builder(
                itemCount: productRemarkController.popularModel.data?.length ?? 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  childAspectRatio: 7/8
                ) ,
                itemBuilder: (context, index){
                  return  ProductCard(remarkData:productRemarkController.popularModel.data![index]);
                }
            );
          }
        ),
      )
    );
  }
}
