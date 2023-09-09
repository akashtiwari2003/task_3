import 'package:flutter/material.dart';
import 'question_screen.dart';
import 'results_screen.dart';
import 'start_screen.dart';
import 'package:task_3/data/questions.dart';
class Quizz extends StatefulWidget{
  const Quizz({super.key});
  @override
  State<Quizz> createState(){
    return _QuizzState();
  }
}

class _QuizzState extends State<Quizz>{
  int score = 0;
  Widget? activeScreen;
  List<String> selectedAnswers=[];
  @override
  void initState(){
    activeScreen=StartScreen(switchScreen);
    super.initState();
  }
  void switchScreen(){
    setState(() {
      activeScreen= QuestionsScreen(onSelectAnswer:chooseAnswer ,scoreTrack: scoreUpdate,);
    });
  }
  void scoreUpdate(){
    ++score;
  }
  void scoreReset(){
    score = 0;
    selectedAnswers = [];
  }
  void chooseAnswer (String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = ResultsScreen(chosenAnswers: selectedAnswers,finscore: score, resetScore: scoreReset,);
        selectedAnswers=[];
      });
    }
  }
  @override
  Widget build(context){
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(gradient: LinearGradient(
              colors:[
                Colors.purple,
                Colors.purpleAccent,
              ] ,
            ),
            ),
            child: activeScreen
        ),
      ),
    );
  }
}