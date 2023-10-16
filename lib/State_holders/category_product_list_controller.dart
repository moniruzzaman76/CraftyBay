import 'package:get/get.dart';
import '../data/model/network_response.dart';
import '../data/model/product_remark_model.dart';
import '../data/services/network_caller.dart';
import '../data/utils/urls.dart';

class CategoryProductListController extends GetxController{

  bool _productCategoryInProgress = false;
  bool get productCategoryInProgress => _productCategoryInProgress;

  ProductReviewModel _productListModel = ProductReviewModel();
  ProductReviewModel get productListModel=> _productListModel;

  String _message = " ";
  String get message =>_message;

  Future<bool>getProductByCategoryList(int categoryId)async{
    _productCategoryInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller().getRequest(Urls.getProductByCategory(categoryId));

    _productCategoryInProgress = false;
    update();

    if(response.isSuccess){
      _productListModel = ProductReviewModel.fromJson(response.responseJson ?? {});
      return true;
    }else{
      _productCategoryInProgress = false;
      update();
      _message = "failed! get to product new data";
      return false;
    }
  }


}