import 'package:get/get.dart';
import '../data/model/model_data/product_review_model.dart';
import '../data/model/network_response.dart';
import '../data/services/network_caller.dart';
import '../data/utils/urls.dart';

class ProductReviewController extends GetxController{

  bool _reviewListInProgress = false;
  bool get reviewListInProgress => _reviewListInProgress;

  ProductReviewModel _reviewListModel = ProductReviewModel();
  ProductReviewModel get reviewListModel=> _reviewListModel;

  String _message = " ";
  String get message =>_message;

  Future<bool>getProductReview(int productId)async{
    _reviewListInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller().getRequest(Urls.productReviewList(productId));

    _reviewListInProgress = false;

    if(response.isSuccess){
      _reviewListModel = ProductReviewModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    }else{
      _reviewListInProgress = false;
      update();
      _message = "failed! product special data";
      return false;
    }
  }
}

