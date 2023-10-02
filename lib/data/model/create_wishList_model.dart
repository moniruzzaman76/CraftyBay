class CreateWishListModel {
  String? msg;
  FavoriteData? data;

  CreateWishListModel({this.msg, this.data});

  CreateWishListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? FavoriteData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class FavoriteData {
  String? email;
  String? productId;
  String? updatedAt;
  String? createdAt;
  int? id;

  FavoriteData({this.email, this.productId, this.updatedAt, this.createdAt, this.id});

  FavoriteData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    productId = json['product_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['product_id'] = productId;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
