import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/State_holders/auth_controller.dart';
import 'package:flutter_ecommerce/presentation/ui/screen/botom_nav_bar_screen.dart';
import 'package:flutter_ecommerce/presentation/ui/utils/image_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
     goToNextScreen();
  }

  Future<void> goToNextScreen()async{
    await AuthController.getAccessToken();
    Future.delayed( const Duration(seconds:3)).then((value){
      Get.offAll(() => const BottomNavBarScreen(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(child: SvgPicture.asset(
            ImageAssets.splashLogo,width: 120,)
          ),
          const Spacer(),
          const CircularProgressIndicator(),
          const SizedBox(height: 20,),
          const Text("Version 1.0.0"),
          const SizedBox(height: 15,),
          const Text("Developed by Monir"),
          const SizedBox(height: 15,),

        ],
      ),
    );
  }
}
