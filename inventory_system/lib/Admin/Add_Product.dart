import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../URL/base_url.dart';


class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  TextEditingController idController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController inventorynameController = TextEditingController();
  TextEditingController issueController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController itemnameController = TextEditingController();


  final client = Dio();

  addinventory(BuildContext context) async {
    const url = '${BaseUrl.url}BIIT_LOIS_API/api/Lois/addInventory';
    final data = {
        "Inventory": {
          "InventoryID":idController.text ,
          "InventoryName": inventorynameController.text,
          "IssueTo": issueController.text,
          "venue": locationController.text,
          "Category": categoryController.text,
          "Quantity": quantityController.text
        },
        "InventoryItem": {
          "ItemName": itemnameController.text,
          "Status": statusController.text
        }
    };
    try {
      final options = Options(contentType: 'application/json');
      client.post(url, data: data,options: options).then(
            (value) => {
              value.statusCode,
              showDialogBox(context, value.data),
              debugPrint("data : ${value.data}"),
            },
          );
    } catch (e) {
      debugPrint(e.toString());
    }
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
          title: const Text('Add Inventory'),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: TextField(
                      controller: idController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: ' Inventory Id :',
                        hintText: 'Enter Id:',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      controller: inventorynameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Inventory Name:',
                        hintText: 'Enter Name:',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      controller: categoryController,
                      //obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Category:',
                        hintText: 'Enter Category:',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      controller: issueController,
                      //obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Issue to: ',
                        hintText: 'Enter Name:',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      controller: itemnameController,
                      //obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Item Name:',
                        hintText: 'Enter Item Name:',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      controller: locationController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Location:',
                        hintText: 'Enter Location:',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      controller: statusController,
                      //obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Status:',
                        hintText: 'Enter Status:',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      controller: quantityController,
                      //obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Quantity:',
                        hintText: 'Enter Quantity:',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: ()async {
                      await addinventory(context);
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
                    child: const Text('Add Inventory'),
                  )
                ],
              )),
        ));
  }
}
