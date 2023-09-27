import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/presentation/ui/utils/image_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'auth/email_verify_screen.dart';


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

  void goToNextScreen(){
    Future.delayed(const Duration(seconds:3)).then((value){
      Get.to(const EmailVerificationScreen());
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
          const SizedBox(height: 20,)

        ],
      ),
    );
  }
}
