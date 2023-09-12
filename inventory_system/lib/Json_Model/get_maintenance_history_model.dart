// To parse this JSON data, do
//
//     final getMaintenanceHistoryModel = getMaintenanceHistoryModelFromJson(jsonString);

import 'dart:convert';

List<GetMaintenanceHistoryModel> getMaintenanceHistoryModelFromJson(String str) => List<GetMaintenanceHistoryModel>.from(json.decode(str).map((x) => GetMaintenanceHistoryModel.fromJson(x)));

String getMaintenanceHistoryModelToJson(List<GetMaintenanceHistoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetMaintenanceHistoryModel {
  int mid;
  int itemId;
  DateTime outDate;
  DateTime inDate;
  String descriptions;
  int charges;
  double vendorContact;
  String vendorName;
  dynamic inventoryItem;

  GetMaintenanceHistoryModel({
    required this.mid,
    required this.itemId,
    required this.outDate,
    required this.inDate,
    required this.descriptions,
    required this.charges,
    required this.vendorContact,
    required this.vendorName,
    this.inventoryItem,
  });

  factory GetMaintenanceHistoryModel.fromJson(Map<String, dynamic> json) => GetMaintenanceHistoryModel(
    mid: json["MID"],
    itemId: json["ItemID"],
    outDate: DateTime.parse(json["OutDate"]),
    inDate: DateTime.parse(json["InDate"]),
    descriptions: json["Descriptions"],
    charges: json["Charges"],
    vendorContact: json["VendorContact"],
    vendorName: json["VendorName"],
    inventoryItem: json["Inventory_Item"],
  );

  Map<String, dynamic> toJson() => {
    "MID": mid,
    "ItemID": itemId,
    "OutDate": outDate.toIso8601String(),
    "InDate": inDate.toIso8601String(),
    "Descriptions": descriptions,
    "Charges": charges,
    "VendorContact": vendorContact,
    "VendorName": vendorName,
    "Inventory_Item": inventoryItem,
  };
}
