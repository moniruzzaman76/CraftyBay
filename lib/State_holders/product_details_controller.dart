import 'dart:ui';

import 'package:flutter_ecommerce/data/model/model_data/product_details_data.dart';
import 'package:flutter_ecommerce/data/model/network_response.dart';
import 'package:flutter_ecommerce/data/model/product_details_model.dart';
import 'package:flutter_ecommerce/data/services/network_caller.dart';
import 'package:flutter_ecommerce/data/utils/urls.dart';
import 'package:get/get.dart';

import '../presentation/ui/utils/color_extension.dart';
class ProductDetailController extends GetxController{
  
  bool _productDetailsInProgress = false;
  bool get productDetailsInProgress => _productDetailsInProgress;
  
  ProductDetails _productDetails = ProductDetails();
  ProductDetails get productDetails => _productDetails;

  String? _message;
  String? get message  => _message;



  Future<bool>getProductDetails(int id)async{

    _productDetailsInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller().getRequest(Urls.productDetails(id));

    _productDetailsInProgress = false;
    update();

    if(response.isSuccess){
      _productDetails = (ProductDetailsModel.fromJson(response.responseJson ?? {})).data!.first;
      return true;
    }else{
      _message = "get failed Product Details data";
      return false;
    }
  }


  List<Color> getColorsFromString(String colors) {
    List<Color> hexaColors = [];
    final List<String> allColors = colors.split(",");
    for (var element in allColors) {
      hexaColors.add(HexColor(element));
    }
    return hexaColors;
  }


  List<String> getSizesFromString(String sizes) {
    return sizes.split(",");
  }

  
}
