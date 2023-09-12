import 'package:barcode_scan2/barcode_scan2.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class QrCodeScanner extends StatefulWidget {
  const QrCodeScanner({Key? key}) : super(key: key);
  static const id = "QR_CODE_SCANNER";
  @override
  State<QrCodeScanner> createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {

  String result = "";
  Future scanQrWithBarcodeScanner() async {
    try {
      var qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult.rawContent;
        debugPrint("result : $result");
      });
      debugPrint("raw content : ${qrResult.rawContent}");
      debugPrint("format : ${qrResult.format}");
      debugPrint("format note : ${qrResult.formatNote}");
    } on PlatformException catch (e) {
      return e;
    }
  }

  reset() {
    setState(() {
      result = "";
    });
  }
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
     reset();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("QR Scanner"),centerTitle: true,),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                color: Colors.orange,
                onPressed: (){
                  scanQrWithBarcodeScanner();
                },
                child: const Text(
                    "Scan Qr Code",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                result,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
