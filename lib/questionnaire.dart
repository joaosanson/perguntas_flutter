import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class Questionnaire extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function(int) howMuchAnswer;

  const Questionnaire({
    super.key,
    required this.questions,
    required this.selectedQuestion,
    required this.howMuchAnswer,
  });

  bool get isThereSelectedQuestion {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = isThereSelectedQuestion
        ? questions[selectedQuestion]['answer'] as List<Map<String, Object>>
        : [];

    return Column(
      children: <Widget>[
        Question(questions[selectedQuestion]['question'].toString()),
        ...answers.map((answ) {
          return Answer(
            answ['text'].toString(),
            () => howMuchAnswer(int.parse(answ['score'].toString())),
          );
        }).toList(),
      ],
    );
  }
}
