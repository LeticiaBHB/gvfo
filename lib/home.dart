import 'package:flutter/material.dart';
import 'login.dart';
import 'campoTexto.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: SizedBox(
        child: Column(
          children: [
            Center(
              child: Container(
                child: Image.asset(
                  "assets/foguete.jpeg",
                  color: Colors.yellowAccent[100],
                  colorBlendMode: BlendMode.darken,
                  fit: BoxFit.cover,
                  width: 400,
                  height: 600,
                ),
              ),
            ),
            Center(
              child: Container(
                width: 400,
                height: 100,
                child: Transform.rotate(
                  angle: -15 * (3.141592653589793 / 180), // Converter 20 graus para radianos
                  child: Center(
                    child: Text(
                      ' HBH Companhia Interestelar',
                      style: TextStyle(
                        color: Colors.yellowAccent[200],
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0),
              child: Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      style:
                          ElevatedButton.styleFrom(primary: Colors.amberAccent),
                      child: Text(
                        "login",
                        style: TextStyle(color: Colors.black45),
                      )),
                  SizedBox(width: 50.0),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cadastro');
                      },
                      style:
                          ElevatedButton.styleFrom(primary: Colors.amberAccent),
                      child: Text(
                        "cadastre-se",
                        style: TextStyle(color: Colors.black45),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
