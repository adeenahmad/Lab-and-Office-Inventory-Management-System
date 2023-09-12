import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../URL/base_url.dart';

class ChangeVenue extends StatefulWidget {
  const ChangeVenue({Key? key}) : super(key: key);

  @override
  State<ChangeVenue> createState() => _ChangeVenueState();
}

class _ChangeVenueState extends State<ChangeVenue> {
  TextEditingController newlocationController = TextEditingController();
  TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final client = Dio();
    final url =
        '${BaseUrl.url}BIIT_LOIS_API/api/Lois/ChangeVenue?inv_id=${idController.text}&new_ven=${newlocationController.text}';

    Changelocation(BuildContext context) async {
      print("id : ${idController.text}");
      print("location value : ${newlocationController.text}");

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
          title: const Text("Change Venue"),
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
                  right: 80.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                     Padding(
                      padding:  const EdgeInsets.all(5),
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
                      height: 20,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: TextField(
                        controller: newlocationController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'New Location :',
                          hintText: 'Enter Location:',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Changelocation(context);

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
                      child: const Text('Change Venue'),
                    ),
                  ],
                ))
          ],
        ));
  }
}
