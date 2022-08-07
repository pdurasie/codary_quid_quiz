import 'package:codary_challenge/question/question_widget.dart';
import 'package:codary_challenge/quiz/quiz_evaluation.dart';
import 'package:codary_challenge/quiz/quiz_state.dart';
import 'package:codary_challenge/quiz/quiz_state_provider.dart';
import 'package:codary_challenge/util/pergament_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../question/answered_question.dart';

class PageQuiz extends ConsumerWidget {
  const PageQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quizStateNotifierProvider);
    final Widget child;
    if (state is QuizInitial) {
      child = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Let's go!"),
          const SizedBox(height: 24),
          ElevatedButton(
              onPressed: () {
                ref.read(quizStateNotifierProvider.notifier).start();
              },
              child: Text("Start"))
        ],
      );
    } else if (state is QuizLoading) {
      child = CircularProgressIndicator.adaptive();
    } else if (state is QuizOngoing) {
      child = QuestionWidget(
        key: ValueKey(state.questions.first.hashCode),
        question: state.questions.first,
      );
    } else if (state is QuizCompleted) {
      child = QuizResults(
        answeredQuestions: state.answeredQuestions,
      );
    } else {
      child = Text("Error");
    }
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: PergamentCard(
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 150),
            switchOutCurve: Curves.easeOut,
            switchInCurve: Curves.easeOut,
            child: child,
          ),
        ),
      ),
    );
  }
}

class QuizResults extends ConsumerWidget {
  final List<AnsweredQuestion> answeredQuestions;
  const QuizResults({Key? key, required this.answeredQuestions})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final correctAnswerCount = answeredQuestions
        .where((element) => element.isAnsweredCorrectly)
        .length;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("You have completed the quiz. Good job!"),
        const SizedBox(height: 24),
        Text(
            "You answered $correctAnswerCount ${correctAnswerCount != 1 ? "questions" : "question"} correctly."),
        const SizedBox(height: 8),
        Text(getEvaluationMessage(
            correctAnswerCount / answeredQuestions.length)),
        ElevatedButton.icon(
            icon: Icon(Icons.refresh),
            onPressed: () {
              ref.read(quizStateNotifierProvider.notifier).replay();
            },
            label: Text("Restart"))
      ],
    );
  }
}
