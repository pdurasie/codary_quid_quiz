class Answer {
  final String id;
  final String text;
  final bool isCorrect;

  Answer({required this.id, required this.text, required this.isCorrect});

  factory Answer.empty() => Answer(id: "", text: "", isCorrect: false);
}
