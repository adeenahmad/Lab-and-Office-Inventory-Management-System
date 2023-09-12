import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:inventory_system/URL/base_url.dart';
class UpdateStatus extends StatefulWidget {
  const UpdateStatus({Key? key}) : super(key: key);

  @override
  State<UpdateStatus> createState() => _UpdateStatusState();
}

class _UpdateStatusState extends State<UpdateStatus> {

  List dropDownListData = [
    {"title": "In Use", "value": "1"},
    {"title": "IN Store", "value": "2"},
    {"title": "Out of Repairing", "value": "3"},
    {"title": "Expired", "value": "4"},
  ];
  List<String> dropdownData = [
    "In Use",
    "In Store",
    "Out of Repairing",
    "Expired",
  ];
  String defualvalue4 = "";
  TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {



    final client = Dio();
    final url =
        '${BaseUrl.url}BIIT_LOIS_API/api/Lois/UpdateStatus?itemid=${idController.text}&up_status=$defualvalue4';

    updatestatus(BuildContext context) async {
      print("id : ${idController.text}");
      print("dropdown value : ${defualvalue4}");
      final data = {
        "itemid":idController.text,
        "up_status": defualvalue4,
      };
      try {
        client.post(url).then(
              (value) => {
            value.statusCode,
            debugPrint("data : ${value.data}"),


          },
        );
      } catch (e) {
      }
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Update Status'),
      ),
body:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children:[
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(5),
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
              const SizedBox(
                height: 10,
              ),
              const Text('Change Status:-',style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 16,
              ),),
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
                    value: defualvalue4,
                    isDense: true,
                    isExpanded: true,
                    menuMaxHeight: 350,
                    items: [
                      const DropdownMenuItem(
                          value: "",
                          child: Text(
                            "Change Status!",
                          )),
                      ...dropdownData
                          .map<DropdownMenuItem<String>>((data) {
                        return DropdownMenuItem(
                            value: data, child: Text(data),);
                      }).toList(),
                    ],
                    onChanged: (value) {
                      print("select value $value");
                      setState(
                            () {
                          defualvalue4 = value!;
                          print(defualvalue4);
                        },
                      );
                    }),
              ),
            ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  updatestatus(context);
                  if (defualvalue4 == "") {
                    print("Please Select a Status");
                  } else {
                    print("Selected status Value $defualvalue4");
                  }
                },
                child: const Text("Update Status"),
              ),

              const SizedBox(
                height: 10,
              ),

            ],  ),
        ),

    );
  }
}
