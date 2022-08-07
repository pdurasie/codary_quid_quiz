import 'package:codary_challenge/question/question.dart';

import 'answer.dart';

class AnsweredQuestion extends Question {
  final Answer selectedAnswer;

  AnsweredQuestion({required this.selectedAnswer, required Question question})
      : super.fromQuestion(question);

  bool get isAnsweredCorrectly => answers
      .firstWhere((answer) => answer.id == selectedAnswer.id,
          orElse: () => Answer.empty())
      .isCorrect;
}
