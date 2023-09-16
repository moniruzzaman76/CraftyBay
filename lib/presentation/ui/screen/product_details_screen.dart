import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/presentation/ui/screen/review_screen.dart';
import 'package:flutter_ecommerce/presentation/ui/utils/image_assets.dart';
import 'package:flutter_ecommerce/presentation/ui/widgets/increment_decrement.dart';
import 'package:flutter_ecommerce/presentation/ui/widgets/payment_card.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  final ValueNotifier selectedSlider = ValueNotifier(0);

  int  selectedColor = 0;
  int selectedSize = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Product Details",style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500
        ),),
        elevation: 0,
        leading:BackButton(
          onPressed: (){
           Navigator.pop(context);
          },
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 240,
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
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(.2)
                                  ),
                                  child: Center(
                                      child: Image.asset(ImageAssets.productImage,fit: BoxFit.cover,),
                                  )
                              );
                            },
                          );
                        }).toList(),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 138,
                        child: ValueListenableBuilder(
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
                      ),
                    ],
                  ),
                  const SizedBox(height: 4,),
                   Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            SizedBox(
                              width: 290,
                              child: Text(
                                "Happy New year Special Deal Save 30%",
                                maxLines: 2,style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                              ),),
                            ),
                            Spacer(),
                            IncrementDecrement(),
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
                        const Text("Color",style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),),
                        const SizedBox(height: 16,),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for(int i = 0; i<5; i++)
                              GestureDetector(
                                onTap: (){
                                  selectedColor = i;
                                  if(mounted){
                                    setState(() {});
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: CircleAvatar(
                                    backgroundColor: selectedColor == i ? AppColors.primaryColor: Colors.blueGrey,
                                    radius: 15,
                                    child: selectedColor == i ? const Icon(Icons.check,color: Colors.white,): null,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16,),
                        const Text("Size",style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),),
                        const SizedBox(height: 16,),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for(int i = 0; i<5; i++)
                                InkWell(
                                  onTap: (){
                                    selectedSize = i;
                                    if(mounted){
                                      setState(() {});
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(6),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.grey),
                                        color: selectedSize ==i ? AppColors.primaryColor:Colors.white,
                                      ),
                                      child: Text("XL",style: TextStyle(
                                        color: selectedSize ==i ? Colors.white:Colors.black87,
                                      ),),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16,),
                        const Text("Description",style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),),
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
          const PaymentCard(title: "Price", buttonName: "Add To Card",fontSize: 16),
        ],
      ),
    );
  }
}
