import 'dart:convert';
import 'package:dados/paginas_dentrologin/Tarefas_page.dart';
import 'package:dados/paginas_dentrologin/card_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../shared/widgets/custon_drawer.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String selectedOption = 'opcao1'; // Valor padrão
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;
  List<dynamic>? planetData;

  @override
  void initState() {
    super.initState();
    fetchPlanetData();
  }

  Future<void> fetchPlanetData() async {
    final response =
        await http.get(Uri.parse('https://swapi.dev/api/planets/'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        planetData = data['results'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black45,
          title: Text('HBH Companhia Interestelar'),
        ),
        drawer: CustonDrawer(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                children: [
                  Container(
                    child: Image.asset('assets/acomodacoes.jpg'),

                  ),
                  Container(
                    child: Center(
                      child: ListView(
                        children: [
                          ListTile(
                            leading: Image.asset('assets/nave.jpg'),
                            title: Text('Viage pelas galáxias'),
                            subtitle:
                            Text('Todos os planetas você pode conhecer. \nCom o melhor conforto possível'),
                            trailing: PopupMenuButton<String>(
                              onSelected: (menu) {
                                setState(() {
                                  selectedOption = menu;
                                });
                              },
                              itemBuilder: (BuildContext bc){
                                return <PopupMenuEntry<String>>[
                                  PopupMenuItem <String>(value:"opcao1",child: Text('Opção 1')),
                                  PopupMenuItem <String>(value:"opcao2",child: Text('Opção 2')),
                                  PopupMenuItem <String>(value:"opcao3",child: Text('Opção 3')),
                                ];
                              },
                            ),
                            isThreeLine: true,
                          ),
                          SizedBox(height: 20), // Espaço entre o ListTile e a imagem
                          selectedOption == 'opcao1'
                              ? Image.asset('assets/planetas1.jpg')
                              : selectedOption == 'opcao2'
                              ? Image.asset('assets/planetas2.jpg')
                              : Image.asset('assets/planetas3.jpg'),
                        ],
                      ),
                    ),
                  ),
                  CardPage(),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              child:
              Text('Esses são os detalhes dos Planetas do roteiro:',
              style:  TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
              ),
            Expanded(
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    child: ListView.builder(
                        itemCount: planetData != null ? planetData!.length : 0,
                        itemBuilder: (context, index) {
                          var planet = planetData![index];
                          return Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10),
                                    Text("Nome: ${planet['name']}"),
                                    Text("Rotação: ${planet['rotation_period']}"),
                                    Text("Clima: ${planet['climate']}"),
                                    Text("Gravidade: ${planet['gravity']}"),
                                    Text("Características: ${planet['terrain']}"),
                                    Text("População: ${planet['population']}"),
                                    Divider(), // Separador entre os planetas
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.push (context, MaterialPageRoute(builder: (context) => Tarefas()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.amberAccent
                ),
                child: Text('Completador de Tarefas', style: TextStyle(color: Colors.black45),)),
            BottomNavigationBar(
              backgroundColor: Colors.white54,
              onTap: (value) {
                controller.jumpToPage(value);
              },
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
                BottomNavigationBarItem(
                  label: 'card',
                  icon: Icon(Icons.rocket_rounded, color: Colors.black45),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
