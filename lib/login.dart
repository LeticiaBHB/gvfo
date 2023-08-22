import 'package:flutter/material.dart';

import 'paginas_dentrologin/main_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController(text: "");
  String senha = '';
  bool isObscureText = true;

  void _esqueciSenhaAlert(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Esqueci minha senha:'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Email para recuperar a senha"),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Lógica para lidar com o envio do email de recuperação de senha
                },
                style: ElevatedButton.styleFrom(primary: Colors.amberAccent),
                child: Text(
                  "Enviar",
                  style: TextStyle(color: Colors.black45),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

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
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Text(
                'Já tem cadastro? Faça seu login',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 350,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: Colors.white12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.yellowAccent),
                      ),
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
                            controller: emailController,
                            onChanged: (value){
                              debugPrint(value);
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.yellowAccent),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.yellowAccent)),
                              hintText: "Login",
                              hintStyle: TextStyle(color: Colors.black45),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text("Senha", style: TextStyle(color: Colors.yellowAccent)),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Container(
                          child: Icon(
                            Icons.lock,
                            color: Colors.white54,
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          color: Colors.white70,
                          width: 250,
                          child: TextField(
                            onChanged: (value) {
                              senha = value;
                            },
                            obscureText: isObscureText,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    isObscureText = !isObscureText;
                                  });
                                },
                                child: Icon(
                                  isObscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.black45,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.yellowAccent),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.yellowAccent)),
                              hintText: "Senha",
                              hintStyle: TextStyle(color: Colors.black45),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
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
              child: Row(
                children: [
                  SizedBox(width: 30),
                  ElevatedButton(
                    onPressed: () {
                      _esqueciSenhaAlert(context); // Call the alert function
                    },
                    style:
                        ElevatedButton.styleFrom(primary: Colors.amberAccent),
                    child: Text(
                      "Esqueci a Senha",
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                  SizedBox(width: 60),
                  ElevatedButton(
                    onPressed: () {
                      debugPrint(emailController.text);
                      print(senha);
                      if(emailController.text.trim() == 'email@email.com'&& senha.trim() == '123'){
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainPage()));
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("erro ao efetuar o login"),
                          ),
                          );
                      }
                    },
                    style:
                        ElevatedButton.styleFrom(primary: Colors.amberAccent),
                    child: Text(
                      "Entrar",
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                ],
              ),
            ),
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
      ),
    );
  }
}
