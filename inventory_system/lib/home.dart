import 'package:flutter/material.dart';
import 'package:inventory_system/Change_Status.dart';
import 'package:inventory_system/Product_Report.dart';
import 'package:inventory_system/Product_Info.dart';
import 'package:inventory_system/Summary.dart';
import 'package:inventory_system/View_Status.dart';
import 'package:inventory_system/qr_code_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Transform.rotate(
                  origin: const Offset(30, 30),
                  angle: 2.4,
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 75,
                      top: 40,
                    ),
                    height: 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            colors: [
                              Colors.cyanAccent.shade100,
                              Colors.deepPurple.shade200
                            ])),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Barani Institute of Information Technology',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const Text(
                        ' LAB AND OFFICE INVENTORY SYSTEM',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 26,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Column(
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SingleChildScrollView(
                                    child: Container(
                                        height: 80,
                                        width: 320,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white60,
                                        ),
                                        child: Column(children: [
                                          const Text('Inventory Information',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.deepPurple)),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          ElevatedButton.icon(
                                            // <-- ElevatedButton
                                            onPressed: () => Navigator.of(
                                                    context)
                                                .push(MaterialPageRoute(
                                                    builder: (context) =>
                                                        const ProductInformation())),
                                            icon: const Icon(
                                              Icons.info_rounded,
                                              size: 24.0,
                                            ),
                                            label: const Text('Inventory Info'),
                                          ),
                                        ])),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      height: 80,
                                      width: 320,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white60,
                                      ),
                                      child: Column(children: [
                                        const Text('Inventory Reports',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.deepPurple)),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        ElevatedButton.icon(
                                          // <-- ElevatedButton
                                          onPressed: () => Navigator.of(context)
                                              .push(MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ProductReports())),
                                          icon: const Icon(
                                            Icons.view_list_outlined,
                                            size: 24.0,
                                          ),
                                          label: const Text('Inventory Reports'),
                                        ),
                                      ])),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      height: 80,
                                      width: 320,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white60,
                                      ),
                                      child: Column(children: [
                                        const Text('Scan QR',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.deepPurple)),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        ElevatedButton.icon(
                                          // <-- ElevatedButton
                                          onPressed: () => Navigator.of(context)
                                            .push(MaterialPageRoute(
                                            builder: (context) =>
                                            const QrCodeScanner())),
                                          icon: const Icon(
                                            Icons.qr_code_2,
                                            size: 24.0,
                                          ),
                                          label: const Text('Scan QR'),
                                        ),
                                      ])),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  /*Container(
                                      height: 80,
                                      width: 320,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white60,
                                      ),
                                      child: Column(children: [
                                        const Text('Product Status',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.deepPurple)),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        ElevatedButton.icon(
                                          // <-- ElevatedButton
                                          onPressed: () => Navigator.of(context)
                                              .push(MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ProductInformation())),
                                          icon: const Icon(
                                            Icons.insert_chart,
                                            size: 24.0,
                                          ),
                                          label: const Text('Product Status'),
                                        ),
                                      ])),
                                  const SizedBox(
                                    height: 10,
                                  ),*/
                                  Container(
                                      height: 80,
                                      width: 320,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white60,
                                      ),
                                      child: Column(children: [
                                        const Text('Summary of Inventory',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.deepPurple)),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        ElevatedButton.icon(
                                          // <-- ElevatedButton
                                          onPressed: () => Navigator.of(context)
                                              .push(MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Summary())),
                                          icon: const Icon(
                                            Icons.summarize_outlined,
                                            size: 24.0,
                                          ),
                                          label: const Text('View Summary'),
                                        ),
                                      ])),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      height: 80,
                                      width: 320,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white60,
                                      ),
                                      child: Column(children: [
                                        const Text('View Status',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.deepPurple)),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        ElevatedButton.icon(
                                          // <-- ElevatedButton
                                          onPressed: () => Navigator.of(context)
                                              .push(MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ViewStatus())),
                                          icon: const Icon(
                                            Icons.view_list,
                                            size: 24.0,
                                          ),
                                          label: const Text('View status'),
                                        ),
                                      ])),
                                ],
                              )
                            ],
                          ))
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
