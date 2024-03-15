class Question {
  const Question({required this.questionText, required this.answers});

  final String questionText;
  final List<String> answers;

  List<String> getShuffledAnswers(){
    final shuffledList = List<String>.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
