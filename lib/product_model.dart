import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

// class Product {
// //  final int? id;
// //  final String? name;
//   // final String? price;
//   final Image image;
//   Product({required this.image});
// }

// api
class HomeModel {
  bool? status;
  HomeDataModel? data;
  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    data = HomeDataModel.fromJson(json["data"]);
  }
}

class HomeDataModel {
  List<BannersModel>? banners = [];
  List<ProductsModel>? products = [];
  HomeDataModel.fromJson(Map<String, dynamic> json) {
    json["banners"].forEach((element) {
      banners!.add(BannersModel.fromJson(element));
    });

    json["products"].forEach((element) {
      products!.add(ProductsModel.fromJson(element));
    });
  }
}

class BannersModel {
  int? id;
  String? image;
  BannersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class ProductsModel {
  int? id;
  dynamic price;
  dynamic old_price;
  dynamic discount;
  String? image;
  String? name;
  bool? in_favorites;
  bool? in_cart;
  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    price = json["price"];
    old_price = json["old_price"];
    discount = json["discount"];
    image = json["image"];
    name = json["name"];
    in_favorites = json["in_favorites"];
    in_cart = json["in_cart"];
  }
}
