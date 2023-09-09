class QuizzQuestion {
  const QuizzQuestion(this.text,this.answers);
  final String text;
  final List<String> answers;
  List<String> getShuffleAnswers(){
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}