import 'package:flutter/material.dart';
import 'package:inventory_system/Admin/Add_Product.dart';
import 'package:inventory_system/Admin/Add_User.dart';
import 'package:inventory_system/Admin/Change_Venue.dart';
import 'package:inventory_system/Admin/Check_Location_History.dart';
import 'package:inventory_system/Admin/Check_maintenance_historty.dart';
import 'package:inventory_system/Admin/Get_Report_by_date.dart';
import 'package:inventory_system/Admin/inventory_screen.dart';
import 'package:inventory_system/Change_Status.dart';
import 'package:inventory_system/update%20_Status.dart';

import 'Insert_Maintenance_history.dart';
import 'Inventory_Report_Show.dart';
import 'get_report_by_data.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
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
                      top: 30,
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
                          fontSize: 16,
                        ),
                      ),
                      const Text(
                        ' LAB AND OFFICE INVENTORY SYSTEM',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      const Text(
                        ' Admin Panel',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
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
                                          const Text('Add User',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.deepPurple)),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          ElevatedButton.icon(
                                            // <-- ElevatedButton
                                            onPressed: () =>
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const AddUser())),
                                            icon: const Icon(
                                              Icons.add,
                                              size: 24.0,
                                            ),
                                            label: const Text('Add User'),
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
                                        const Text('Add Product',
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
                                                      const AddProduct())),
                                          icon: const Icon(
                                            Icons.add_box,
                                            size: 24.0,
                                          ),
                                          label: const Text('Add Product'),
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
                                        const Text('View Report',
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
                                                      const ReportShow())),
                                          icon: const Icon(
                                            Icons.change_circle_rounded,
                                            size: 24.0,
                                          ),
                                          label: const Text('View Reports'),
                                        ),
                                      ])),
                                  SizedBox(
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
                                        const Text('Change Venue',
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
                                                      const ChangeVenue())),
                                          icon: const Icon(
                                            Icons.change_circle_rounded,
                                            size: 24.0,
                                          ),
                                          label: const Text('Change Venue'),
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
                                        const Text('Change Status',
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
                                                      const UpdateStatus())),
                                          icon: const Icon(
                                            Icons.change_circle_outlined,
                                            size: 24.0,
                                          ),
                                          label: const Text('Change Status'),
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
                                        const Text('Check Location History',
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
                                                      const CheckHistory())),
                                          icon: const Icon(
                                            Icons.fact_check,
                                            size: 24.0,
                                          ),
                                          label: const Text('Check History'),
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
                                        const Text('Insert Maintenance History',
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
                                                      const InsertHistory())),
                                          icon: const Icon(
                                            Icons.manage_history_rounded,
                                            size: 24.0,
                                          ),
                                          label: const Text(
                                              'Insert Maintenance History'),
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
                                        const Text('Check Maintenance History',
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
                                                      const CheckMaintenance())),
                                          icon: const Icon(
                                            Icons.history,
                                            size: 24.0,
                                          ),
                                          label: const Text(
                                              'Check  Maintenance History'),
                                        ),
                                      ]

                                      )
                                  ),
                                  Container(
                                      height: 80,
                                      width: 320,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white60,
                                      ),
                                      child: Column(children: [
                                        const Text('Inventory scrren',
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
                                              const InventoryScreen())),
                                          icon: const Icon(
                                            Icons.history,
                                            size: 24.0,
                                          ),
                                          label: const Text(
                                              'Inventory Screen'),
                                        ),
                                      ]

                                      )
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
                                        const Text('Inventory scrren',
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
                                              const ReportByDate())),
                                          icon: const Icon(
                                            Icons.history,
                                            size: 24.0,
                                          ),
                                          label: const Text(
                                              'get report by date '),
                                        ),
                                      ]

                                      )
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
                                        const Text('Check Maintenance History',
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
                                              const GetReportData())),
                                          icon: const Icon(
                                            Icons.history,
                                            size: 24.0,
                                          ),
                                          label: const Text(
                                              'Get Report By Data '),
                                        ),
                                      ]

                                      )
                                  ),


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
