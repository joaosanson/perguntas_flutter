import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class Questionnaire extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function() responder;

  const Questionnaire({
    super.key,
    required this.questions,
    required this.selectedQuestion,
    required this.responder,
  });

  bool get isThereSelectedQuestion {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> answers = isThereSelectedQuestion
        ? questions[selectedQuestion].cast()['answer']
        : [];

    return Column(
      children: <Widget>[
        Question(questions[selectedQuestion]['question'].toString()),
        ...answers.map((t) => Answer(t, responder)).toList()
      ],
    );
  }
}
