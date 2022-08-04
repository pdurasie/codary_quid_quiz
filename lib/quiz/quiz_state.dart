import '../question/answered_question.dart';
import '../question/question.dart';

class QuizState {}

class QuizInitial extends QuizState {}

class QuizError extends QuizState {}

class QuizLoading extends QuizState {}

class QuizOngoing extends QuizState {
  final List<Question> questions;
  final List<AnsweredQuestion> _answeredQuestions = [];

  QuizOngoing(this.questions);

  List<AnsweredQuestion> get answeredQuestions =>
      List.unmodifiable(_answeredQuestions);

  void addAnsweredQ(AnsweredQuestion answeredQ) =>
      _answeredQuestions.add(answeredQ);
}

class QuizCompleted extends QuizState {
  final List<AnsweredQuestion> _answeredQuestions;

  QuizCompleted(List<AnsweredQuestion> answeredQuestions)
      : _answeredQuestions = answeredQuestions;

  List<AnsweredQuestion> get answeredQuestions =>
      List.unmodifiable(_answeredQuestions);
}
