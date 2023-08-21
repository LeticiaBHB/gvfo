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
  TextEditingController DataNascimento = TextEditingController(text: '');

  @override
  void initState() {
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
      appBar: AppBar(title: Text('Meu Perfil')),
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
            SizedBox(height: 12),
            TextLabel(texto: 'Data de nascimento'),
            TextField(
              controller: DataNascimento,
              readOnly: true,
              onTap: () async{
               var data = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2023,1,1),
                    firstDate: DateTime(1900,1,1),
                    lastDate: DateTime(2023,05,01));
               print(data);
               if (data != null){
                 DataNascimento.text = data.toString();
               }
              },
            ),
            TextButton(onPressed: (){
              print(nomeController.text);
            },
              child: Text('salvar')),
          ],
        ),
      ),
    );
  }
}
