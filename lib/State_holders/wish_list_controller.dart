import 'package:get/get.dart';
import '../data/model/card_list_model.dart';
import '../data/model/network_response.dart';
import '../data/services/network_caller.dart';
import '../data/utils/urls.dart';

class WishListController extends GetxController{

  bool _wishListInProgress = false;
  bool get wishListInProgress=> _wishListInProgress;

  WishAndCardListModel _wishListModel = WishAndCardListModel();
  WishAndCardListModel get wishListModel => _wishListModel;

  String ? _message;
  String? get message => _message;

  Future<bool>getWishList()async {
    _wishListInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.productWishList,isLogin: true);
    _wishListInProgress = false;
     update();
    if(response.isSuccess){
      _wishListModel = WishAndCardListModel.fromJson(response.responseJson!);
      return true;
    }else{
      _message = "failed! get to Card list data";

      return false;
    }

  }


}