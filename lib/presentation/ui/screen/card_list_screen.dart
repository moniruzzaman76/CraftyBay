import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/State_holders/card_list_controller.dart';
import 'package:get/get.dart';
import '../../../State_holders/main_botom_nav_controller.dart';
import '../widgets/add_to_card_list.dart';
import '../widgets/payment_card.dart';


class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Get.find<CardListController>().getCardList();
    });
  }

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
              child: RefreshIndicator(
                onRefresh: ()async{
                  await Get.find<CardListController>().getCardList();
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GetBuilder<CardListController>(
                      builder: (cardListController) {
                        if(cardListController.cardListInProgress){
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if(cardListController.cardListModel.data == null || cardListController.cardListModel.data!.isEmpty){
                          return const Center(child: Text("Empty Card List"),);
                        }
                        return Expanded(
                          child: ListView.builder(
                            itemCount: cardListController.cardListModel.data?.length ?? 0,
                              itemBuilder: (context, int index){
                              print(cardListController.cardListModel.data?.length);
                                return ProductAddToCard(cardData: cardListController.cardListModel.data![index],);
                              }
                          ),
                        );
                      }
                    ),

                  ],
                ),
              ),
            ),
            PaymentCard(
              padding:  const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
              title:"Total Price" ,
              titleFontSize: 12,
              totalCount: '\$100.000',
              buttonName: 'check out',
             child: ElevatedButton(
               onPressed: (){},
               child: const Text("Add To Card"),
             ),
            ),
          ],
        )
      ),
    );
  }
}






