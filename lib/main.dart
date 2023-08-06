import 'package:flutter/material.dart';
import 'result.dart';
import 'questionnaire.dart';

main() => runApp(const MyApp());

class MyAppState extends State<MyApp> {
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
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Center(child: Text('Perguntas')),
          ),
          body: isThereSelectedQuestion
              ? Questionnaire(
                  questions: _questions,
                  selectedQuestion: _selectedQuestion,
                  responder: _responder)
              : const Result()),
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
