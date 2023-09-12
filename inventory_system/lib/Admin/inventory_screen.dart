import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ForSummary {
  final int itemID;
  final String inventoryName;
  final String venue;
  final String issueTo;
  final String category;
  final int quantity;
  final String itemName;
  final String status;

  ForSummary({
    required this.itemID,
    required this.inventoryName,
    required this.venue,
    required this.issueTo,
    required this.category,
    required this.quantity,
    required this.itemName,
    required this.status,
  });

  factory ForSummary.fromJson(Map<String, dynamic> json) {
    return ForSummary(
      itemID: json['ItemID'],
      inventoryName: json['InventoryName'],
      venue: json['Venue'],
      issueTo: json['IssueTo'],
      category: json['Category'],
      quantity: json['quantity'],
      itemName: json['ItemName'],
      status: json['Status'],
    );
  }
}

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({Key? key}) : super(key: key);

  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  List<ForSummary> _inventoryList = [];
  bool _isLoading = false;

  Future<void> _fetchInventoryData() async {
    setState(() {
      _isLoading = true;
    });

    final url = 'http://192.168.10.10/BIIT_LOIS_API/api/Lois/ShowAllInvenventory';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        List<ForSummary> inventory = List.from(jsonResponse)
            .map((data) => ForSummary.fromJson(data))
            .toList();

        setState(() {
          _inventoryList = inventory;
        });
      } else {
        // Handle API error or non-200 status code
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network or server error
      print('Error: $error');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchInventoryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory Screen'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _inventoryList.length,
        itemBuilder: (context, index) {
          final inventory = _inventoryList[index];
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              title: Text(
                inventory.inventoryName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Venue: ${inventory.venue}'),
                  SizedBox(height: 5),
                  Text('Issue To: ${inventory.issueTo}'),
                  SizedBox(height: 5),
                  Text('Category: ${inventory.category}'),
                  SizedBox(height: 5),
                  Text('Quantity: ${inventory.quantity}'),
                ],
              ),
              trailing: Chip(
                backgroundColor: _getStatusColor(inventory.status),
                label: Text(
                  inventory.status,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Color _getStatusColor(String status) {
    if (status == 'Available') {
      return Colors.green;
    } else if (status == 'Issued') {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}
