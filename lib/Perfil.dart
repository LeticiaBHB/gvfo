import 'package:dados/repositories/nivel_repository.dart';
import 'package:dados/shared/widgets/text_label.dart';
import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  TextEditingController nomeController = TextEditingController(text: '');
  String nome = '';
  TextEditingController DataNascimentoController = TextEditingController(text: '');
  DateTime? dataNascimento;
  var nivelRepository = NivelRepository();
  var niveis = [];
  var nivelSelecionado = '';

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black45,
          title: Text('Meu Perfil')),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                'Seu nome é: $nome ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
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
                  .map((nivel) => RadioListTile(
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
            BottomAppBar(
              child: TextButton(
                onPressed: () {
                  print(nomeController.text);
                  print(dataNascimento);
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
