import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String texto;
  final void Function() onPressed;
  const Answer(this.texto, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // Background color
        ),
        child: Text(
          style: const TextStyle(color: Colors.white),
          texto,
        ),
      ),
    );
  }
}
