import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/State_holders/category_product_list_controller.dart';
import 'package:flutter_ecommerce/data/model/product_remark_model_data.dart';
import 'package:get/get.dart';
import '../widgets/product_card.dart';

class CategoryProductListScreen extends StatefulWidget {
  final int categoryId;
  final String productName;

  const CategoryProductListScreen({Key? key, required this.categoryId, required this.productName,}) : super(key: key);

  @override
  State<CategoryProductListScreen> createState() => _CategoryProductListScreenState();
}

class _CategoryProductListScreenState extends State<CategoryProductListScreen> {

  @override
  void initState() {
    super.initState();
    Get.find<CategoryProductListController>().getProductByCategoryList(widget.categoryId);
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          title:  Text(widget.productName,style: const TextStyle(
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<CategoryProductListController>(
            builder: (categoryListController) {

              if(categoryListController.productCategoryInProgress){
                return const Center(child: CircularProgressIndicator(),);
              }

              List<RemarkData> remarkData =
                  categoryListController.productListModel.data ?? [];

              if(remarkData.isEmpty){
                return const Center(
                  child: Text("Empty Product List"),
                );
              }

              return GridView.builder(
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
              );
            }
          ),


        )
    );
  }
}
