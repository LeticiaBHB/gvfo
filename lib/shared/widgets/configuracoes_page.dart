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
    setState(() {
      nomeUsuarioController.text = storage.getString(CHAVE_NOME_USUARIO) ?? '';
      alturaController.text = (storage.getDouble(CHAVE_ALTURA) ?? 0).toString();
      receberNotificacoes = storage.getBool(CHAVE_RECEBER_NOTIFICACOES) ?? false;
      temaEscuro = storage.getBool(CHAVE_MODO_ESCURO) ?? false;
    });
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
                  try {
                    await storage.setDouble(CHAVE_ALTURA, double.tryParse(alturaController.text) ?? 0);
                  } catch (e){
                    showDialog(context: context, builder: (_){
                      return AlertDialog(
                        title: Text('Favor informar um valor válido'),
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: Text('ok'))
                        ],
                      );
                    });
                        return;
                  }
                  await storage.setBool(CHAVE_RECEBER_NOTIFICACOES, receberNotificacoes);
                  await storage.setBool(CHAVE_MODO_ESCURO, temaEscuro);
                  Navigator.pop (context);
                }, child: Text('Salvar'),
                  )
              ],
            ),
          ),
        )
    );
  }
}
