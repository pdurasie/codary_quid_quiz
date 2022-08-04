import 'package:codary_challenge/question/question.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;
  const QuestionWidget({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //display 4 possible answers in a card container with a submit button.
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      child: Stack(
        children: [
          Image.asset("assets/pergament.jpg"),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(question.title),
              const SizedBox(height: 24),
            ],
          ),
        ],
      ),
    );
  }
}
