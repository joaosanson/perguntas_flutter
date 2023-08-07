import 'package:flutter/material.dart';
import 'result.dart';
import 'questionnaire.dart';

main() => runApp(const MyApp());

class MyAppState extends State<MyApp> {
  var _selectedQuestion = 0;
  var _totalScore = 0;
  final List<Map<String, Object>> _questions = const [
    {
      'question': 'Qual é a sua cor favorita?',
      'answer': [
        {'text': 'Preto', 'score': 10},
        {'text': 'Vermelho', 'score': 5},
        {'text': 'Verde', 'score': 3},
        {'text': 'Branco', 'score': 1},
      ]
    },
    {
      'question': 'Qual é o seu animal favorito?',
      'answer': [
        {'text': 'Coelho', 'score': 10},
        {'text': 'Cobra', 'score': 5},
        {'text': 'Elefante', 'score': 3},
        {'text': 'Leão', 'score': 1},
      ]
    },
    {
      'question': 'Qual é a sua linguagem de programação favorita?',
      'answer': [
        {'text': 'Flutter', 'score': 10},
        {'text': 'Python', 'score': 5},
        {'text': 'JavaScript', 'score': 3},
        {'text': 'Java', 'score': 1},
      ]
    }
  ];

  void _answer(int score) {
    if (isThereSelectedQuestion) {
      setState(() {
        _selectedQuestion++;
        _totalScore += score;
      });
    }
    debugPrint('total score: $_totalScore');
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
                  howMuchAnswer: _answer)
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
