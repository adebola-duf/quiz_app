import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({required this.onPressedStartButton, super.key});

  final void Function(String) onPressedStartButton;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "images/quiz-logo.png",
            width: 200,
            color: const Color.fromARGB(198, 255, 255, 255),
          ),
          const SizedBox(
            height: 70,
          ),
          const Text(
            "Learn Flutter the right way",
            style: TextStyle(
              fontSize: 28,
              color: Color.fromARGB(198, 255, 255, 255),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton.icon(
            onPressed: () => onPressedStartButton("questions-screen"),
            label: const Text(
              "Let's goooo!",
            ),
            icon: const Icon(
              Icons.keyboard_double_arrow_right_sharp,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
