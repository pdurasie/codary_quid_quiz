import 'package:codary_challenge/api/data_repository.dart';
import 'package:codary_challenge/question/answered_question.dart';
import 'package:codary_challenge/question/question.dart';
import 'package:codary_challenge/quiz/quiz_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quizStateNotifierProvider =
    StateNotifierProvider<QuizStateNotifier, QuizState>(
        (ref) => QuizStateNotifier());

class QuizStateNotifier extends StateNotifier<QuizState> {
  List<Question>? _questions;
  QuizStateNotifier() : super(QuizInitial());

  static const int questionCount = 3;

  Future<void> start() async {
    state = QuizLoading();
    final qList = await getQuestions(questionCount);
    if (qList?.isNotEmpty == true) {
      state = QuizOngoing(qList!);
    } else {
      state = QuizError();
    }
  }

  void replay() {
    state = QuizInitial();
  }

  Future<List<Question>?> getQuestions(int questionCount) async {
    if (_questions?.isNotEmpty == true) {
      return _questions;
    } else {
      return await loadQuestions(questionCount);
    }
  }

  Future<List<Question>?> loadQuestions(int questionCount) async {
    try {
      _questions = await DataRepository().fetchQuestions();
      _questions?.shuffle();
      return _questions?.take(questionCount).toList();
    } catch (e, stacktrace) {
      if (kDebugMode) {
        print(stacktrace);
      }
      return null;
    }
  }

  void addAnswer(AnsweredQuestion answeredQ) {
    if (state is! QuizOngoing) return;

    (state as QuizOngoing).addAnsweredQ(answeredQ);
    (state as QuizOngoing)
        .questions
        .removeWhere((element) => element.id == answeredQ.id);

    if ((state as QuizOngoing).questions.isEmpty) {
      state = QuizCompleted((state as QuizOngoing).answeredQuestions);
    }
  }
}
