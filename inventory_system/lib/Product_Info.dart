import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'Json_Model/product_info_model.dart';
import 'URL/base_url.dart';

class ProductInformation extends StatefulWidget {
  const ProductInformation({Key? key}) : super(key: key);

  @override
  State<ProductInformation> createState() => _ProductInformationState();
}

class _ProductInformationState extends State<ProductInformation> {
  TextEditingController pidController = TextEditingController();
  List<ProductInfoModel> responseData = [];
  Future<List<ProductInfoModel>> fetchPosts() async {
    final url =
        "${BaseUrl.url}BIIT_LOIS_API/api/Lois/Summary?userid=${pidController.text}";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      debugPrint("response ::: ${response.body}");
      debugPrint("status code ::: ${response.statusCode}");
      List<dynamic> jsonResponse = jsonDecode(response.body);
      List<ProductInfoModel> posts =
          jsonResponse.map((data) => ProductInfoModel.fromJson(data)).toList();
      return posts;
    } else {
      throw Exception('Failed to fetch posts');
    }
  }

  late Future<List<ProductInfoModel>> futurePosts;

  @override
  void initState() {
    futurePosts = fetchPosts();
    super.initState();
  }

  callApi() {
    setState(() {
      futurePosts = fetchPosts();
      debugPrint("call api");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inventory Information"),
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

            Column(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
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
                  FutureBuilder<List<ProductInfoModel>>(
                    future: futurePosts,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<ProductInfoModel>? posts = snapshot.data;
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Expanded(
                                          child: Text(
                                            "Item ID: ",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(color: Colors.black),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Expanded(
                                          child: Text(
                                            "Inventory Name:",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            posts[index].inventoryName.toString(),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Expanded(
                                          child: Text(
                                            "IssueTo:",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            posts[index].issueTo.toString(),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Expanded(
                                          child: Text(
                                            "Category:",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            posts[index].category.toString(),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Expanded(
                                          child: Text(
                                            "ItemName:",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            posts[index].itemName.toString(),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Expanded(
                                          child: Text(
                                            "Status:",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            posts[index].status.toString(),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Expanded(
                                          child: Text(
                                            "Venue:",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            posts[index].venue.toString(),
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

          ],
        ),
      ),
    );
  }
}
