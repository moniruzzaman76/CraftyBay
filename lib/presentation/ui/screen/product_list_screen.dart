import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/model/product_remark_model_data.dart';
import '../widgets/product_card.dart';

class ProductListScreen extends StatelessWidget {
  final int ? categoryId;
  final List<RemarkData> remarkData;
  const ProductListScreen({Key? key, this.categoryId, required this.remarkData, }) : super(key: key);

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text("Product list",style: TextStyle(
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
      body: remarkData.isEmpty ? const Center(child: Text("No Product Available"),):Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: remarkData.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                childAspectRatio: 7/8
            ) ,
            itemBuilder: (context, index){
              return  ProductCard(
                remarkData:remarkData[index],
              );
            }
        ),

      )
    );
  }
}
