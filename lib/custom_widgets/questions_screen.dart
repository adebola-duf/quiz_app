import 'package:flutter/material.dart';
import 'package:my_quiz_app/data/questions_list.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({required this.onAnsweredQuestion, super.key});

  final void Function(String) onAnsweredQuestion;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;

  selectedAnswer(String answer) {
    widget.onAnsweredQuestion(answer);
    setState(
      () {
        currentQuestionIndex++;
        if (currentQuestionIndex == 6) {
          currentQuestionIndex = 0;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(100),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[currentQuestionIndex].questionText,
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            ...questions[currentQuestionIndex].getShuffledAnswers().map(
                  (eachAnswerString) => Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          selectedAnswer(eachAnswerString);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 20,
                            )),
                        child: Text(
                          eachAnswerString,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                )
          ],
        ),
      ),
    );
  }
}
