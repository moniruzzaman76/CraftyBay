import 'package:flutter_ecommerce/data/services/network_caller.dart';
import 'package:flutter_ecommerce/data/services/network_response.dart';
import 'package:get/get.dart';

import '../data/model/create_invoice_response_model.dart';
import '../data/utils/urls.dart';

class CreateInvoiceController extends GetxController{

  bool _createInvoiceInProgress = false;
  bool get createInvoiceInProgress=>_createInvoiceInProgress;

  CreateInvoiceResponseModel _createInvoiceResponseModel = CreateInvoiceResponseModel();
  CreateInvoiceData get createInvoiceData =>_createInvoiceResponseModel.data!.first;

  String ? _message;
  String ? get message => _message;

  Future<bool> createInvoice()async {

    _createInvoiceInProgress =true;
    update();

    final NetworkResponse response = await NetworkCaller().getRequest(Urls.invoiceCreate);
    _createInvoiceInProgress =false;
    update();

    if(response.isSuccess){
      _createInvoiceResponseModel = CreateInvoiceResponseModel.fromJson(response.responseJson!);
      return true;
    }else{
      _message = 'Invoice creation failed! Try again';
      return false;
    }
  }
}