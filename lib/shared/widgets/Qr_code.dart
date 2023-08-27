import 'package:flutter/material.dart';


class Qr_code extends StatefulWidget {
  const Qr_code({super.key});

  @override
  State<Qr_code> createState() => _Qr_codeState();
}

class _Qr_codeState extends State<Qr_code> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text('QR Code'),),

        ) );
  }
}
