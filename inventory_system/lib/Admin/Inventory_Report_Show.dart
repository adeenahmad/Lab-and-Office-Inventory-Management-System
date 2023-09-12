import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../Json_Model/report_show_model.dart';
import '../URL/base_url.dart';

class ReportShow extends StatefulWidget {
  const ReportShow({Key? key}) : super(key: key);

  @override
  State<ReportShow> createState() => _ReportShowState();
}

class _ReportShowState extends State<ReportShow> {
  final url = "${BaseUrl.url}BIIT_LOIS_API/api/Lois/GetReport";
  Future<List<ReportShowModel>> fetchPosts() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      List<ReportShowModel> posts =
          jsonResponse.map((data) => ReportShowModel.fromJson(data)).toList();
      return posts;
    } else {
      throw Exception('Failed to fetch posts');
    }
  }

  late Future<List<ReportShowModel>> futurePosts;
  @override
  void initState() {
    super.initState();
    futurePosts = fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Report"),
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
      body: Center(
        child: FutureBuilder<List<ReportShowModel>>(
          future: futurePosts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ReportShowModel>? posts = snapshot.data;
              return Center(
                child: ListView.separated(
                  separatorBuilder: (context, sep) => const Divider(
                    color: Colors.grey,
                    thickness: 2,
                  ),
                  itemCount: posts!.length,
                  itemBuilder: (context, index) {
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
                                  "Item ID: ",
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
                                  "Status:",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  posts[index].subject,
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
                                  "Description:",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  posts[index].disc,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
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
        ),
      ),
    );
  }
}
