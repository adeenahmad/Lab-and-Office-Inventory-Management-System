// To parse this JSON data, do
//
//     final getHistoryModel = getHistoryModelFromJson(jsonString);

import 'dart:convert';

GetHistoryModel getHistoryModelFromJson(String str) => GetHistoryModel.fromJson(json.decode(str));

String getHistoryModelToJson(GetHistoryModel data) => json.encode(data.toJson());

class GetHistoryModel {
  int hid;
  int itemId;
  String olderVenue;
  String newVenue;
  DateTime dateOfShifting;
  String inventoryName;
  String category;

  GetHistoryModel({
    required this.hid,
    required this.itemId,
    required this.olderVenue,
    required this.newVenue,
    required this.dateOfShifting,
    required this.inventoryName,
    required this.category,
  });

  factory GetHistoryModel.fromJson(Map<String, dynamic> json) => GetHistoryModel(
    hid: json["HID"],
    itemId: json["ItemID"],
    olderVenue: json["Older_Venue"],
    newVenue: json["New_Venue"],
    dateOfShifting: DateTime.parse(json["DateOfShifting"]),
    inventoryName: json["InventoryName"],
    category: json["Category"],
  );

  Map<String, dynamic> toJson() => {
    "HID": hid,
    "ItemID": itemId,
    "Older_Venue": olderVenue,
    "New_Venue": newVenue,
    "DateOfShifting": "${dateOfShifting.year.toString().padLeft(4, '0')}-${dateOfShifting.month.toString().padLeft(2, '0')}-${dateOfShifting.day.toString().padLeft(2, '0')}",
    "InventoryName": inventoryName,
    "Category": category,
  };
}
