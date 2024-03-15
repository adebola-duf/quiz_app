import 'package:flutter/material.dart';

class EachQuestionsSummary extends StatelessWidget {
  const EachQuestionsSummary(
      {required this.questionSummary, required this.answerGotten, super.key});

  final Map<String, Object> questionSummary;
  final bool answerGotten;

  @override
  Widget build(BuildContext context) {
    Color textandContainerColor = answerGotten ? Colors.green : Colors.red;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 10,
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: textandContainerColor,
          ),
          padding: const EdgeInsets.all(15),
          child: Text(
            ((questionSummary["questionIndex"] as int) + 1).toString(),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                questionSummary["questionText"] as String,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                questionSummary["correctAnswer"] as String,
                style: const TextStyle(
                  color: Colors.green,
                ),
              ),
              Text(
                "Your answer: ${questionSummary["userAnswer"] as String}",
                style: TextStyle(
                  color: textandContainerColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
