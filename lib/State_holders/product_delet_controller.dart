import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../data/model/card_list_model.dart';
import '../data/model/network_response.dart';
import '../data/services/network_caller.dart';
import '../data/utils/urls.dart';

class ProductDeleteController extends GetxController {

  bool _productDeleteInProgress = false;
  bool get productDeleteInProgress => _productDeleteInProgress;

  CartListModel _cartListModel = CartListModel();
  CartListModel get cardListModel => _cartListModel;

  String _message = " ";
  String get message => _message;

  Future<bool> deleteAddToCardProduct(String productId) async {
    _productDeleteInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller().getRequest(Urls.deleteAddToCard(productId));
    _productDeleteInProgress = false;
     update();
    if (response.isSuccess) {
      _cartListModel =  CartListModel.fromJson(response.responseJson!);
      update();
      return true;
    } else {
      _productDeleteInProgress = false;
       update();
      _message = "failed! plz try again";
      return false;
    }
  }
}