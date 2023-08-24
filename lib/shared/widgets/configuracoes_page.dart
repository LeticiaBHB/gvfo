import 'package:flutter/material.dart';
class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String? nomeUsuario;
  double? altura;
  bool receberNotificacoes = false;
  bool temaEscuro = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          appBar: AppBar(backgroundColor: Colors.black45,
            title: Text('Configurações'),
          ),
          body: Container(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Nome Usuário'),
                    controller: nomeUsuarioController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: 'Identificação'),
                    controller: alturaController,
                  ),
                ),
                SwitchListTile(
                  title: Text('Receber Notificações'),
                    onChanged: (bool value) {
                      setState(() {
                        receberNotificacoes = !receberNotificacoes;
                      });
                    },
                    value: receberNotificacoes,
                ),
                SwitchListTile(
                  title: Text('Tema Escuro'),
                    value: temaEscuro,
                    onChanged: (bool value){
                      setState(() {temaEscuro = value;});
                    }),

              ],
            ),
          ),
        )
    );
  }
}
