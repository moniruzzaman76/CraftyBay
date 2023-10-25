import 'package:flutter_ecommerce/data/model/product_details_data.dart';
import 'package:flutter_ecommerce/data/services/network_response.dart';
import 'package:flutter_ecommerce/data/model/product_details_model.dart';
import 'package:flutter_ecommerce/data/services/network_caller.dart';
import 'package:flutter_ecommerce/data/utils/urls.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  bool _productDetailsInProgress = false;
  bool get productDetailsInProgress => _productDetailsInProgress;

  ProductDetails _productDetails = ProductDetails();
  ProductDetails get productDetails => _productDetails;

  String? _message;
  String? get message => _message;

  Future<bool> getProductDetails(int id) async {
    _productDetailsInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller().getRequest(Urls.productDetails(id));

    _productDetailsInProgress = false;
    update();

    if (response.isSuccess) {
      final productDetailsModel = ProductDetailsModel.fromJson(response.responseJson ?? {});
      if (productDetailsModel.data != null && productDetailsModel.data!.isNotEmpty) {
        _productDetails = productDetailsModel.data!.first;
        return true;
      } else {
        _message = "No product details found";
        return false;
      }
    } else {
      _message = "Failed to get product details data";
      return false;
    }
  }
}


// class ProductDetailController extends GetxController{
//
//   bool _productDetailsInProgress = false;
//   bool get productDetailsInProgress => _productDetailsInProgress;
//
//   ProductDetails _productDetails = ProductDetails();
//   ProductDetails get productDetails => _productDetails;
//
//   String? _message;
//   String? get message  => _message;
//
//
//
//   Future<bool>getProductDetails(int id)async{
//
//     _productDetailsInProgress = true;
//     update();
//
//     final NetworkResponse response = await NetworkCaller().getRequest(Urls.productDetails(id));
//
//     _productDetailsInProgress = false;
//     update();
//
//     if(response.isSuccess){
//       _productDetails = (ProductDetailsModel.fromJson(response.responseJson ?? {})).data!.first;
//       return true;
//     }else{
//       _message = "get failed Product Details data";
//       return false;
//     }
//   }
//
// }

