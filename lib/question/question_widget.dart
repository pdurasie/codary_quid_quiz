import 'package:codary_challenge/question/answered_question.dart';
import 'package:codary_challenge/question/question.dart';
import 'package:codary_challenge/quiz/quiz_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'answer.dart';

class QuestionWidget extends ConsumerWidget {
  final Question question;
  const QuestionWidget({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              question.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            QuestionAnswers(
              answers: question.answers,
              onAnswerSelected: (answer) {
                final answeredQuestion = AnsweredQuestion(
                    selectedAnswer: answer, question: question);
                ref
                    .read(quizStateNotifierProvider.notifier)
                    .addAnswer(answeredQuestion);
              },
            ),
          ],
        ));
  }
}

class QuestionAnswers extends StatelessWidget {
  final List<Answer> answers;
  final void Function(Answer) onAnswerSelected;
  const QuestionAnswers(
      {Key? key, required this.answers, required this.onAnswerSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1.5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: answers
          .map((e) => AnswerField(
                answer: e,
                onAnswerSelected: onAnswerSelected,
              ))
          .toList(),
    );
  }
}

class AnswerField extends StatelessWidget {
  final Answer answer;
  final void Function(Answer) onAnswerSelected;
  const AnswerField(
      {Key? key, required this.answer, required this.onAnswerSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber.shade100,
      elevation: 4,
      child: InkWell(
        onTap: () => onAnswerSelected(answer),
        splashColor: Colors.amber.shade200,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              answer.text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
