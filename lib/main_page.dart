import 'package:flutter/material.dart';

import 'campoTexto.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black45,
          title: Text('Meu perfil'),
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
                    child: Text('Configurações'),
                  ),
                  onTap: () {},
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
                children: [
                  Container(
                    color: Colors.blueGrey,
                  ),
                  Container(
                    color: Colors.amberAccent,
                  ),
                ],
              ),
            ),
            Expanded(
                child: PageView(
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
              backgroundColor: Colors.black45,
              items: [
                BottomNavigationBarItem(
                  label: 'acomodações',
                  icon: Icon(Icons.home_repair_service, color: Colors.amberAccent,),
                ),
                BottomNavigationBarItem(
                  label: 'nave',
                  icon: Icon(Icons.rocket_launch, color: Colors.amberAccent,),
                ),
                BottomNavigationBarItem(
                  label: 'pacotes',
                  icon: Icon(Icons.rocket_outlined, color: Colors.amberAccent,),
                ),
                BottomNavigationBarItem(
                  label: 'viagem',
                  icon: Icon(Icons.mode_of_travel_rounded, color: Colors.amberAccent,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
