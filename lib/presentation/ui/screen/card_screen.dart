import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/presentation/ui/utils/app_colors.dart';
import 'package:flutter_ecommerce/presentation/ui/widgets/increment_decrement.dart';
import 'package:get/get.dart';
import '../../../State_holders/main_botom_nav_controller.dart';
import '../utils/image_assets.dart';
import '../widgets/payment_card.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  

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
            title: const Text("Card",style: TextStyle(
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
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                  itemBuilder: (context, int index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 120,
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Image.asset(ImageAssets.productImage),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: ListTile(
                                    title:  Row(
                                      children: [
                                        const Text("New year Special shoe",maxLines: 1,style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          overflow: TextOverflow.ellipsis,
                                        ),),
                                        const Spacer(),
                                        IconButton(
                                            onPressed: (){

                                            },
                                            icon: const Icon(
                                              Icons.delete_forever_rounded,
                                              color: Colors.red,
                                              size: 23,
                                            )
                                        ),

                                      ],
                                    ),
                                    subtitle: const Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Color : Red, Size : X",style: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: .5,
                                        ),),
                                        SizedBox(height: 12,),
                                        Row(
                                          children: [

                                            Text("\$100",style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.primaryColor,
                                            ),),
                                            Spacer(),
                                            IncrementDecrement(),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                        ),
                      ),
                    );
                  }
              ),
            ),

             const PaymentCard(
               title: 'Total Price',
               buttonName: "Checkout",

             )
          ],
        )
      ),
    );
  }
}

