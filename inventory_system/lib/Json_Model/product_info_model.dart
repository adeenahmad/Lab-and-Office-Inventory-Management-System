// To parse this JSON data, do
//
//     final productInfoModel = productInfoModelFromJson(jsonString);

import 'dart:convert';

List<ProductInfoModel> productInfoModelFromJson(String str) => List<ProductInfoModel>.from(json.decode(str).map((x) => ProductInfoModel.fromJson(x)));

String productInfoModelToJson(List<ProductInfoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductInfoModel {
  int itemId;
  String inventoryName;
  String venue;
  String issueTo;
  String category;
  int quantity;
  String itemName;
  String status;
  dynamic rStatus;

  ProductInfoModel({
    required this.itemId,
    required this.inventoryName,
    required this.venue,
    required this.issueTo,
    required this.category,
    required this.quantity,
    required this.itemName,
    required this.status,
    this.rStatus,
  });

  factory ProductInfoModel.fromJson(Map<String, dynamic> json) => ProductInfoModel(
    itemId: json["ItemID"],
    inventoryName: json["InventoryName"],
    venue: json["Venue"],
    issueTo: json["IssueTo"],
    category: json["Category"],
    quantity: json["quantity"],
    itemName: json["ItemName"],
    status: json["Status"],
    rStatus: json["rStatus"],
  );

  Map<String, dynamic> toJson() => {
    "ItemID": itemId,
    "InventoryName": inventoryName,
    "Venue": venue,
    "IssueTo": issueTo,
    "Category": category,
    "quantity": quantity,
    "ItemName": itemName,
    "Status": status,
    "rStatus": rStatus,
  };
}
