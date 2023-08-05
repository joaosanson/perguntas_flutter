import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

main() => runApp(const MyApp());

class _MyAppState extends State<MyApp> {
  var _selectedQuestion = 0;
  final List<Map<String, Object>> _questions = const [
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
      'answer': ['Python', 'JavaScript', 'Flutter', 'Java']
    }
  ];

  void _responder() {
    if (isThereSelectedQuestion) {
      setState(() {
        _selectedQuestion++;
        debugPrint('debug: $_selectedQuestion');
      });
    }
  }

  bool get isThereSelectedQuestion {
    return _selectedQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> answers = isThereSelectedQuestion
        ? _questions[_selectedQuestion].cast()['answer']
        : [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Perguntas')),
        ),
        body: isThereSelectedQuestion
            ? Column(
                children: <Widget>[
                  Question(
                      _questions[_selectedQuestion]['question'].toString()),
                  ...answers.map((t) => Answer(t, _responder)).toList(),
                ],
              )
            : const Center(
                child: Text(
                'Sem mais perguntas.',
                style: TextStyle(fontSize: 28),
              )),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}
