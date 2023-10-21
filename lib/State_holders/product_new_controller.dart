import 'package:get/get.dart';
import '../data/services/network_response.dart';
import '../data/model/product_remark_model.dart';
import '../data/services/network_caller.dart';
import '../data/utils/urls.dart';

class ProductNewController extends GetxController{

  bool _productNewInProgress = false;
  bool get productNewInProgress => _productNewInProgress;

  ProductReviewModel _newModel = ProductReviewModel();
  ProductReviewModel get newModel=> _newModel;

  String _message = " ";
  String get message =>_message;

  Future<bool>getNewProduct()async{
    _productNewInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller().getRequest(Urls.getProductByRemark("new"));

    _productNewInProgress = false;
    update();

    if(response.isSuccess){
      _newModel = ProductReviewModel.fromJson(response.responseJson ?? {});
      return true;
    }else{
      _productNewInProgress = false;
      update();
      _message = "failed! get to product new data";
      return false;
    }
  }


}