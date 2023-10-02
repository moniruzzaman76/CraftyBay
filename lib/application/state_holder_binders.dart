import 'package:flutter_ecommerce/State_holders/CreateWishListController.dart';
import 'package:flutter_ecommerce/State_holders/category_controller.dart';
import 'package:flutter_ecommerce/State_holders/home_sliders_controller.dart';
import 'package:flutter_ecommerce/State_holders/otp_verify_controller.dart';
import 'package:flutter_ecommerce/State_holders/product_new_controller.dart';
import 'package:flutter_ecommerce/State_holders/product_popular_controller.dart';
import 'package:flutter_ecommerce/State_holders/product_special_controller.dart';
import 'package:get/get.dart';
import '../State_holders/email_verification_controller.dart';
import '../State_holders/main_botom_nav_controller.dart';

class StateHolderBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(EmailVerifyController());
    Get.put(OTPVerifyController());
    Get.put(HomeSlidersController());
    Get.put(CategoryController());
    Get.put(ProductPopularController());
    Get.put(ProductSpecialController());
    Get.put(ProductNewController());
    Get.put(CreateWishListController());

  }
}