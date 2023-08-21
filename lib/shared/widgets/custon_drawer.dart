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
                  borderRadius: BorderRadius.circular(10)
                ),
                  context: context,
                  builder: (BuildContext bc) {
                    return Wrap(
                      children: [
                       ListTile(
                         onTap:(){
                           Navigator.pop(context);
                         },
                         title: Text('Câmera'),
                         leading: Icon(Icons.camera_alt_outlined),
                       ),
                        ListTile(
                          onTap: (){
                            Navigator.pop(context);
                          },
                            title: Text('Galeria'),
                        leading: Icon(Icons.photo_album),)
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
            onTap: () {},
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
