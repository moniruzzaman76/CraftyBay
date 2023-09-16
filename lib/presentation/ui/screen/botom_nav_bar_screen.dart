import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/State_holders/main_botom_nav_controller.dart';
import 'package:flutter_ecommerce/presentation/ui/screen/card_screen.dart';
import 'package:flutter_ecommerce/presentation/ui/screen/home_screen.dart';
import 'package:flutter_ecommerce/presentation/ui/screen/wish_screen.dart';
import 'package:flutter_ecommerce/presentation/ui/utils/app_colors.dart';
import 'package:get/get.dart';

import 'categories_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {

  //MainBottomNavController mainBottomNavController = Get.put(MainBottomNavController());



  final List<Widget> _screen = [
    const HomeScreen(),
    const CategoryScreen(),
    const CardScreen(),
    const WishScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (controller) {
        return Scaffold(
          body: _screen[controller.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            selectedItemColor: AppColors.primaryColor,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            currentIndex: controller.selectedIndex,
            onTap: controller.changeScreen,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home,),label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.category_outlined,),label: "Category"),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_rounded,),label: "Card"),
              BottomNavigationBarItem(icon: Icon(Icons.card_giftcard_outlined,),label: "Wish"),
            ],
          ),
        );
      }
    );
  }
}
