import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'home.dart';
import 'campoTexto.dart';
import 'login.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var documentsDiretory = await path_provider.getApplicationCacheDirectory();
  Hive.init(documentsDiretory.path);
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
