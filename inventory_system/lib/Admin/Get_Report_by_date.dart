import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import '../Json_Model/get_report_by_date_model.dart';

class ReportByDate extends StatefulWidget {
  const ReportByDate({Key? key}) : super(key: key);

  @override
  State<ReportByDate> createState() => _ReportByDateState();
}

class _ReportByDateState extends State<ReportByDate> {
  TextEditingController statusController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  final client = Dio();
  final apiUrl = 'http://192.168.10.10/BIIT_LOIS_API/api/Lois/GetReportByDate';

  Future<List<GetReportByDate>> fetchReportByDate(String status, DateTime date) async {
    final formattedDate = DateFormat('yyyy-MM-dd').format(date);
    final response = await client.get(apiUrl, queryParameters: {
      'status': status,
      'ndate': formattedDate,
    });
    if (response.statusCode == 200) {
      final List<dynamic> responseData = response.data;
      return responseData.map((item) => GetReportByDate.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch report by date');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report By Date'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            TextField(
              controller: statusController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Status',
                hintText: 'Enter status',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: dateController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Date',
                hintText: 'Enter date (YYYY-MM-DD)',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final status = statusController.text;
                final date = DateTime.tryParse(dateController.text);
                if (status.isNotEmpty && date != null) {
                  fetchReportByDate(status, date).then((report) {
                    // Handle fetched report data
                    // e.g., display the report using ListView.builder
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Report'),
                          content: SizedBox(
                            height: 200,
                            child: ListView.builder(
                              itemCount: report.length,
                              itemBuilder: (BuildContext context, int index) {
                                final item = report[index];
                                return ListTile(
                                  title: Text('Inventory Name: ${item.inventoryName}'),
                                  subtitle: Text('Venue: ${item.venue}\nCategory: ${item.category}\nItem Name: ${item.itemName}\nStatus: ${item.status}'),
                                );
                              },
                            ),
                          ),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }).catchError((error) {
                    // Handle error
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Error'),
                          content: Text('Failed to fetch report by date: $error'),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                textStyle: const TextStyle(fontSize: 16),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Fetch Report'),
            ),
          ],
        ),
      ),
    );
  }
}
