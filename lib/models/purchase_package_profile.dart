import 'package:flutter/material.dart';

class PurchasePackageProfile {
  String id;
  String title;
  String strTime;
  double price;
  String contentPrice;
  double discount;

  PurchasePackageProfile(
      {required this.id,
      required this.title,
      required this.strTime,
      required this.price,
      required this.contentPrice,
      required this.discount});

  factory PurchasePackageProfile.fromJson(Map<String, dynamic> json) =>
      PurchasePackageProfile(
        id: json["id"],
        title: json["title"],
        strTime: json["strTime"],
        price: json["price"],
        contentPrice: json["contentPrice"],
        discount: json["discount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "strTime": strTime,
        "price": price,
        "contentPrice": contentPrice,
        "discount": discount,
      };
}
