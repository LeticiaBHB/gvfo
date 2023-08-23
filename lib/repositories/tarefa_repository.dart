import '../model/tarefa.dart';

class TarefaRepository{
  final List <Tarefa> _tarefas = [];

  void adicionar(Tarefa tarefa) async{
    await Future.delayed(const Duration(seconds: 1));
    _tarefas.add(tarefa);
  }

  void alterar (String id, bool concluido) async {
    await Future.delayed(const Duration(seconds: 1));
    _tarefas
        .where((tarefa) => tarefa.getId() == id)
        .first
        .setConcluido(concluido);
  }

  Future <List<Tarefa>> listar()async{
    Future.delayed(const Duration (seconds: 1));
    return _tarefas;
  }
}