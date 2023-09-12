import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'URL/base_url.dart';

class ProductReports extends StatefulWidget {
  const ProductReports({Key? key}) : super(key: key);

  @override
  State<ProductReports> createState() => _ProductReportsState();
}

class _ProductReportsState extends State<ProductReports> {
  TextEditingController idController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  List<String> statusDropDown = ["Dead", "Active", "Repair", "Store Room"];

  String statusValue = "";

  final client = Dio();

  updatestatus(BuildContext context) async {
    const url =
        '${BaseUrl.url}BIIT_LOIS_API/api/Lois/addReport';
    final data = {
      "ItemID":idController.text,
      "Subject": statusValue,
      "disc":descriptionController.text,
    };
    print("id : ${idController.text}");
    print("dropdown value : ${statusValue}");
    try {
      client.post(url,data: data).then(
            (value) => {
              value.statusCode,
              showDialogBox(context, value.data),
              debugPrint("data : ${value.data}"),
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
        centerTitle: true,
        title: const Text('Product Reports'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Category:',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InputDecorator(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  contentPadding: const EdgeInsets.all(10),
                ),
                child: TextField(
                  controller: idController,
                  //obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Product Id:',
                    hintText: 'Enter Id',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Status:',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InputDecorator(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  contentPadding: const EdgeInsets.all(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                      value: statusValue,
                      isDense: true,
                      isExpanded: true,
                      menuMaxHeight: 350,
                      items: [
                         const DropdownMenuItem(
                            value: "",
                            child: Text(
                              "Select Status",
                            )),
                        ...statusDropDown.map<DropdownMenuItem<String>>((data) {
                          return DropdownMenuItem(
                              value: data, child: Text(data));
                        }).toList(),
                      ],
                      onChanged: (value) {
                        print("select value $value");
                        setState(
                          () {
                            statusValue = value!;
                            print(statusValue);
                          },
                        );
                      }),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Description:',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InputDecorator(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  contentPadding: const EdgeInsets.all(10),
                ),
                child: TextField(
                  controller: descriptionController,
                  //obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Description:',
                    hintText: 'Enter Description',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  updatestatus(context);
                },
                child: const Text("Generate Report"),
              ),
              const SizedBox(
                height: 10,
              ),
              // Row(
              //   children: [
              //     Column(
              //       children: const [
              //         Text(
              //           'Name',
              //           style: TextStyle(
              //             fontWeight: FontWeight.w800,
              //             fontSize: 16,
              //           ),
              //         ),
              //         Text(
              //           'fan',
              //           style: TextStyle(
              //             fontWeight: FontWeight.w400,
              //             fontSize: 12,
              //           ),
              //         ),
              //         Text(
              //           'chair',
              //           style: TextStyle(
              //             fontWeight: FontWeight.w400,
              //             fontSize: 12,
              //           ),
              //         ),
              //         Text(
              //           'monitor',
              //           style: TextStyle(
              //             fontWeight: FontWeight.w400,
              //             fontSize: 12,
              //           ),
              //         ),
              //         Text(
              //           'cpu',
              //           style: TextStyle(
              //             fontWeight: FontWeight.w400,
              //             fontSize: 12,
              //           ),
              //         ),
              //       ],
              //     ),
              //     const SizedBox(
              //       height: 10,
              //       width: 30,
              //     ),
              //     Row(
              //       children: [
              //         Column(
              //           children: const [
              //             Text(
              //               'Description',
              //               style: TextStyle(
              //                 fontWeight: FontWeight.w800,
              //                 fontSize: 16,
              //               ),
              //             ),
              //             Text(
              //               'fan',
              //               style: TextStyle(
              //                 fontWeight: FontWeight.w400,
              //                 fontSize: 12,
              //               ),
              //             ),
              //             Text(
              //               'chair',
              //               style: TextStyle(
              //                 fontWeight: FontWeight.w400,
              //                 fontSize: 12,
              //               ),
              //             ),
              //             Text(
              //               'monitor',
              //               style: TextStyle(
              //                 fontWeight: FontWeight.w400,
              //                 fontSize: 12,
              //               ),
              //             ),
              //             Text(
              //               'cpu',
              //               style: TextStyle(
              //                 fontWeight: FontWeight.w400,
              //                 fontSize: 12,
              //               ),
              //             ),
              //           ],
              //         )
              //       ],
              //     ),
              //     const SizedBox(
              //       height: 10,
              //       width: 30,
              //     ),
              //     Row(
              //       children: [
              //         Column(
              //           children: const [
              //             Text(
              //               'Location',
              //               style: TextStyle(
              //                 fontWeight: FontWeight.w800,
              //                 fontSize: 16,
              //               ),
              //             ),
              //             Text(
              //               'lab 1',
              //               style: TextStyle(
              //                 fontWeight: FontWeight.w400,
              //                 fontSize: 12,
              //               ),
              //             ),
              //             Text(
              //               'lab 2',
              //               style: TextStyle(
              //                 fontWeight: FontWeight.w400,
              //                 fontSize: 12,
              //               ),
              //             ),
              //             Text(
              //               'lab 3',
              //               style: TextStyle(
              //                 fontWeight: FontWeight.w400,
              //                 fontSize: 12,
              //               ),
              //             ),
              //             Text(
              //               'lab 4',
              //               style: TextStyle(
              //                 fontWeight: FontWeight.w400,
              //                 fontSize: 12,
              //               ),
              //             ),
              //           ],
              //         )
              //       ],
              //     )
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
