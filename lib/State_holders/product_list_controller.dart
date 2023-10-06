import 'package:get/get.dart';
import '../data/model/network_response.dart';
import '../data/model/product_remark_model.dart';
import '../data/services/network_caller.dart';
import '../data/utils/urls.dart';

class ProductListController extends GetxController{

  bool _productCategoryInProgress = false;
  bool get productNewInProgress => _productCategoryInProgress;

  ProductRemarkModel _productListModel = ProductRemarkModel();
  ProductRemarkModel get productListModel=> _productListModel;

  String _message = " ";
  String get message =>_message;

  Future<bool>getProductByCategory(int categoryId)async{
    _productCategoryInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller().getRequest(Urls.getProductByCategory(categoryId));

    _productCategoryInProgress = false;
    update();

    if(response.isSuccess){
      _productListModel = ProductRemarkModel.fromJson(response.responseJson ?? {});
      return true;
    }else{
      _productCategoryInProgress = false;
      update();
      _message = "failed! get to product new data";
      return false;
    }
  }

  void setProduct(ProductRemarkModel productListModel){
    _productListModel = productListModel;
    update();
  }


}