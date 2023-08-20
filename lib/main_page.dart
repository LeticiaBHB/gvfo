import 'package:flutter/material.dart';

import 'Perfil.dart';
import 'campoTexto.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black45,
          title: Text('HBH Companhia Interestelar'),
        ),
        drawer: Drawer(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/foguetinho.jpeg",
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 60),
                Divider(),
                SizedBox(height: 10),
                InkWell(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: Text('Dados Cadastrais'),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CampoTexto()));
                    }),
                SizedBox(height: 30),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    child: Text('Perfil'),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Perfil()));
                  },
                ),
                SizedBox(height: 30),
                InkWell(
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: Text('Termos de uso e Privacidade')),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value){
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                children: [
                  Container(child: Image.asset('acomodacoes.jpg'),
                  ),
                  Container(
                    color: Colors.amberAccent,
                  ),
                ],
              ),
            ),
            Expanded(
                child: PageView(
                  onPageChanged: (value){
                    setState(() {
                      posicaoPagina = value;
                    });
                  },
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      color: Colors.brown[400],
                    ),
                    Container(
                      color: Colors.brown,
                    )
                  ],
                ),
            ),
            BottomNavigationBar(
              backgroundColor: Colors.white54,
             onTap: (value){
                controller.jumpToPage(value);
             }
              ,
             currentIndex: posicaoPagina,
              items: [
                BottomNavigationBarItem(
                  label: 'acomodações',
                  icon: Icon(Icons.home_repair_service, color: Colors.black45),
                ),
                BottomNavigationBarItem(
                  label: 'nave',
                  icon: Icon(Icons.rocket_launch, color: Colors.black45),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
