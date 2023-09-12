// To parse this JSON data, do
//
//     final reportShowModel = reportShowModelFromJson(jsonString);

import 'dart:convert';

List<ReportShowModel> reportShowModelFromJson(String str) => List<ReportShowModel>.from(json.decode(str).map((x) => ReportShowModel.fromJson(x)));

String reportShowModelToJson(List<ReportShowModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReportShowModel {
  int rId;
  int itemId;
  String subject;
  String disc;
  String rStatus;
  dynamic inventoryItem;

  ReportShowModel({
    required this.rId,
    required this.itemId,
    required this.subject,
    required this.disc,
    required this.rStatus,
    this.inventoryItem,
  });

  factory ReportShowModel.fromJson(Map<String, dynamic> json) => ReportShowModel(
    rId: json["RId"],
    itemId: json["ItemID"],
    subject: json["Subject"],
    disc: json["disc"],
    rStatus: json["rStatus"],
    inventoryItem: json["Inventory_Item"],
  );

  Map<String, dynamic> toJson() => {
    "RId": rId,
    "ItemID": itemId,
    "Subject": subject,
    "disc": disc,
    "rStatus": rStatus,
    "Inventory_Item": inventoryItem,
  };
}
