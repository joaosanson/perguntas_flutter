import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

main() => runApp(const MyApp());

class MyAppState extends State<MyApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    debugPrint('debug: $_perguntaSelecionada');
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> questions = [
      {
        'question': 'Qual é a sua cor favorita?',
        'answer': ['Preto', 'Vermelho', 'Verde', 'Branco']
      },
      {
        'question': 'Qual é o seu animal favorito?',
        'answer': ['Coelho', 'Cobra', 'Elefante', 'Leão']
      },
      {
        'question': 'Qual é a sua linguagem de programação favorita?',
        'answer': ['Python', 'JavaScript', 'Dart', 'Java']
      }
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Perguntas')),
        ),
        body: Column(
          children: [
            Question(questions[_perguntaSelecionada]['question'].toString()),
            Answer('Resposta 1', _responder),
            Answer('Resposta 2', _responder),
            Answer('Resposta 3', _responder),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() {
    return MyAppState();
  }
}
