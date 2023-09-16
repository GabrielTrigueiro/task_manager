import 'package:flutter/material.dart';

class DificultBar extends StatefulWidget {
  final int dificuldade;

  const DificultBar(this.dificuldade, {super.key});

  @override
  State<DificultBar> createState() => _DificultBarState();
}

class _DificultBarState extends State<DificultBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 15,
          color: (widget.dificuldade >= 1) ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (widget.dificuldade >= 2) ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (widget.dificuldade >= 3) ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (widget.dificuldade >= 4) ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (widget.dificuldade >= 5) ? Colors.blue : Colors.blue[100],
        ),
      ],
    );
  }
}
