import 'package:flutter/material.dart';
import 'package:task_manager/data/task_inherited.dart';
import 'package:task_manager/screens/form_screen.dart';
import 'package:task_manager/screens/tela_inicial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  bool opacidade = true;
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //precisa estar no topo para todos a baixo acessarem suas informações
      home: TaskInherited(child: const InitialScreen()),
    );
  }
}
