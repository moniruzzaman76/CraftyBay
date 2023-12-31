import 'package:flutter_ecommerce/State_holders/create_add_to_card_controller.dart';
import 'package:flutter_ecommerce/State_holders/card_list_controller.dart';
import 'package:flutter_ecommerce/State_holders/category_controller.dart';
import 'package:flutter_ecommerce/State_holders/create_invoice_response_controller.dart';
import 'package:flutter_ecommerce/State_holders/home_sliders_controller.dart';
import 'package:flutter_ecommerce/State_holders/otp_verify_controller.dart';
import 'package:flutter_ecommerce/State_holders/product_delet_controller.dart';
import 'package:flutter_ecommerce/State_holders/product_details_controller.dart';
import 'package:flutter_ecommerce/State_holders/category_product_list_controller.dart';
import 'package:flutter_ecommerce/State_holders/product_new_controller.dart';
import 'package:flutter_ecommerce/State_holders/product_popular_controller.dart';
import 'package:flutter_ecommerce/State_holders/product_special_controller.dart';
import 'package:flutter_ecommerce/State_holders/read_profile_controller.dart';
import 'package:get/get.dart';
import '../State_holders/create_profile_controller.dart';
import '../State_holders/create_review_controller.dart';
import '../State_holders/create_wishList_controller.dart';
import '../State_holders/email_verification_controller.dart';
import '../State_holders/main_botom_nav_controller.dart';
import '../State_holders/review_list_controller.dart';
import '../State_holders/wishList_delete_controller.dart';
import '../State_holders/wish_list_controller.dart';

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
    Get.put(ProductDetailController());
    Get.put(CategoryProductListController());
    Get.put(CreateAddToCardController());
    Get.put(CardListController());
    Get.put(ProductDeleteController());
    Get.put(WishListController());
    Get.put(CreateReviewController());
    Get.put(ProductReviewController());
    Get.put(CreateProfileController());
    Get.put(ReadProfileController());
    Get.put(CreateInvoiceController());
    Get.put(RemoveWishListController());
  }
}