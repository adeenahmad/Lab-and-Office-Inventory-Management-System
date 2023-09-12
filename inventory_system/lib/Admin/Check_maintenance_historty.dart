import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../Json_Model/get_maintenance_history_model.dart';
import '../URL/base_url.dart';

class CheckMaintenance extends StatefulWidget {
  const CheckMaintenance({Key? key}) : super(key: key);

  @override
  State<CheckMaintenance> createState() => _CheckMaintenanceState();
}

class _CheckMaintenanceState extends State<CheckMaintenance> {
  TextEditingController pidController = TextEditingController();
  List<GetMaintenanceHistoryModel> responseData = [];
  Future<List<GetMaintenanceHistoryModel>> fetchPosts() async {
    final url = "${BaseUrl.url}BIIT_LOIS_API/api/Lois/getMaintenanceHistory?itemID=${pidController.text}";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      debugPrint("response ::: ${response.body}");
      debugPrint("status code ::: ${response.statusCode}");
      List<dynamic> jsonResponse = jsonDecode(response.body);
      List<GetMaintenanceHistoryModel> posts =
      jsonResponse.map((data) => GetMaintenanceHistoryModel.fromJson(data)).toList();
      return posts;
    } else {
      throw Exception('Failed to fetch posts');
    }
  }

  late Future<List<GetMaintenanceHistoryModel>> futurePosts;
  @override
  void initState() {
    futurePosts = fetchPosts();
    super.initState();
  }

  callApi(){
    setState(() {
      futurePosts = fetchPosts();
debugPrint("call api");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Maintenance History"),
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
                    labelText: ' Item Id :',
                    hintText: 'Enter Item Id:',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  callApi();
                 /* futurePosts = fetchPosts();
                  debugPrint("onpress");*/
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
              FutureBuilder<List<GetMaintenanceHistoryModel>>(
                future: futurePosts,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<GetMaintenanceHistoryModel>? posts = snapshot.data;
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.separated(
                        separatorBuilder: (context, sep) => const Divider(
                          color: Colors.grey,
                          thickness: 2,
                        ),
                        itemCount: posts!.length,
                        itemBuilder: (context, index) {
                          debugPrint("lenght : ${posts.length}");
                          return Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    const Expanded(
                                      child: Text(
                                        "Maintenance ID: ",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color:
                                        Colors.black),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        posts[index].mid.toString(),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    const Expanded(
                                      child: Text(
                                        "Item Id:",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        posts[index].itemId.toString(),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    const Expanded(
                                      child: Text(
                                        "Out Date:",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        posts[index].outDate.toString(),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    const Expanded(
                                      child: Text(
                                        "In Date:",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        posts[index].inDate.toString(),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    const Expanded(
                                      child: Text(
                                        "Descriptions:",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        posts[index].descriptions.toString(),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    const Expanded(
                                      child: Text(
                                        "Charges:",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        posts[index].charges.toString(),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    const Expanded(
                                      child: Text(
                                        "VendorName:",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        posts[index].vendorName.toString(),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    const Expanded(
                                      child: Text(
                                        "VendorContact:",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        posts[index].vendorContact.toString(),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  return CircularProgressIndicator();
                },
              )
            ],
          ),
        ));
  }
}
