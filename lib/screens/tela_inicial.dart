// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

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
                  return Center(
                      child: Column(
                    children: [CircularProgressIndicator(), Text("Carregando")],
                  ));
                case ConnectionState.waiting:
                  return Center(
                      child: Column(
                    children: [CircularProgressIndicator(), Text("Carregando")],
                  ));
                case ConnectionState.active:
                  return Center(
                      child: Column(
                    children: [CircularProgressIndicator(), Text("Carregando")],
                  ));
                case ConnectionState.done:
                  if (snapshot.hasData && items != null) {
                    if (items.isNotEmpty) {
                      return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Task tarefa = items[index];
                          return tarefa;
                        },
                      );
                    }
                    return Center(
                      child: Column(children: [
                        Icon(Icons.error_outline, size: 128),
                        Text(
                          'Não há nenhuma tarefa',
                          style: TextStyle(fontSize: 32),
                        )
                      ]),
                    );
                  }
                  return Text("Erro ao carregar tarefas");
              }
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                taskContext: context,
              ),
            ),
          ).then((value) => setState(() {
                // Aqui você deveria chamar a função que atualiza a lista de tarefas.
                // Por exemplo:
                // tasks = fetchTasksFromDatabase();
                print('Adicionando nova tarefa');
              }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
