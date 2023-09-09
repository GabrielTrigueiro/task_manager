import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tarefas'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Task('Testando'),
            Task('titulo um'),
            Task('titulo dois'),
            Task('titulo tres'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
      ),
    );
  }
}

class Task extends StatelessWidget {
  final String titulo;
  const Task(this.titulo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.amberAccent,
          height: 140,
        ),
        Container(
          color: Colors.white,
          height: 100,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              color: Colors.black26,
              width: 72,
              height: 100,
            ),
            Text(titulo),
            ElevatedButton(onPressed: () {}, child: Icon(Icons.arrow_drop_up))
          ]),
        )
      ],
    );
  }
}
