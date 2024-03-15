import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_quiz_app/data/questions_list.dart';
import 'package:my_quiz_app/custom_widgets/each_questions_summary.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({required this.onRestart, required this.userAnswers, super.key});

  final void Function(String) onRestart;
  final List<String> userAnswers;
  final List<Map<String, Object>> summary = [];

  List<Map<String, Object>> getSummaryData() {
    for (int i = 0; i < questions.length; i++) {
      summary.add(
        {
          "questionIndex": i,
          "questionText": questions[i].questionText,
          "correctAnswer": questions[i].answers[0],
          "userAnswer": userAnswers[i],
        },
      );
    }
    return summary;
  }

  int correctlyAnsweredQuestion(List<Map<String, Object>> summaryData) {
    int totalGotten = 0;
    for (int i = 0; i < summaryData.length; i++) {
      if (summaryData[i]["correctAnswer"] == summaryData[i]["userAnswer"]) {
        totalGotten++;
      }
    }
    return totalGotten;
  }

  @override
  Widget build(BuildContext context) {
    final summary = getSummaryData();
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You got ${correctlyAnsweredQuestion(summary)} out of ${summary.length}",
            style: GoogleFonts.inder(
              textStyle: const TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 400,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...summary.map(
                    (eachSummary) => EachQuestionsSummary(
                      questionSummary: eachSummary,
                      answerGotten: eachSummary["userAnswer"] ==
                          eachSummary["correctAnswer"],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton.icon(
            onPressed: () {
              onRestart("questions-screen");
              userAnswers.clear();
            },
            icon: const Icon(
              Icons.restart_alt_rounded,
            ),
            label: const Text("Restart?"),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.black,
            ),
          )
        ],
        // ),
      ),
    );
  }
}
