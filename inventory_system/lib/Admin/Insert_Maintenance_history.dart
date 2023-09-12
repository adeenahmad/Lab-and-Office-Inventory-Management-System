import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:inventory_system/URL/base_url.dart';

class InsertHistory extends StatefulWidget {
  const InsertHistory({Key? key}) : super(key: key);

  @override
  State<InsertHistory> createState() => _InsertHistoryState();
}

class _InsertHistoryState extends State<InsertHistory> {
  TextEditingController itemidController = TextEditingController();
  TextEditingController OutDateController = TextEditingController();
  TextEditingController InDateController = TextEditingController();
  TextEditingController DescriptionsController = TextEditingController();
  TextEditingController ChargesController = TextEditingController();
  TextEditingController VendorContactController = TextEditingController();
  TextEditingController VendorNameController = TextEditingController();
  final client = Dio();

  inserthistory(BuildContext context) async {
    const url =
        '${BaseUrl.url}BIIT_LOIS_API/api/Lois/InsertMaintenanceHistory';
    final data = {
      {
        "ItemID": {itemidController.text},
        "OutDate": {OutDateController.text},
        "InDate": {InDateController.text},
        "Descriptions": {DescriptionsController.text},
        "Charges": {ChargesController.text},
        "VendorContact": {VendorContactController.text},
        "VendorName": {VendorNameController.text}
      }
    };
    // print("id inventory : ${idController.text}");
    // print("inventory name : $inventorynameController.text");
    // print("issue: ${issueController.text}");
    // print("venue : ${locationController.text}");
    // print("category : ${categoryController.text}");
    // print("iQuantity: $quantityController.text");
    // print("Status: ${statusController.text}");
    // print("ItemName : $itemnameController.text");
    try {
      final options = Options(contentType: 'application/json');
      client.post(url, data: data, options: options).then(
            (value) => {
              value.statusCode,
              showDialogBox(context, value.data),
              debugPrint("data : ${value.data}"),
            },
          );
    } catch (e) {}
  }


  addMaintenanceHistory(BuildContext context) async {
    const url = '${BaseUrl.url}BIIT_LOIS_API/api/Lois/InsertMaintenanceHistory';

    final data = {
      "ItemID": itemidController.text,
      "OutDate": OutDateController.text,
      "InDate": InDateController.text,
      "Descriptions": DescriptionsController.text,
      "Charges": ChargesController.text,
      "VendorContact": VendorContactController.text,
      "VendorName": VendorNameController.text
    };
    try {
      client.post(url, data: data).then(
            (value) => {
          value.statusCode,
          debugPrint("data : ${value.data}"),
              showDialogBox(context,"Data added successfully"),
        },
      );
    } catch (e) {}
  }

  showDialogBox(BuildContext context, String data) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text(""),
      content: Text(data),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Insert Maintenance History'),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: TextField(
                      controller: itemidController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: ' InventoryItem Id :',
                        hintText: 'Enter  Item Id:',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      controller: OutDateController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Out Date:',
                        hintText: '2023-06-12T10:00:00',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      controller: InDateController,
                      //obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'In Date :',
                        hintText: '2023-06-12T12:00:00:',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      controller: DescriptionsController,
                      //obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Description: ',
                        hintText: 'Enter Description:',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      controller: ChargesController,
                      //obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Charges:',
                        hintText: 'Enter Price:',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      controller: VendorNameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Vender Name:',
                        hintText: 'Enter Name:',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      controller: VendorContactController,
                      //obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Vendor Contact No:',
                        hintText: '03000000000',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: ()  {
                       addMaintenanceHistory(context);
                      // Action to perform when the button is pressed
                      // addinventory(context);
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
                    child: const Text('Add Maintenance History'),
                  )
                ],
              )),
        ));
  }
}
