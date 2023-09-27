import 'package:flutter_ecommerce/data/model/home_sliders_model.dart';
import 'package:flutter_ecommerce/data/model/network_response.dart';
import 'package:flutter_ecommerce/data/services/network_caller.dart';
import 'package:flutter_ecommerce/data/utils/urls.dart';
import 'package:get/get.dart';

class HomeSlidersController extends GetxController{

   bool _homeSliderInProgress = false;
   bool get homeSliderInProgress => _homeSliderInProgress;

    ProductHomeSlidersModel _productHomeSlidersModel = ProductHomeSlidersModel();
   ProductHomeSlidersModel get productHomeSlidersModel => _productHomeSlidersModel;

   String _message = " ";
   String get message =>_message;


  Future<bool>productHomeSlider()async{
    _homeSliderInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller().getRequest(Urls.getHomeSliders);

    _homeSliderInProgress = false;
    update();

    if(response.isSuccess){
      _productHomeSlidersModel = ProductHomeSlidersModel.fromJson(response.responseJson ?? {} );
      return true;
    }else{

      _homeSliderInProgress = false;
      update();

      _message = "failed! product slider data";
      return false;
    }
  }

}