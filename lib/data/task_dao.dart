import 'package:sqflite/sqflite.dart';
import 'package:task_manager/components/tasks.dart';
import 'package:task_manager/data/database.dart';

//objeto de acesso a dados
class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';
  static const String _tablename = "taskTable";
  static const String _name = "name";
  static const String _difficulty = "difficulty";
  static const String _image = 'image';

  List<Task> transformMapToList(List<Map<String, dynamic>> mapaDeTarefas) {
    //função que transforma Map para List<Task>
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task tarefa = Task(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(tarefa);
    }
    return tarefas;
  }

  save(Task tarefa) async {}
  Future<List<Task>> findAll() async {
    final Database bancoDeDados = await getDatabase(); //pega o banco de dados

    final List<Map<String, dynamic>> result = await bancoDeDados.query(
        _tablename); //lê a tabela especifica e retorna um mapa de strings

    print("Resposta: $result");

    return transformMapToList(result);
  }

  // Future<List<Task>> find() async {
  //   print("Acessando find");
  // }
  // delete(String nomeDaTarefa) async {
  //   print("Acessando delete");
  // }
}
