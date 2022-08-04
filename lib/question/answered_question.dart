import 'package:codary_challenge/question/question.dart';

import 'answer.dart';

class AnsweredQuestion extends Question {
  final String selectedAnswerId;

  AnsweredQuestion({required this.selectedAnswerId, required Question question})
      : super.fromQuestion(question);

  bool get isAnsweredCorrectly => answers
      .firstWhere((answer) => answer.id == selectedAnswerId,
          orElse: () => Answer.empty())
      .isCorrect;
}
