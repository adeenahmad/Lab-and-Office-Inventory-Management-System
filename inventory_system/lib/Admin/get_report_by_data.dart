import 'dart:convert';
import 'package:flutter/material.dart';
import '../Json_Model/get_report_by_data_model.dart';
import 'package:http/http.dart' as http;
import '../URL/base_url.dart';

class GetReportData extends StatefulWidget {
  const GetReportData({Key? key}) : super(key: key);

  @override
  State<GetReportData> createState() => _GetReportDataState();
}

class _GetReportDataState extends State<GetReportData> {
  final url = "${BaseUrl.url}BIIT_LOIS_API/api/Lois/GetReportByData";

  Future<List<GetReportByData>> fetchPosts() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      List<GetReportByData> posts = jsonResponse
          .map((data) => GetReportByData.fromJson(data))
          .toList();
      return posts;
    } else {
      throw Exception('Failed to fetch posts');
    }
  }

  late Future<List<GetReportByData>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = fetchPosts();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ... app bar configuration ...
      ),
      body: Center(
        child: FutureBuilder<List<GetReportByData>>(
          future: futurePosts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<GetReportByData>? posts = snapshot.data;
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('Inventory Name')),
                      DataColumn(label: Text('Status')),
                      DataColumn(label: Text('Venue')),
                      DataColumn(label: Text('Issue To')),
                      DataColumn(label: Text('Total')),
                      DataColumn(label: Text('Item Name')),
                      DataColumn(label: Text('Quantity')),
                    ],
                    rows: List.generate(posts!.length, (index) {
                      final data = posts[index];
                      return DataRow(
                        cells: [
                          DataCell(Text(data.inventoryName.toString())),
                          DataCell(Text(data.status.toString())),
                          DataCell(Text(data.venue.toString())),
                          DataCell(Text(data.issueTo.toString())),
                          DataCell(Text(data.quantity.toString())),
                          DataCell(Text(data.itemName.toString())),
                          DataCell(Text(data.getReportByDatumQuantity.toString())),
                        ],
                      );
                    }),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}