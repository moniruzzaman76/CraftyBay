import 'package:flutter_ecommerce/data/model/network_response.dart';
import 'package:flutter_ecommerce/data/services/network_caller.dart';
import 'package:flutter_ecommerce/data/utils/urls.dart';
import 'package:get/get.dart';
import '../data/model/card_list_model.dart';

class CardListController extends GetxController{

  bool _cardListInProgress = false;
  bool get cardListInProgress=> _cardListInProgress;

  CartListModel _cartListModel = CartListModel();
  CartListModel get cardListModel => _cartListModel;

  String ? _message;
  String? get message => _message;

  Future<bool>getCardList()async {
    _cardListInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.cardList);
    _cardListInProgress = false;
    update();

    if(response.isSuccess){
      _cartListModel = CartListModel.fromJson(response.responseJson ?? {});
      return true;
    }else{
      _message = "failed! get to Card list data";
      return false;
    }

  }
}