import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/State_holders/wish_list_controller.dart';
import 'package:flutter_ecommerce/presentation/ui/widgets/wishList_product_card.dart';
import 'package:get/get.dart';
import '../../../State_holders/main_botom_nav_controller.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {


  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Get.find<WishListController>().getWishList();
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
            title: const Text("Wish List",style: TextStyle(
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
          body:GetBuilder<WishListController>(
            builder: (wishListController) {
              if(wishListController.wishListInProgress){
                return const Center(child: CircularProgressIndicator(),);
              }
              if(wishListController.wishListModel.data == null ||wishListController.wishListModel.data!.isEmpty){
                return const Center(child:Text("Empty Wish List Product"),);
              }

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    itemCount: wishListController.wishListModel.data?.length ?? 0,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                        childAspectRatio: 5/6
                    ) ,
                    itemBuilder: (context, index){
                      return WishListProductCard(
                          wishData: wishListController.wishListModel.data![index],
                        onPress: () { },
                      );
                    }
                ),
              );
            }
          )
      ),
    );
  }
}
