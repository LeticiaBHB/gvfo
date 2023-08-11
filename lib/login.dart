import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100),
            Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(
                    "assets/foguetinho.jpeg",
                    fit: BoxFit.cover, // Ajustar a imagem à forma circular
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(color: Colors.yellowAccent),
                  ),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Container(
                        child: Icon(
                          Icons.person,
                          color: Colors.white54,
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        color: Colors.white70,
                        width: 250,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: "Login"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16), // Espaçamento entre as linhas
                  Text("Senha", style: TextStyle(color: Colors.yellowAccent)),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Container(
                        child: Icon(
                          Icons.account_balance_wallet_outlined,
                          color: Colors.white54,
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        color: Colors.white70,
                        width: 250,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: "Senha"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(width: 70),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(primary: Colors.amberAccent),
                  child: Text(
                    "Entrar",
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
                SizedBox(width: 60),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/cadastro');
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.amberAccent),
                  child: Text(
                    "cadastre-se",
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
