// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Products welcomeFromJson(String str) => Products.fromJson(json.decode(str));

String welcomeToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    required this.item1,
    required this.categories,
    required this.product1,
  });

  List<Item1> item1;
  List<Category> categories;
  List<Product1> product1;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        item1: List<Item1>.from(json["item1"].map((x) => Item1.fromJson(x))),
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        product1: List<Product1>.from(
            json["product1"].map((x) => Product1.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "item1": List<dynamic>.from(item1.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "product1": List<dynamic>.from(product1.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    required this.title,
    required this.url,
  });

  String title;
  String url;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        title: json["title"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "url": url,
      };
}

class Item1 {
  Item1({
    required this.url,
    required this.title,
    required this.color,
  });

  String url;
  String title;
  String color;

  factory Item1.fromJson(Map<String, dynamic> json) => Item1(
        url: json["url"],
        title: json["title"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "title": title,
        "color": color,
      };
}

class Product1 {
  Product1({
    required this.title,
    required this.url,
    required this.discount,
    required this.actualPrice,
    required this.offerPrice,
  });

  String title;
  String url;
  String discount;
  String actualPrice;
  String offerPrice;

  factory Product1.fromJson(Map<String, dynamic> json) => Product1(
        title: json["title"],
        url: json["url"],
        discount: json["discount"],
        actualPrice: json["actual_price"],
        offerPrice: json["offer_price"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "url": url,
        "discount": discount,
        "actual_price": actualPrice,
        "offer_price": offerPrice,
      };
}
