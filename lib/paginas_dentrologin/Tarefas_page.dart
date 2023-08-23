import 'package:flutter/material.dart';
import 'package:dados/repositories/tarefa_repository.dart';

import '../model/tarefa.dart';

class TarefasPage extends StatefulWidget {
  const TarefasPage({super.key});

  @override
  State<TarefasPage> createState() => _TarefasPageState();
}

class _TarefasPageState extends State<TarefasPage> {
  var descricaoController = TextEditingController();
  var tarefaRepository = TarefaRepository();
  var _tarefas = const <Tarefa>[];
  var apenasNaoConcluidos = false;

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    if (apenasNaoConcluidos) {
      _tarefas = await tarefaRepository.listarNaoConcluidas();
    } else {
      _tarefas = await tarefaRepository.listar();
    }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarefas'),
        backgroundColor: Colors.black45,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_circle),
        onPressed: () {
          descricaoController.text = '';
          showDialog(
              context: context,
              builder: (BuildContext bc) {
                return AlertDialog(
                  title: Text('Adicionar tarefas'),
                  content: TextField(
                    controller: descricaoController,
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          tarefaRepository.adicionar(
                              Tarefa(descricaoController.text, false));
                        },
                        child: Text('cancelar')),
                    TextButton(
                        onPressed: () async {
                          await tarefaRepository.adicionar(
                              Tarefa(descricaoController.text, false));
                          Navigator.pop(context);
                          setState(() {});
                        },
                        child: const Text('Salvar')),
                  ],
                );
              });
        },
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Apenas não concluidos', style: TextStyle(fontSize: 18),),
                  Switch(value: apenasNaoConcluidos,
                      onChanged: (bool value){
                        apenasNaoConcluidos = value;
                        obterTarefas();
                      }
                    ,)
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _tarefas.length,
                  itemBuilder: (BuildContext bc, int index) {
                    var tarefa = _tarefas[index];
                    return Dismissible(
                      onDismissed: (DismissDirection dismissDirection) async{
                       await tarefaRepository.remove(tarefa.id);
                        obterTarefas();
                      },
                      key: Key(tarefa.id),
                      child: ListTile(
                        title: Text(tarefa.descricao),
                        trailing: Switch(
                            onChanged: (bool value) async{
                              await tarefaRepository.alterar(tarefa.id, value);
                              obterTarefas();
                            }, value: tarefa.concluido),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
