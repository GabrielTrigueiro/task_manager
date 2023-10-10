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

  //função que transforma Map para List<Task>
  List<Task> transformMapToList(List<Map<String, dynamic>> mapaDeTarefas) {
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task tarefa = Task(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(tarefa);
    }
    return tarefas;
  }

  //função que transforma uma tarefa em uma linha da tabela
  Map<String, dynamic> taskToLine(Task tarefa) {
    final Map<String, dynamic> tarefaMapeada = Map();
    tarefaMapeada[_name] = tarefa.nome;
    tarefaMapeada[_image] = tarefa.foto;
    tarefaMapeada[_difficulty] = tarefa.dificuldade;
    return tarefaMapeada;
  }

  //CRUD
  save(Task tarefa) async {
    final Database bancoDeDados = await getDatabase();

    var itemExist = await find(tarefa.nome);

    if (itemExist.isEmpty) {
      print("De boa pae");
      return await bancoDeDados.insert(_tablename, taskToLine(tarefa));
    }

    //caso a tarefa já exista, atualiza ela com os valores recebidos
    else {
      print("Tarefa já existe pae");
      return await bancoDeDados.update(_tablename, taskToLine(tarefa),
          where: "$_name = ?", whereArgs: [tarefa.nome]);
    }
  }

  Future<List<Task>> findAll() async {
    final Database bancoDeDados = await getDatabase(); //pega o banco de dados

    final List<Map<String, dynamic>> result = await bancoDeDados.query(
        _tablename); //lê a tabela especifica e retorna um mapa de strings

    print("Resposta: $result");

    return transformMapToList(result);
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    final Database bancoDeDados = await getDatabase(); //pega o banco de dados
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename, //pesquisa na tabela
            where: "$_name = ?", //pesquisa no campo nome
            whereArgs: [nomeDaTarefa] //valores iguais a esse
            );
    return transformMapToList(result);
  }

  delete(String nomeDaTarefa) async {
    final Database bancoDeDados = await getDatabase();
    return bancoDeDados
        .delete(_tablename, where: "$_name = ?", whereArgs: [nomeDaTarefa]);
  }
}
