import 'package:flutter/material.dart';
import 'package:inventory_system/update%20_Status.dart';
class ChangeStatus extends StatefulWidget {
  const ChangeStatus({Key? key}) : super(key: key);

  @override
  State<ChangeStatus> createState() => _ChangeStatusState();
}

class _ChangeStatusState extends State<ChangeStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Product Information"),
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
            Container(
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
            ),
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
                    const Text(
                      'Qr Code ID:1234',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Category:fan',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Name:roof fan',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Discription:fan',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Location:lab 3',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Price:2000',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Status:In use',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 26,
                      ),
                    ),
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
                        Icons.info_rounded,
                        size: 24.0,
                      ),
                      label: const Text('Update Status'),
                    ),
                  ],
                ))
          ],
        ));
  }
}
