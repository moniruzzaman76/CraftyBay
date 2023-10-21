import 'package:get/get.dart';
import '../data/services/network_response.dart';
import '../data/model/product_remark_model.dart';
import '../data/services/network_caller.dart';
import '../data/utils/urls.dart';

class ProductSpecialController extends GetxController{

  bool _productSpecialInProgress = false;
  bool get productSpecialInProgress => _productSpecialInProgress;

  ProductReviewModel _specialModel = ProductReviewModel();
  ProductReviewModel get specialModel=> _specialModel;

  String _message = " ";
  String get message =>_message;

  Future<bool>getSpecialProduct()async{
    _productSpecialInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller().getRequest(Urls.getProductByRemark("special"));

    _productSpecialInProgress = false;
    update();

    if(response.isSuccess){
      _specialModel = ProductReviewModel.fromJson(response.responseJson ?? {});
      return true;
    }else{
      _productSpecialInProgress = false;
      update();
      _message = "failed! product special data";
      return false;
    }
  }
}

