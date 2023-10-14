import 'package:get/get.dart';
import '../data/model/network_response.dart';
import '../data/model/product_remark_model.dart';
import '../data/services/network_caller.dart';
import '../data/utils/urls.dart';

class ProductPopularController extends GetxController{

  bool _productPopularInProgress = false;
  bool get productRemarkModelInProgress => _productPopularInProgress;

  ProductReviewModel _popularModel = ProductReviewModel();
  ProductReviewModel get popularModel=> _popularModel;

  String _message = " ";
  String get message =>_message;

  Future<bool>getPopularProduct()async{
    _productPopularInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller().getRequest(Urls.getProductByRemark("popular"));

    _productPopularInProgress = false;
    update();

    if(response.isSuccess){
      _popularModel = ProductReviewModel.fromJson(response.responseJson ?? {});
      return true;
    }else{
      _productPopularInProgress = false;
      update();
      _message = "failed! product Popular data";
      return false;
    }
  }


}