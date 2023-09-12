// To parse this JSON data, do
//
//     final getReportByDate = getReportByDateFromJson(jsonString);

import 'dart:convert';

List<GetReportByDate> getReportByDateFromJson(String str) => List<GetReportByDate>.from(json.decode(str).map((x) => GetReportByDate.fromJson(x)));

String getReportByDateToJson(List<GetReportByDate> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetReportByDate {
  int quantity;
  int inventoryId;
  int itemId;
  String inventoryName;
  String venue;
  dynamic issueTo;
  String category;
  int getReportByDateQuantity;
  String itemName;
  String status;
  dynamic rStatus;

  GetReportByDate({
    required this.quantity,
    required this.inventoryId,
    required this.itemId,
    required this.inventoryName,
    required this.venue,
    this.issueTo,
    required this.category,
    required this.getReportByDateQuantity,
    required this.itemName,
    required this.status,
    this.rStatus,
  });

  factory GetReportByDate.fromJson(Map<String, dynamic> json) => GetReportByDate(
    quantity: json["Quantity"],
    inventoryId: json["InventoryID"],
    itemId: json["ItemID"],
    inventoryName: json["InventoryName"],
    venue: json["Venue"],
    issueTo: json["IssueTo"],
    category: json["Category"],
    getReportByDateQuantity: json["quantity"],
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
    "quantity": getReportByDateQuantity,
    "ItemName": itemName,
    "Status": status,
    "rStatus": rStatus,
  };
}
