import 'package:flutter_ecommerce/data/model/create_wishList_model.dart';
import 'package:flutter_ecommerce/data/model/network_response.dart';
import 'package:flutter_ecommerce/data/services/network_caller.dart';
import 'package:get/get.dart';
import '../data/utils/urls.dart';

class CreateWishListController extends GetxController{

  CreateWishListModel _createWishListModel = CreateWishListModel();
  CreateWishListModel get createWishListModel=> _createWishListModel;

  String ? _message = "";
  String? get message => _message;

  Future<bool>createWishList(String productId)async{
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.createWishList(productId));
    update();
    if(response.isSuccess){
      _createWishListModel = CreateWishListModel.fromJson(response.responseJson ?? {});
      return true;
    }else{
      _message = "failed! get to favorite data";
      return false;
    }
  }

}