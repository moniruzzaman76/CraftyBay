import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/presentation/ui/screen/review_screen.dart';
import 'package:flutter_ecommerce/presentation/ui/widgets/home/product_image_slider.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../widgets/app_bar_back_button.dart';
import '../widgets/custom_stepper.dart';
import '../widgets/payment_card.dart';
import '../widgets/section_title_text.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  final ValueNotifier selectedSlider = ValueNotifier(0);

  int  selectedColor = 0;
  int selectedSize = 0;

  List<Color> colors = [
    Colors.blueGrey,
    Colors.red,
    Colors.green,
    Colors.amberAccent,
    Colors.pink,
    Colors.purple,
  ];

  List<String> sizes = [
    "S", "M", "L", "XL", "XXL", "2XL",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                     const Stack(
                     children: [
                       ProductImageSlider(),
                       AppBarBackButton(title: 'Product details',),
                     ],
                   ),

                    const SizedBox(height: 4,),
                     Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                           Row(
                            children: [
                              const SizedBox(
                                width: 265,
                                child: SectionTitle(title: "Happy New year Special Deal Save 30%",maxLine: 2,),
                              ),
                              const Spacer(),

                              SizedBox(
                                height: 30,
                                child: FittedBox(
                                  child: CustomStepper(
                                      lowerLimit: 1,
                                      upperLimit: 10,
                                      stepValue: 1,
                                      value: 1,
                                      onChange: (newValue) {
                                        print(newValue);
                                      }),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amber,size: 25,),
                              const SizedBox(width: 4,),
                              const Text("4.8",style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),),
                              const SizedBox(width: 16,),
                              TextButton(
                                onPressed: (){
                                  Get.to(const ReviewScreen());
                                },
                                  child: const Text("Review",style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryColor,
                                  ),),
                              ),
                              const SizedBox(width: 16,),
                              const Card(
                                color: AppColors.primaryColor,
                                child: Icon(
                                  Icons.favorite_border_outlined,
                                  color: Colors.white,
                                  size: 23,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5,),
                          const SectionTitle(title: "Color",),
                          const SizedBox(height: 16,),

                          SizedBox(
                            height: 28,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: colors.length,
                                itemBuilder: (context,index){
                                return  InkWell(
                                  onTap: (){
                                    selectedColor = index;
                                    if(mounted){
                                      setState(() {});
                                    }
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: selectedColor == index ? AppColors.primaryColor: colors[index],
                                    radius: 15,
                                    child: selectedColor == index ? const Icon(Icons.check,color: Colors.white,): null,
                                  ),
                                );
                                },
                                separatorBuilder: (context,index){
                                return const SizedBox(
                                width: 8,
                                );},
                            ),
                          ),

                          const SizedBox(height: 16,),
                          const SectionTitle(title: "Size",),
                          const SizedBox(height: 16,),

                          SizedBox(
                            height: 28,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: sizes.length,
                              itemBuilder: (context,index){
                                return  InkWell(
                                  onTap: (){
                                    selectedSize = index;
                                    if(mounted){
                                      setState(() {});
                                    }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 5),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(3),
                                      color: selectedSize == index? AppColors.primaryColor:Colors.white,
                                    ),
                                    child: Text(sizes[index],style: TextStyle(
                                      color: selectedSize == index? Colors.white:Colors.black,
                                    ),)
                                  ),
                                );
                              },
                              separatorBuilder: (context,index){
                                return const SizedBox(
                                  width: 8,
                                );},
                            ),
                          ),

                          const SizedBox(height: 16,),
                           const SectionTitle(title: "Description",),
                          const SizedBox(height: 8,),

                          const Text(
                            """A product description is a form of marketing copy used to describe and explain the benefits of your product. In other words, it provides all the information and details of your product on your ecommerce site. These product details can be one sentence, a short paragraph or bulleted. """,
                            style: TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                          ),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
              PaymentCard(
              title:"Price" ,
               totalCount: '\$1000',
               buttonName: 'Add to cart',
               onTab: (){

               },
            ),
          ],
        ),
      ),
    );
  }
}












