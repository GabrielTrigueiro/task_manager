import 'package:flutter/material.dart';
import 'package:task_manager/components/tasks.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required this.child}) : super(child: child);

  final Widget child;

  final List<Tasks> taskList = [
    Tasks('Estudar Flutter', 'assets/images/flutter.png', 3),
    Tasks('Andar de Bike', 'assets/images/bike.webp', 2),
    Tasks('Ler 50 páginas', 'assets/images/ler.jpg', 1),
    Tasks('Meditar', 'assets/images/meditar.jpeg', 4),
    Tasks(
      'Jogar',
      'assets/images/jogar.jpg',
      0,
    ),
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Tasks(name, photo, difficulty));
  }

  static TaskInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskInherited>();
  }

  @override
  //fica de olho na tarefa que queremos
  //ele precisa de um estado anterior da informação
  //se o tamanho da lista for diferente ele atualizada todos os widget
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
