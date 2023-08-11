import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({super.key});

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: SingleChildScrollView(
        child: Container(
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
              Container(
                width: 350,
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.white12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 300,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "digite seu nome",
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(width: 50),
                          Container(
                            child: Text(
                              "celular",
                              style: TextStyle(color: Colors.black45),
                            ),
                          ),
                          SizedBox(width: 100),
                          Container(
                            child: Text(
                              "data nascimento",
                              style: TextStyle(color: Colors.black45),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 30),
                          Container(
                            width: 120,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(labelText: "(00)00000-0000"),
                              maxLength: 10,
                            ),
                          ),
                          SizedBox(width: 50),
                          Container(
                            width: 90,
                            child: TextField(
                              keyboardType: TextInputType.datetime,
                              decoration:
                                  InputDecoration(labelText: "00/00/0000"),
                              maxLength: 10,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 250,
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration:
                              InputDecoration(labelText: "insira seu email"),
                        ),
                      ),
                      Container(
                        width: 120,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration:
                              InputDecoration(labelText: "digite sua senha"),
                          onSubmitted: (String texto) {
                            print("valor digitado$texto");
                          },
                          controller: _textEditingController,
                        ),
                      ),
                      Container(
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            print("valor digitado:" +
                                _textEditingController.text);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.amberAccent),
                          child: (Text(
                            "Enviar",
                            style: TextStyle(color: Colors.black45),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
