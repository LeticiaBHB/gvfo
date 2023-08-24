import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  late SharedPreferences storage;

  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String? nomeUsuario;
  double? altura;
  bool receberNotificacoes = false;
  bool temaEscuro = false;

  final CHAVE_NOME_USUARIO = 'CHAVE_NOME_USUARIO';
  final CHAVE_ALTURA = 'CHAVE_ALTURA';
  final CHAVE_RECEBER_NOTIFICACOES = 'CHAVE_RECEBER_NOTIFICACOES';
  final CHAVE_MODO_ESCURO = 'CHAVE_MODO_ESCURO';

  @override
  void initState (){
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    storage = await SharedPreferences.getInstance();
  }

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
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Nome Usuário'),
                    controller: nomeUsuarioController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
                TextButton(onPressed: () async {
                  await storage.setString(CHAVE_NOME_USUARIO, nomeUsuarioController.text);
                  await storage.setDouble(CHAVE_ALTURA, double.tryParse(alturaController.text) ?? 0);
                  await storage.setBool(CHAVE_RECEBER_NOTIFICACOES, receberNotificacoes);
                  await storage.setBool(CHAVE_MODO_ESCURO, temaEscuro);
                }, child: Text('Salvar')
                  ,)
              ],
            ),
          ),
        )
    );
  }
}
