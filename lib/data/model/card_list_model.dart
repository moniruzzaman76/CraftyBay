// import 'product_details_model.dart';
//
// class WishAndCardListModel {
//   String? msg;
//   List<CartAndWishData>? data;
//
//   WishAndCardListModel({this.msg, this.data});
//
//   WishAndCardListModel.fromJson(Map<String, dynamic> json) {
//     msg = json['msg'];
//     if (json['data'] != null) {
//       if (json['data'] is List) {
//         data = <CartAndWishData>[];
//         json['data'].forEach((v) {
//           data?.add(CartAndWishData.fromJson(v));
//         });
//       }
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['msg'] = msg;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class CartAndWishData {
//   int? id;
//   String? email;
//   int? productId;
//   String? color;
//   String? size;
//   String? createdAt;
//   String? updatedAt;
//   Product? product;
//   int numberOfItems = 1;
//
//   CartAndWishData(
//       {this.id,
//         this.email,
//         this.productId,
//         this.color,
//         this.size,
//         this.createdAt,
//         this.updatedAt,
//         this.product});
//
//   CartAndWishData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     email = json['email'];
//     productId = json['product_id'];
//     color = json['color'];
//     size = json['size'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     product = json['product'] != null ? Product.fromJson(json['product']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['email'] = email;
//     data['product_id'] = productId;
//     data['color'] = color;
//     data['size'] = size;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     if (product != null) {
//       data['product'] = product!.toJson();
//     }
//     return data;
//   }
// }

class WishAndCardListModel {
  String? msg;
  List<CartAndWishData>? data;

  WishAndCardListModel({this.msg, this.data});

  WishAndCardListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    final jsonData = json['data'];
    if (jsonData is List) {
      data = <CartAndWishData>[];
      jsonData.forEach((v) {
        data?.add(CartAndWishData.fromJson(v));
      });
    }
    // If 'data' is an integer, create a list with a single item.
    if (jsonData is int) {
      data = <CartAndWishData>[CartAndWishData(id: jsonData)];
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

class CartAndWishData {
  int? id;
  int? userId;
  int? productId;
  String? color;
  String? size;
  String? qty;
  String? price;
  String? createdAt;
  String? updatedAt;
  Product? product;

  CartAndWishData(
      {this.id,
        this.userId,
        this.productId,
        this.color,
        this.size,
        this.qty,
        this.price,
        this.createdAt,
        this.updatedAt,
        this.product});

  CartAndWishData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    color = json['color'];
    size = json['size'];
    qty = json['qty'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
    json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['product_id'] = productId;
    data['color'] = color;
    data['size'] = size;
    data['qty'] = qty;
    data['price'] = price;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  String? title;
  String? shortDes;
  String? price;
  int? discount;
  String? discountPrice;
  String? image;
  int? stock;
  int? star;
  String? remark;
  int? categoryId;
  int? brandId;
  String? createdAt;
  String? updatedAt;

  Product(
      {this.id,
        this.title,
        this.shortDes,
        this.price,
        this.discount,
        this.discountPrice,
        this.image,
        this.stock,
        this.star,
        this.remark,
        this.categoryId,
        this.brandId,
        this.createdAt,
        this.updatedAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shortDes = json['short_des'];
    price = json['price'];
    discount = json['discount'];
    discountPrice = json['discount_price'];
    image = json['image'];
    stock = json['stock'];
    star = json['star'];
    remark = json['remark'];
    categoryId = json['category_id'];
    brandId = json['brand_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['short_des'] = shortDes;
    data['price'] = price;
    data['discount'] = discount;
    data['discount_price'] = discountPrice;
    data['image'] = image;
    data['stock'] = stock;
    data['star'] = star;
    data['remark'] = remark;
    data['category_id'] = categoryId;
    data['brand_id'] = brandId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

