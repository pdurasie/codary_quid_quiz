import 'package:codary_challenge/question/question_widget.dart';
import 'package:codary_challenge/quiz/quiz_state.dart';
import 'package:codary_challenge/quiz/quiz_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageQuiz extends ConsumerWidget {
  const PageQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quizStateNotifierProvider);
    final Widget child;
    if (state is QuizInitial) {
      child = Card(
        child: Column(
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
        ),
      );
    } else if (state is QuizLoading) {
      child = const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    } else if (state is QuizOngoing) {
      child = QuestionWidget(question: state.questions.first);
    } else if (state is QuizCompleted) {
      final correctAnswerCount = state.answeredQuestions
          .where((element) => element.isAnsweredCorrectly)
          .length;
      child = Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("You did it!"),
            const SizedBox(height: 24),
            Text("You answered $correctAnswerCount questions correctly.")
          ],
        ),
      );
    } else {
      child = Center(
        child: Text("Error"),
      );
    }
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 250),
      switchOutCurve: Curves.easeOut,
      switchInCurve: Curves.easeOut,
      child: child,
    );
  }
}
