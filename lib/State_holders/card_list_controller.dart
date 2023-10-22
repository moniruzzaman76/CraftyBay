import 'package:flutter_ecommerce/data/services/network_response.dart';
import 'package:flutter_ecommerce/data/services/network_caller.dart';
import 'package:flutter_ecommerce/data/utils/urls.dart';
import 'package:get/get.dart';
import '../data/model/card_list_model.dart';

class CardListController extends GetxController{

  bool _cardListInProgress = false;
  bool get cardListInProgress=> _cardListInProgress;

  WishAndCardListModel _cartListModel = WishAndCardListModel();
  WishAndCardListModel get cardListModel => _cartListModel;

  String ? _message;
  String? get message => _message;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  Future<bool>getCardList()async {
    _cardListInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.cardList,isLogin: true);
    _cardListInProgress = false;
    update();

    if(response.isSuccess){
      _cartListModel = WishAndCardListModel.fromJson(response.responseJson!);
      _calculateTotalPrice();
      return true;
    }else{
      _message = "failed! get to Card list data";
      return false;
    }
  }

  void changeItem(int cartId, int noOfItems) {
    _cartListModel.data?.firstWhere((cartData) => cartData.id == cartId).numberOfItems = noOfItems;
    _calculateTotalPrice();
  }

  void _calculateTotalPrice() {
    _totalPrice = 0;
    for (CartAndWishData data in _cartListModel.data ?? []) {
      _totalPrice += ((data.numberOfItems) * (double.tryParse(data.product?.price ?? '0') ?? 0));
    }
    update();
  }


}