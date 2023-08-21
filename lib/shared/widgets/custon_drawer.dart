import 'package:dados/home.dart';
import 'package:flutter/material.dart';
import '../../Perfil.dart';
import '../../campoTexto.dart';

class CustonDrawer extends StatelessWidget {
  const CustonDrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Drawer(
      child: ListView(
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: (BuildContext bc) {
                    return Wrap(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: Text('Câmera'),
                          leading: Icon(Icons.camera_alt_outlined),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: Text('Galeria'),
                          leading: Icon(Icons.photo_album),
                        )
                      ],
                    );
                  });
            },
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.amberAccent),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey[100],
                child: Image.network(
                  'https://th.bing.com/th/id/OIG.2iqWtMN9bE_MdBICtobp?pid=ImgGn',
                  width: 50,
                ),
              ),
              accountName: Text(
                'seu nome',
                style: TextStyle(color: Colors.black45),
              ),
              accountEmail: Text(
                'email@email.com',
                style: TextStyle(color: Colors.black45),
              ),
            ),
          ),
          Divider(),
          SizedBox(height: screenHeight * 0.02),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              width: double.infinity,
              child: Row(
                children: const [
                  Icon(Icons.wallet),
                  SizedBox(width: 10),
                  Text('Dados Cadastrais'),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CampoTexto()),
              );
            },
          ),
          SizedBox(height: screenHeight * 0.05),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              width: double.infinity,
              child: Row(
                children: const [
                  Icon(Icons.person),
                  SizedBox(width: 10),
                  Text('Perfil'),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Perfil()),
              );
            },
          ),
          SizedBox(height: screenHeight * 0.05),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              width: double.infinity,
              child: Row(
                children: [
                  Icon(Icons.browser_updated),
                  const Text('Termos de uso e Privacidade'),
                ],
              ),
            ),
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: (BuildContext bc) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      child: ListView(
                        children: [
                          Center(
                            child: Text(
                              'Termos de uso e Privacidade',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(height: 20),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      '  ', // Espaços em branco para criar o recuo
                                ),
                                TextSpan(
                                  text:
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                                      'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.  Proin mollis efficitur enim a eleifend. Sed molestie lectus quis sagittis facilisis. Quisque porttitor dictum orci, vitae rutrum mauris tempus in. Nam mattis ipsum dolor, ut condimentum massa ultrices nec. Sed laoreet, lacus eu vulputate auctor, odio risus malesuada magna, quis ultricies ante arcu id erat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a lacus maximus, luctus metus sit amet, ornare ex. Null.',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      '  ', // Espaços em branco para criar o recuo
                                ),
                                TextSpan(
                                  text:
                                      'Cras consequat diam ut augue scelerisque, at cursus magna varius. Vivamus nec accumsan erat.'
                                      'nec lobortis ipsum. Vestibulum quam risus, feugiat id molestie non, cursus in tortor. Praesent quis vulputate orci. Nam ac nulla eu lectus consectetur volutpat eleifend in tellus. Quisque suscipit nisi condimentum velit pulvinar, a bibendum lorem posuere. Sed malesuada hendrerit est. Quisque dignissim dolor id nulla vehicula, vitae efficitur sem eleifend. Proin fermentum velit purus, at sodales felis rhoncus et. Etiam mattis elit erat, mattis condimentum nibh mollis ut. Maecenas sapien diam, rhoncus eu placerat vel, pretium porta lacus. Pellentesque fringilla faucibus tellus eget vestibulum. Morbi enim purus, tempus eu dui eget, ullamcorper pulvinar tortor. ',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      '  ', // Espaços em branco para criar o recuo
                                ),
                                TextSpan(
                                  text:
                                      'Praesent accumsan enim id dui euismod lobortis. Proin mollis efficitur enim a eleifend. Sed molestie lectus quis sagittis facilisis. Quisque porttitor dictum orci, vitae rutrum mauris tempus in. Nam mattis ipsum dolor, ut condimentum massa ultrices nec. Sed laoreet, lacus eu vulputate auctor, odio risus malesuada magna, quis ultricies ante arcu id erat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a lacus maximus, luctus metus sit amet, ornare ex. Nulla facilisi. Donec finibus, velit a fringilla imperdiet, ante orci facilisis eros, a pharetra augue metus non metus. ',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
          ),
          SizedBox(height: screenHeight * 0.02),
          Divider(),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: Row(
                children: [
                  Icon(Icons.exit_to_app),
                  SizedBox(width: 10),
                  Text('Sair'),
                ],
              ),
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext bc) {
                    return AlertDialog(
                      elevation: 8,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      title: Text('HBH Companhia Interestelar'),
                      content: Wrap(
                        children: [
                        Text('Deseja realmente sair do aplicativo?'),
                    ],
                    ),
                      actions: [
                        TextButton(onPressed: (){
                          Navigator.pop(context);
                        },
                            child:Text('não'),),
                        TextButton(onPressed: (){
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                            child:Text('sim'),),
                    ],
                    );
                  });
            },
          ),
          SizedBox(height: screenHeight * 0.2),
          Center(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/foguetinho.jpeg",
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  child: const Text('Atualizado em 2023'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
