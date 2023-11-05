import 'package:flutter_ecommerce/data/services/network_caller.dart';
import 'package:flutter_ecommerce/data/services/network_response.dart';
import 'package:flutter_ecommerce/data/utils/urls.dart';
import 'package:get/get.dart';

class RemoveWishListController extends GetxController{

   String? _message = "";
  String? get message => _message;

  Future<bool> deleteWishList(int productId)async {
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.removeWishList(productId));

    if(response.isSuccess){
      return true;
    }else{
      _message = "failed.Please try again";
      return false;
    }
  }

}