// To parse this JSON data, do
//
//     final getReportByData = getReportByDataFromJson(jsonString);

import 'dart:convert';

List<GetReportByData> getReportByDataFromJson(String str) => List<GetReportByData>.from(json.decode(str).map((x) => GetReportByData.fromJson(x)));

String getReportByDataToJson(List<GetReportByData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetReportByData {
  int quantity;
  int inventoryId;
  int itemId;
  String inventoryName;
  String venue;
  String issueTo;
  String category;
  int getReportByDatumQuantity;
  String itemName;
  String status;
  dynamic rStatus;

  GetReportByData({
    required this.quantity,
    required this.inventoryId,
    required this.itemId,
    required this.inventoryName,
    required this.venue,
    required this.issueTo,
    required this.category,
    required this.getReportByDatumQuantity,
    required this.itemName,
    required this.status,
    this.rStatus,
  });

  factory GetReportByData.fromJson(Map<String, dynamic> json) => GetReportByData(
    quantity: json["Quantity"],
    inventoryId: json["InventoryID"],
    itemId: json["ItemID"],
    inventoryName: json["InventoryName"],
    venue: json["Venue"],
    issueTo: json["IssueTo"],
    category: json["Category"],
    getReportByDatumQuantity: json["quantity"],
    itemName: json["ItemName"],
    status: json["Status"],
    rStatus: json["rStatus"],
  );

  Map<String, dynamic> toJson() => {
    "Quantity": quantity,
    "InventoryID": inventoryId,
    "ItemID": itemId,
    "InventoryName": inventoryName,
    "Venue": venue,
    "IssueTo": issueTo,
    "Category": category,
    "quantity": getReportByDatumQuantity,
    "ItemName": itemName,
    "Status": status,
    "rStatus": rStatus,
  };
}
