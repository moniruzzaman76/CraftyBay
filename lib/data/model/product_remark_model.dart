import 'product_remark_model_data.dart';

class ProductReviewModel {
  String? msg;
  List<RemarkData>? data;

  ProductReviewModel({this.msg, this.data});

  ProductReviewModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <RemarkData>[];
      json['data'].forEach((v) {
        data!.add(RemarkData.fromJson(v));
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



class Brand {
  int? id;
  String? brandName;
  String? brandImg;
  String? createdAt;
  String? updatedAt;

  Brand(
      {this.id, this.brandName, this.brandImg, this.createdAt, this.updatedAt});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandName = json['brandName'];
    brandImg = json['brandImg'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['brandName'] = brandName;
    data['brandImg'] = brandImg;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Category {
  int? id;
  String? categoryName;
  String? categoryImg;
  String? createdAt;
  String? updatedAt;

  Category(
      {this.id,
        this.categoryName,
        this.categoryImg,
        this.createdAt,
        this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['categoryName'];
    categoryImg = json['categoryImg'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['categoryName'] = categoryName;
    data['categoryImg'] = categoryImg;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
