import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../Json_Model/get_history_model.dart';
import '../URL/base_url.dart';
class CheckHistory extends StatefulWidget {
  const CheckHistory({Key? key}) : super(key: key);

  @override
  State<CheckHistory> createState() => _CheckHistoryState();
}

class _CheckHistoryState extends State<CheckHistory> {
  TextEditingController pidController = TextEditingController();
  final client = Dio();
  GetHistoryModel? getHistoryModel;
  gethistory() async {
    final url = '${BaseUrl.url}BIIT_LOIS_API/api/Lois/GetHistory?ItmID=${pidController.text}';
    try {
      final response = await client.get(url);
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is List) {
          if (responseData.isNotEmpty) {
            setState(() {
              final firstItem = responseData.first;
              getHistoryModel = GetHistoryModel.fromJson(firstItem);
              debugPrint("view status data ::: ${getHistoryModel!.inventoryName}");
            });
          } else {
            // Handle the case when the list is empty
          }
        } else if (responseData is Map<String, dynamic>) {
          setState(() {
            getHistoryModel = GetHistoryModel.fromJson(responseData);
            debugPrint("view status data ::: ${getHistoryModel!.inventoryName}");
          });
        } else {
          // Handle other response data types if needed
        }
        debugPrint("data : $responseData");
      } else {
        // Handle non-200 status codes if needed
      }
    } catch (e) {
      debugPrint("error ::: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Location History"),
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 60.2,
          toolbarOpacity: 0.8,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
          elevation: 0.00,
          backgroundColor: Colors.indigo[400],
        ),
        //AppBar
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: pidController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Product Id :',
                    hintText: 'Enter Id:',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  gethistory();
                  // Action to perform when the button is pressed
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  textStyle: const TextStyle(fontSize: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Search'),
              ),
              const SizedBox(
                height: 30,
              ),
            getHistoryModel != null ?  Padding(
                  padding: const EdgeInsets.only(
                    right: 80.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(
                        'Item ID :${getHistoryModel?.itemId ?? ""} ',
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 26,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Older Venue:${getHistoryModel?. olderVenue ?? ""}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 26,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'New Venue:${getHistoryModel?. newVenue ?? ""}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 26,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      Text(
                        'Date Of Shifting:${getHistoryModel?.dateOfShifting ?? ""}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 26,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'InventoryName:${getHistoryModel?. inventoryName ?? ""}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 26,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Category:${getHistoryModel?. category ?? ""}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      ),

                    ],
                  )) : Container()
            ],
          ),
        ));
  }
}
