import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../State_holders/main_botom_nav_controller.dart';
class WishScreen extends StatefulWidget {
  const WishScreen({Key? key}) : super(key: key);

  @override
  State<WishScreen> createState() => _WishScreenState();
}

class _WishScreenState extends State<WishScreen> {


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
          body:Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    childAspectRatio: 5/6
                ) ,
                itemBuilder: (context, index){
                  //return const ProductCard();
                }
            ),
          )
      ),
    );
  }
}
