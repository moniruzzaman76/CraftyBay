import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/presentation/ui/utils/app_colors.dart';
import 'package:flutter_ecommerce/presentation/ui/utils/image_assets.dart';
import 'package:flutter_ecommerce/presentation/ui/widgets/category_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../widgets/circular_button.dart';
import '../widgets/product_card.dart';
import '../widgets/section_header.dart';
import 'categories_list_screen.dart';

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

              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  viewportFraction: 1,
                  autoPlay: true,
                  onPageChanged: ( int page, _ ){
                    selectedSlider.value = page;
                  },

                ),
                items: [1,2,3,4,5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration:const BoxDecoration(
                              color: AppColors.primaryColor
                          ),
                          child: Center(child: Text('text $i',))
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 8,),

              ValueListenableBuilder(
                valueListenable: selectedSlider,
                builder: (BuildContext context, value, _) {
                  List<Widget>list = [];
                  for( int i = 0; i<5; i++){
                    list.add( Container(
                      margin: const EdgeInsets.symmetric(horizontal:4),
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        shape: BoxShape.circle,
                        color: value == i ? AppColors.primaryColor:Colors.white,
                      ),
                    ),);
                  }
                 return Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children:list,
                 );
                },
              ),


              const SizedBox(height: 16,),
                 SectionHeader(
                   onTap: (){
                     Get.to(const CategoriesListScreen());
                   },
                   title: "All Categories",
                 ),
              const SizedBox(height: 8,),
              SizedBox(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 10,
                    itemBuilder:(context,index){
                    return const CategoryCard();
                    },
                ),
              ),


              const SizedBox(height: 12,),
              SectionHeader(
                onTap: (){
                  //Get.to(const CategoriesListScreen());
                },
                title: "Popular",
              ),
              const SizedBox(height: 8,),
              SizedBox(
                height: 155,
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
                  //Get.to(const CategoriesListScreen());
                },
                title: "Special",
              ),
              const SizedBox(height: 8,),
              SizedBox(
                height: 155,
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
                  //Get.to(const CategoriesListScreen());
                },
                title: "New",
              ),
              const SizedBox(height: 8,),
              SizedBox(
                height: 155,
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






