import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/State_holders/category_controller.dart';
import 'package:flutter_ecommerce/State_holders/home_sliders_controller.dart';
import 'package:flutter_ecommerce/State_holders/main_botom_nav_controller.dart';
import 'package:flutter_ecommerce/presentation/ui/screen/category_list_screen.dart';
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
            onPress: (){

            },
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
                      height: 70,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: categoryController.categoryModel.data?.length ?? 0,
                          itemBuilder:(context,index){
                          return  CategoryCard(categoryData: categoryController.categoryModel.data![index],);
                          },
                      ),
                    ),
                  );
                }
              ),


              const SizedBox(height: 12,),
              SectionHeader(
                onTap: (){
                  Get.to(const CateGoryListScreen());
                },
                title: "Popular",
              ),
              const SizedBox(height: 8,),
              SizedBox(
                height: 165,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return const ProductCard();
                  },
                ),
              ),


              const SizedBox(height: 12,),
              SectionHeader(
                onTap: (){
                  Get.to(const CateGoryListScreen());
                },
                title: "Special",
              ),
              const SizedBox(height: 8,),
              SizedBox(
                height: 165,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return const ProductCard();
                  },
                ),
              ),


              const SizedBox(height: 12,),
              SectionHeader(
                onTap: (){
                  Get.to(const CateGoryListScreen());
                },
                title: "New",
              ),
              const SizedBox(height: 8,),
              SizedBox(
                height: 165,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return const ProductCard();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}






