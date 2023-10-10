import 'package:flutter/material.dart';
import 'package:task_manager/components/tasks.dart';
import 'package:task_manager/data/task_dao.dart';
import 'package:task_manager/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
      ),
      body: Padding(
          padding: EdgeInsets.only(top: 8, bottom: 70),
          child: FutureBuilder<List<Task>>(
            future: TaskDao().findAll(),
            builder: (context, snapshot) {
              List<Task>? items = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  // TODO: Handle this case.
                  break;
                case ConnectionState.waiting:
                  // TODO: Handle this case.
                  break;
                case ConnectionState.active:
                  // TODO: Handle this case.
                  break;
                case ConnectionState.done:
                  if(snapshot.hasData && items != null){
                    if(items.isNotEmpty){
                      return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (BuildContext context, int index){
                          final Task tarefa = items[index];
                          return tarefa;
                        },
                      );
                    }
                    return Center(
                      child: Column(children: [
                        Icon(Icons.error_outline, size: 128),
                        Text('Não há nenhuma tarefa', style: TextStyle(fontSize: 32),)
                      ]),
                    );
                  }
                  return Text("Erro ao carregar tarefas");
                  break;
              }
              return Text("Erro desconhecido");
            },
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) =>
                  FormScreen(
                    taskContext: context,
                  ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
