import 'package:flutter_ecommerce/data/model/category_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../data/services/network_response.dart';
import '../data/services/network_caller.dart';
import '../data/utils/urls.dart';

class CategoryController extends GetxController{

  bool _categoryInProgress = false;
  bool get categoryInProgress => _categoryInProgress;

  CategoryModel _categoryModel = CategoryModel();
  CategoryModel get categoryModel=> _categoryModel;


  String _message = " ";
  String get message =>_message;


  Future<bool>getCategoryProduct()async{
    _categoryInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller().getRequest(Urls.categoryProduct);

    _categoryInProgress = false;
    update();

    if(response.isSuccess){
      _categoryModel = CategoryModel.fromJson(response.responseJson ?? {} );
      return true;
    }else{
      _categoryInProgress = false;
      update();

      _message = "failed! product category data data";
      return false;
    }
  }

}