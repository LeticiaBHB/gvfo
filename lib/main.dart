import 'package:flutter/material.dart';
import 'home.dart';
import 'campoTexto.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => Home(),
        '/login': (context) => Login(),
        '/cadastro': (context) => CampoTexto(),
      },
    );
  }
}
