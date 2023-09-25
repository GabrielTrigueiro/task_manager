import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Tarefa'),
      ),
      body: Center(
        child: Container(
          height: 650,
          width: 375,
          decoration: BoxDecoration(
              border: Border.all(width: 3),
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10)),
          child: Column(children:
              //o TextFormfield tem validação, textField apenas não tem
              [TextField(), TextFormField()]),
        ),
      ),
    );
  }
}
