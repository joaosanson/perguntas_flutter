import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final void Function() whenRestartQuestionnaire;

  const Result(
      {required this.whenRestartQuestionnaire, required this.score, super.key});

  String get resultPhrase {
    if (score < 8) {
      return 'Parabéns';
    } else if (score < 12) {
      return 'Você é bom';
    } else if (score < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            resultPhrase,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          onPressed: whenRestartQuestionnaire,
          child: const Text(
            'Reiniciar?',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
            ),
          ),
        )
      ],
    );
  }
}
