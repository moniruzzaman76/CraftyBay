import 'package:flutter_ecommerce/data/model/network_response.dart';
import 'package:flutter_ecommerce/data/services/network_caller.dart';
import 'package:flutter_ecommerce/data/utils/urls.dart';
import 'package:get/get.dart';

class CreateReviewController extends GetxController{
  bool _createReviewInProgress = false;
  bool get createReviewInProgress => _createReviewInProgress;

   String ? _message;
   String ? get message => _message;

   Future<bool>createReview(String description, int productId)async{
     _createReviewInProgress = true;
     update();

     final NetworkResponse response = await NetworkCaller().postRequest(Urls.createReview, <String,dynamic>{
       "product_id":productId,
       "description":description,
     });

     _createReviewInProgress = false;
     update();

     if(response.isSuccess){
       return true;
     }else{
       return false;
     }

   }
}