import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/State_holders/category_controller.dart';
import 'package:flutter_ecommerce/State_holders/home_sliders_controller.dart';
import 'package:flutter_ecommerce/State_holders/main_botom_nav_controller.dart';
import 'package:flutter_ecommerce/State_holders/product_new_controller.dart';
import 'package:flutter_ecommerce/State_holders/product_popular_controller.dart';
import 'package:flutter_ecommerce/State_holders/product_special_controller.dart';
import 'package:flutter_ecommerce/presentation/ui/screen/category_product_list_screen.dart';
import 'package:flutter_ecommerce/presentation/ui/screen/product_list_screen.dart';
import 'package:flutter_ecommerce/presentation/ui/utils/image_assets.dart';
import 'package:flutter_ecommerce/presentation/ui/widgets/category_card.dart';
import 'package:flutter_ecommerce/presentation/ui/widgets/home/home_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../widgets/circular_button.dart';
import '../widgets/product_card.dart';
import '../widgets/home/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 final ValueNotifier selectedSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title:SvgPicture.asset(ImageAssets.homeLogo),
        actions: [
           CircularIconButton(
             onPress: (){},
             icon: Icons.person_outline_outlined,
           ),
          const SizedBox(width: 10,),
          CircularIconButton(
            onPress: (){},
            icon: Icons.phone_outlined,
          ),
          const SizedBox(width: 10,),
          CircularIconButton(
            onPress: (){},
            icon: Icons.notifications_outlined,
          ),
          const SizedBox(width: 10,),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  hintText: "search",
                  fillColor: Colors.grey[200],
                  filled: true,
                  prefixIcon: const Icon(Icons.search,color: Colors.grey,),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none
                  ),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none
                    ),
                  disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none
                  ),
                ),
              ),
              const SizedBox(height: 16,),

             GetBuilder<HomeSlidersController>(
               builder: (homeSlidersController) {
                 return Visibility(
                   visible: !homeSlidersController.homeSliderInProgress,
                   replacement: const Center(child: CircularProgressIndicator(),),
                     child: HomeSlider(slidersData: homeSlidersController.productHomeSlidersModel.data ?? [],));
               }
             ),

              const SizedBox(height: 16,),
                 SectionHeader(
                   onTap: (){
                    Get.find<MainBottomNavController>().changeScreen(1);
                   },
                   title: "All Categories",
                 ),
              const SizedBox(height: 8,),
              GetBuilder<CategoryController>(
                builder: (categoryController) {
                  return Visibility(
                    visible: !categoryController.categoryInProgress,
                    replacement: const Center(child: CircularProgressIndicator(),),
                    child: SizedBox(
                      height: 110,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: categoryController.categoryModel.data?.length ?? 0,
                          itemBuilder:(context,index){
                          return  CategoryCard(
                            categoryData: categoryController.categoryModel.data![index],
                            onPress: (){
                              Get.to(()=>CategoryProductListScreen(
                                categoryId: categoryController.categoryModel.data![index].id!,
                                productName: categoryController.categoryModel.data![index].categoryName ?? "Product List",

                              ));
                            },
                          );
                          },
                      ),
                    ),
                  );
                }
              ),

              const SizedBox(height: 12,),
              SectionHeader(
                onTap: (){
                  Get.to(()=> ProductListScreen(remarkData: Get.find<ProductPopularController>().popularModel.data ?? []));
                },
                title: "Popular",
              ),
              const SizedBox(height: 8,),
              GetBuilder<ProductPopularController>(
                builder: (productPopularController) {
                  return Visibility(
                    visible: !productPopularController.productRemarkModelInProgress,
                    replacement: const Center(child: CircularProgressIndicator(),),
                    child: SizedBox(
                      height: 165,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productPopularController.popularModel.data?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return ProductCard(
                            remarkData: productPopularController.popularModel.data![index],
                          );
                        },
                      ),
                    ),
                  );
                }
              ),


              const SizedBox(height: 12,),
              SectionHeader(
                onTap: (){
                  Get.to(()=>ProductListScreen(remarkData: Get.find<ProductSpecialController>().specialModel.data ?? [],));
                },
                title: "Special",
              ),
              const SizedBox(height: 8,),
              GetBuilder<ProductSpecialController>(
                builder: (productSpecialController) {
                  return Visibility(
                    visible: !productSpecialController.productSpecialInProgress,
                    replacement: const Center(child: CircularProgressIndicator(),),
                    child: SizedBox(
                      height: 165,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productSpecialController.specialModel.data?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                           return  ProductCard(
                             remarkData: productSpecialController.specialModel.data![index],
                           );
                        },
                      ),
                    ),
                  );
                }
              ),


              const SizedBox(height: 12,),
              SectionHeader(
                onTap: (){
                  Get.to(()=>ProductListScreen(remarkData: Get.find<ProductNewController>().newModel.data ?? [],));
                },
                title: "New",
              ),
              const SizedBox(height: 8,),
              GetBuilder<ProductNewController>(
                builder: (productNewController) {
                  return Visibility(
                    visible: !productNewController.productNewInProgress,
                    replacement: const Center(child: CircularProgressIndicator(),),
                    child: SizedBox(
                      height: 165,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productNewController.newModel.data?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                           return  ProductCard(
                               remarkData: productNewController.newModel.data![index],
                           );
                        },
                      ),
                    ),
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}






