import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/State_holders/product_list_controller.dart';
import 'package:flutter_ecommerce/data/model/product_remark_model.dart';
import 'package:get/get.dart';
import '../widgets/product_card.dart';

class ProductListScreen extends StatefulWidget {
  final int ? categoryId;
  final ProductRemarkModel ? product;
  const ProductListScreen({Key? key, this.categoryId, this.product}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}
class _ProductListScreenState extends State<ProductListScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<ProductListController>().getProductByCategory(widget.categoryId!);
      if(widget.categoryId != null){
        Get.find<ProductListController>().getProductByCategory(widget.categoryId!);
      }
      else if(widget.product != null){
        Get.find<ProductListController>().setProduct(widget.product!);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text("Product List",style: TextStyle(
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
        child: GetBuilder<ProductListController>(
          builder: (productListController) {

            if(productListController.productNewInProgress){
              return const Center(child: CircularProgressIndicator());
            }

            if(productListController.productListModel.data?.isEmpty ?? true){
              return  const Center(child: Text("Empty Product"));
            }

            //alternative process
            // if((productListController.productListModel.data?.length ?? 0) == 0){
            //   return  const Center(child: Text("Empty Product"));
            // }

            return GridView.builder(
                itemCount: productListController.productListModel.data?.length ?? 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  childAspectRatio: 7/8
                ) ,
                itemBuilder: (context, index){
                  return  ProductCard(
                      remarkData:productListController.productListModel.data![index],
                    onPress: (){

                    },
                  );
                }
            );
          }
        ),
      )
    );
  }
}
