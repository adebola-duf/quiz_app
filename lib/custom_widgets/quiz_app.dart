import "package:flutter/material.dart";
import 'package:my_quiz_app/custom_widgets/start_screen.dart';
import 'package:my_quiz_app/custom_widgets/questions_screen.dart';
import 'package:my_quiz_app/custom_widgets/results_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() {
    return _QuizApp();
  }
}

class _QuizApp extends State<QuizApp> {
  String activeScreenName = "start-screen";
  late Widget activeScreen;
  List<String> userAnswers = [];

  void changeActiveScreen(String screenName) {
    setState(() {
      activeScreenName = screenName;
    });
  }

  void addAnswerToList(String answer) {
    userAnswers.add(answer);
    if (userAnswers.length == 6) {
      changeActiveScreen("results-screen");
    }
  }

  @override
  Widget build(BuildContext context) {
    activeScreen = StartScreen(onPressedStartButton: changeActiveScreen);
    if (activeScreenName == "questions-screen") {
      activeScreen = QuestionsScreen(
        onAnsweredQuestion: addAnswerToList,
      );
    } else if (activeScreenName == "results-screen") {
      activeScreen = ResultScreen(
        onRestart: changeActiveScreen,
        userAnswers: userAnswers,
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 39, 0, 106),
                Color.fromARGB(255, 45, 45, 45),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
