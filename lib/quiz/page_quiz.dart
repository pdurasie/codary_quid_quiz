import 'package:codary_challenge/question/question_widget.dart';
import 'package:codary_challenge/quiz/quiz_evaluation.dart';
import 'package:codary_challenge/quiz/quiz_state.dart';
import 'package:codary_challenge/quiz/quiz_state_provider.dart';
import 'package:codary_challenge/util/pergament_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../question/answered_question.dart';

class PageQuiz extends ConsumerWidget {
  const PageQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quizStateNotifierProvider);
    final Widget child;
    if (state is QuizInitial) {
      child = const QuizIntro();
    } else if (state is QuizLoading) {
      child = const CircularProgressIndicator.adaptive();
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
      child = const Text("Error"); //TODO add more meaningful error handling
    }
    return WillPopScope(
      onWillPop: ref.read(quizStateNotifierProvider.notifier).onBackPressed,
      child: Stack(
        children: [
          WitchAnimation(
            isVisible: state is QuizInitial,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              child: PergamentCard(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 150),
                  switchOutCurve: Curves.easeOut,
                  switchInCurve: Curves.easeOut,
                  child: child,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuizIntro extends ConsumerWidget {
  const QuizIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "QuidTrivia",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 24,
              fontFamily: 'HP',
              color: Colors.grey.shade800,
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            "Test your trivia knowledge of the real life sport of Quidditch.\n\nChoose the right answer in three challenging questions!",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
              onPressed: () {
                ref.read(quizStateNotifierProvider.notifier).start();
              },
              child: const Text("Start"))
        ],
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Quiz completed",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 24,
              fontFamily: 'HP',
              color: Colors.grey.shade800,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            "You have answered $correctAnswerCount ${correctAnswerCount != 1 ? "questions" : "question"} correctly.",
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            getEvaluationMessage(correctAnswerCount / answeredQuestions.length),
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 18),
          ElevatedButton.icon(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                ref.read(quizStateNotifierProvider.notifier).replay();
              },
              label: const Text("Restart"))
        ],
      ),
    );
  }
}

class WitchAnimation extends StatelessWidget {
  final bool isVisible;
  const WitchAnimation({Key? key, this.isVisible = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      switchOutCurve: Curves.easeOutCubic,
      switchInCurve: Curves.easeOutCubic,
      // This will make the animation look like the child is moving up,
      // since the full screen child's height is gradually being reduced
      // from the bottom up
      transitionBuilder: (child, anim) => SizeTransition(
        sizeFactor: anim,
        child: child,
      ),
      child: isVisible
          ? Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.12),
                child: LottieBuilder.asset(
                  'assets/anim/witch.json',
                  height: 300,
                  repeat: true,
                  frameRate: FrameRate(60),
                ),
              ))
          : const SizedBox.shrink(),
    );
  }
}
