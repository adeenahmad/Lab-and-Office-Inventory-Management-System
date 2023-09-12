import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:inventory_system/URL/base_url.dart';

import 'Json_Model/view_status_model.dart';

class ViewStatus extends StatefulWidget {
  const ViewStatus({Key? key}) : super(key: key);

  @override
  State<ViewStatus> createState() => _ViewStatusState();
}

class _ViewStatusState extends State<ViewStatus> {
  TextEditingController iidController = TextEditingController();
  final client = Dio();
  ViewStatusModel? viewStatusModel;

/*  viewStatusCallBack() async {
    final  url = 'http://192.168.10.13/BIIT_LOIS_API/api/Lois/GetStatus?itemid=201';
    try {
      client.get(url).then(
            (value) => {
              //abc.add(value.data),
              //debugPrint("${abc.first.inventoryName}"),
             // viewStatusModel = jsonDecode(value.data),
              viewStatusModel = ViewStatusModel.fromJson(value.data),
              debugPrint("view status data ::: ${viewStatusModel!.inventoryName}"),
          value.statusCode,
          debugPrint("data : ${value.data}"),
        },
      );
    } catch (e) {
      debugPrint("error ::: $e");
    }
  }*/
  viewStatusCallBack() async {
    final url = '${BaseUrl.url}BIIT_LOIS_API/api/Lois/GetStatus?itemid=${iidController.text}';
    try {
      final response = await client.get(url);
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is List) {
          if (responseData.isNotEmpty) {
            setState(() {
              final firstItem = responseData.first;
              viewStatusModel = ViewStatusModel.fromJson(firstItem);
              debugPrint("view status data ::: ${viewStatusModel!.inventoryName}");
            });
          } else {
            // Handle the case when the list is empty
          }
        } else if (responseData is Map<String, dynamic>) {
          setState(() {
            viewStatusModel = ViewStatusModel.fromJson(responseData);
            debugPrint("view status data ::: ${viewStatusModel!.inventoryName}");
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
          title: const Text("View Status"),
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            /*Container(
              height: 150,
              width: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white70,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Product Information',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.deepPurple)),
                  Image.asset('assets/Info.jpg',
                      width: 300, height: 90, fit: BoxFit.fill),
                ],
              ),
            ),*/
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 130.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      controller: iidController,
                      //obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Product Id:',
                        hintText: 'Enter Id',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      viewStatusCallBack();
                      // Action to perform when the button is pressed
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      textStyle: const TextStyle(fontSize: 16),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Search'),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                        right: 80.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          (viewStatusModel?.inventoryName != null) ? Padding(
                            padding: EdgeInsets.all(5),
                            child: Text('Inventory Name: ${viewStatusModel?.inventoryName}'),
                          ) : Text(""),
                          (viewStatusModel?.status != null)  ? Padding(
                            padding: EdgeInsets.all(5),
                            child: Text('Status: ${viewStatusModel?.status}'),
                          ) : Text(""),
                        ],
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}
