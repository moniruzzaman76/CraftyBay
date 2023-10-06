import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/application/state_holder_binders.dart';
import 'package:flutter_ecommerce/presentation/ui/screen/splash_screen.dart';
import 'package:flutter_ecommerce/presentation/ui/utils/app_colors.dart';
import 'package:get/get.dart';

class CraftyBay extends StatefulWidget {
  static GlobalKey<NavigatorState>globalKey = GlobalKey<NavigatorState>();
  const CraftyBay({Key? key}) : super(key: key);

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}
class _CraftyBayState extends State<CraftyBay> {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      key: CraftyBay.globalKey,
      debugShowCheckedModeBanner: false,
      initialBinding:StateHolderBinder(),
      theme: ThemeData(
          primarySwatch:
              MaterialColor(AppColors.primaryColor.value, AppColors().color),

          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                textStyle: const TextStyle(
                  fontSize: 15,
                  letterSpacing: .5,
                  fontWeight: FontWeight.w500,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
          ),


          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          )

      ),
      home: const SplashScreen(),
    );
  }
}


