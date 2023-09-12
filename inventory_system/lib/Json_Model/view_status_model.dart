import 'dart:convert';

class ViewStatusModel {
  int? itemID;
  String? inventoryName;
  Null? venue;
  Null? issueTo;
  Null? category;
  int? quantity;
  Null? itemName;
  String? status;

  ViewStatusModel({
    this.itemID,
    this.inventoryName,
    this.venue,
    this.issueTo,
    this.category,
    this.quantity,
    this.itemName,
    this.status,
  });

  ViewStatusModel.fromJson(Map<String, dynamic> json) {
    itemID = json['ItemID'];
    inventoryName = json['InventoryName'];
    venue = json['Venue'];
    issueTo = json['IssueTo'];
    category = json['Category'];
    quantity = json['quantity'];
    itemName = json['ItemName'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ItemID'] = this.itemID;
    data['InventoryName'] = this.inventoryName;
    data['Venue'] = this.venue;
    data['IssueTo'] = this.issueTo;
    data['Category'] = this.category;
    data['quantity'] = this.quantity;
    data['ItemName'] = this.itemName;
    data['Status'] = this.status;
    return data;
  }

  List<Map<String, dynamic>> toJsonList(List<ViewStatusModel> models) {
    return models.map((model) => model.toJson()).toList();
  }
}
