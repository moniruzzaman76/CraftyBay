import 'package:flutter_ecommerce/data/model/slider_model_data.dart';

class ProductHomeSlidersModel {
  String? msg;
  List<SliderData>? data;

  ProductHomeSlidersModel({this.msg, this.data});

  ProductHomeSlidersModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <SliderData>[];
      json['data'].forEach((v) {
        data!.add(SliderData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


