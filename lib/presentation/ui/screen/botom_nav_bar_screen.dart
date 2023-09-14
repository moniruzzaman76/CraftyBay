import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/presentation/ui/screen/card_screen.dart';
import 'package:flutter_ecommerce/presentation/ui/screen/category_screen.dart';
import 'package:flutter_ecommerce/presentation/ui/screen/home_screen.dart';
import 'package:flutter_ecommerce/presentation/ui/screen/wish_screen.dart';
import 'package:flutter_ecommerce/presentation/ui/utils/app_colors.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {

  int selectedIndex = 0;
  final List<Widget> _screen = [
    const HomeScreen(),
    const CateGoryScreen(),
    const CardScreen(),
    const WishScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_screen[selectedIndex] ,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: AppColors.primaryColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap: (index){
          selectedIndex = index;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home,),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.category_outlined,),label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_rounded,),label: "Card"),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard_outlined,),label: "Wish"),
        ],
      ),
    );
  }
}
