import 'package:fidelo/Screens/screens.dart';
import 'package:fidelo/models/GlobalVariables.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:fidelo/Widgets/NavBar.dart';
import 'package:qr_flutter/qr_flutter.dart'; // Asegúrate de importar tu NavBar aquí

class QRScreen extends StatefulWidget {
  const QRScreen({Key? key}) : super(key: key);

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  String ticket = "";

  @override
  void initState() {
    super.initState();
  }
  Widget generateQRCode(){
    String data = "Nombre: ${GlobalVariables.nombre}"+"Fecha:${DateTime.now()}";
    showDialog(context: context, 
    builder:(BuildContext context) {
      return AlertDialog(
        title: const Text("Codigo Qr generado"),
        content: Container(
          height: 300,
          width: 300,
          child: Center(
            child: QrImageView(data: data,version: QrVersions.auto,size: 200,gapless: false,),
          ),
        ),
        actions: <Widget>[
          TextButton(onPressed: () {
            Navigator.of(context).pop();
          }, child: Text("Cerrar"))
        ],
      );
    }
    );
    return Container();
  }
  Future<void> readQrCode() async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      String code = await FlutterBarcodeScanner.scanBarcode(
        "#FFFFFF",
        "Cancelar",
        false,
        ScanMode.QR,
      );
      setState(() {
        ticket = code != "-1" ? code : "No validado";
      });

      // No bloquees la navegación al mostrar el contenido del código QR en un AlertDialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Contenido del código QR"),
            content: Text(ticket),
            actions: <Widget>[
              TextButton(
                child: Text("Cerrar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      // Permiso de cámara denegado, maneja la situación según tus necesidades
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton.icon(onPressed: () => readQrCode(), icon: Icon(Icons.qr_code), label:Text("Validar")),
          ElevatedButton.icon(onPressed: () => generateQRCode(), icon: Icon(Icons.qr_code_2_sharp), label: Text("Generar"))
        ],
      ),
      
    );
  }
}
