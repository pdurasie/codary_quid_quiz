import 'answer.dart';

class Question {
  final String id;
  final Set<Answer> answers;
  final String title;
  final String? explanation;

  Question(
      {required this.id,
      required this.answers,
      required this.title,
      this.explanation});

  Question.fromQuestion(Question q)
      : id = q.id,
        answers = q.answers,
        title = q.title,
        explanation = q.explanation;
}
