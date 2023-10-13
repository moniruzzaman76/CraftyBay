import 'package:flutter_ecommerce/data/model/network_response.dart';
import 'package:flutter_ecommerce/data/services/network_caller.dart';
import 'package:get/get.dart';
import '../data/utils/urls.dart';

class CreateWishListController extends GetxController{

  String ? _message = "";
  String? get message => _message;

  Future<bool>createWishList(String id)async{
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.createWishList(id));
    update();
    if(response.isSuccess){
      return true;
    }else{
      _message = "failed! get to favorite data";
      return false;
    }
  }

}