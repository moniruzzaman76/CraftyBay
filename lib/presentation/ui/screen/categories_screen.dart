import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/State_holders/category_controller.dart';
import 'package:flutter_ecommerce/State_holders/main_botom_nav_controller.dart';
import 'package:flutter_ecommerce/presentation/ui/screen/product_list_screen.dart';
import 'package:get/get.dart';
import '../widgets/category_card.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        Get.find<MainBottomNavController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Categories",style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500
          ),),
          elevation: 0,
          leading:BackButton(
            onPressed: (){
              Get.find<MainBottomNavController>().backToHome();
            },
            color: Colors.black,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GetBuilder<CategoryController>(
            builder: (categoryController) {
              return GridView.builder(
                itemCount: categoryController.categoryModel.data?.length ?? 0,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ) ,
                  itemBuilder: (context, index){
                     return  CategoryCard(
                       categoryData: categoryController.categoryModel.data![index],
                       onPress: (){
                         Get.to(
                             ProductListScreen(categoryId: categoryController.categoryModel.data![index].id!,
                         ));
                       },
                     );
                  }
              );
            }
          ),
        ),
      ),
    );
  }
}



