import 'package:dados/repositories/linguagens_repository.dart';
import 'package:dados/repositories/nivel_repository.dart';
import 'package:dados/shared/widgets/text_label.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  TextEditingController nomeController = TextEditingController(text: '');
  String nome = '';
  TextEditingController DataNascimentoController =
      TextEditingController(text: '');
  DateTime? dataNascimento;
  var nivelRepository = NivelRepository();
  var linguagensRepository = LinguagensRepository();
  var niveis = [];
  var linguagens = [];
  var nivelSelecionado = '';
  List <String> linguagensSelecionadas = [];
  int tempoViagem = 0;
  late SharedPreferences storage;
  final String CHAVE_DADOS_PERFIL_NOME = 'CHAVE_DADOS_PERFIL_NOME';
  final String CHAVE_DADOS_PERFIL_DATA_NASCIMENTO = 'CHAVE_DADOS_PERFIL_DATA_NASCIMENTO';
  final String CHAVE_DADOS_PERFIL_NIVEIS = 'CHAVE_DADOS_PERFIL_NIVEIS';
  final String CHAVE_DADOS_PERFIL_LINGUAGENS = 'CHAVE_DADOS_PERFIL_LINGUAGENS';
  final String CHAVE_DADOS_PERFIL_TEMPO_VIAGEM = 'CHAVE_DADOS_PERFIL_TEMPO_VIAGEM';

  bool salvando = false;

  @override
  void initState() {
    carregarDados();
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagensRepository.retornaLinguagens();
    super.initState();
    nomeController.addListener(() {
      setState(() {
        nome = nomeController.text;
      });
    });
  }

  @override
  void dispose() {
    nomeController.dispose();
    super.dispose();
  }

  carregarDados() async{
  storage = await SharedPreferences.getInstance();
  }

  List<DropdownMenuItem<int>> returnItens(int quantidadeMaxima) {
    var itens = <DropdownMenuItem<int>>[];
    for (var i = 0; i <= quantidadeMaxima; i++) {
      itens.add(DropdownMenuItem(
        child: Text(i.toString()),
        value: i,
      ));
    }
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.black45, title: Text('Meu Perfil')),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: salvando
            ? Center(child: const CircularProgressIndicator())
            : ListView(
                children: [
                  Container(
                    child: Text(
                      'Seu nome é: $nome ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                  TextField(
                    controller: nomeController,
                    onSubmitted: (value) {
                      setState(() {
                        nome = value;
                      });
                    },
                  ),
                  TextLabel(texto: 'Data de nascimento'),
                  TextField(
                    controller: DataNascimentoController,
                    readOnly: true,
                    onTap: () async {
                      var data = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2023, 1, 1),
                        firstDate: DateTime(1900, 1, 1),
                        lastDate: DateTime(2023, 05, 01),
                      );
                      print(data);
                      if (data != null) {
                        DataNascimentoController.text = data.toString();
                        dataNascimento = data;
                      }
                    },
                  ),
                  TextLabel(texto: 'Nível de experiência'),
                  Column(
                    children: niveis
                        .map(
                          (nivel) => RadioListTile(
                            dense: true,
                            title: Text(nivel.toString()),
                            selected: nivelSelecionado == nivel,
                            value: nivel.toString(),
                            groupValue: nivelSelecionado,
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                nivelSelecionado = value.toString();
                              });
                            },
                          ),
                        )
                        .toList(),
                  ),
                  const TextLabel(texto: 'Linguagens que sei'),
                  Column(
                      children: linguagens
                          .map((linguagem) => CheckboxListTile(
                              dense: true,
                              title: Text(linguagem),
                              value: linguagensSelecionadas.contains(linguagem),
                              onChanged: (bool? value) {
                                if (value!) {
                                  setState(() {
                                    linguagensSelecionadas.add(linguagem);
                                  });
                                } else {
                                  setState(() {
                                    linguagensSelecionadas.remove(linguagem);
                                  });
                                }
                              }))
                          .toList()),
                  TextLabel(texto: 'tempo de viagem'),
                  DropdownButton(
                      value: tempoViagem,
                      isExpanded: true,
                      items: returnItens(50),
                      onChanged: (value) {
                        setState(() {
                          tempoViagem = int.parse(value.toString());
                        });
                      }),
                  BottomAppBar(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          salvando = false;
                        });
                        if (nomeController.text
                            .trim()
                            .length < 3) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('o nome deve ser preenchido')));
                          return;
                        }
                        if (dataNascimento == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                  Text('Data de Nascimento inválida')));
                          return;
                        }
                        if (nivelSelecionado.trim() == '') {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Nivel deve ser selecionado')));
                          return;
                        }
                        if (linguagensSelecionadas.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Deve ser selecionado ao menos uma linguagem')));
                          return;
                        }
                        if (tempoViagem == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Deve ser selecionado o tempo de viagem')));
                          return;
                        }
                        print(nomeController.text);
                        print(dataNascimento);
                        print(nivelSelecionado);
                        print(linguagensSelecionadas);
                        print(tempoViagem);

                        storage.setString(CHAVE_DADOS_PERFIL_NOME, nomeController.text);
                        storage.setString(CHAVE_DADOS_PERFIL_DATA_NASCIMENTO, dataNascimento.toString());
                        storage.setString(CHAVE_DADOS_PERFIL_NIVEIS, nivelSelecionado);
                        storage.setStringList(CHAVE_DADOS_PERFIL_LINGUAGENS, linguagensSelecionadas);
                        storage.setInt(CHAVE_DADOS_PERFIL_TEMPO_VIAGEM, tempoViagem);

                        setState(() {
                          salvando = true;
                        });
                        Future.delayed(Duration(seconds: 3), (){
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Dados salvos com sucesso!')));
                          setState(() {
                            salvando = false;
                          });
                          Navigator.pop(context);
                        });
                      },
                      child: Text('salvar'),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
