import 'package:flutter_ecommerce/data/services/network_response.dart';
import 'package:flutter_ecommerce/data/services/network_caller.dart';
import 'package:get/get.dart';
import '../data/utils/urls.dart';

class CreateAddToCardController extends GetxController{
  
  bool _addToCardInProgress = false;
  bool get addToCardInProgress => _addToCardInProgress;
  
  String ? _message;
  String? get message => _message;

  
  Future<bool>addToCard(int productId, String color, String size)async{

    _addToCardInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller().postRequest(Urls.createAddToCard,<String,dynamic> {
      "product_id":productId.toString(),
      "color":color,
      "size":size
    });

    _addToCardInProgress = false;
    update();

    if(response.isSuccess){
      return true;
    }else{
      _message = "failed! add to Card failed";
      return false;
    }

  }
}