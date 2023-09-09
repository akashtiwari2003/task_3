import 'package:flutter/material.dart';
import 'package:task_3/data/questions.dart';
import 'answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer,required this.scoreTrack});
  final void Function(String answer) onSelectAnswer;
  final void Function() scoreTrack;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer){
    if(selectedAnswer == questions[currentQuestionIndex].answers[0]){
      widget.scoreTrack();
    }
    setState(() {
      widget.onSelectAnswer(selectedAnswer);
      currentQuestionIndex = currentQuestionIndex+1;
    });
  }
  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.purpleAccent],
          ),
        ),
        // child: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: double.infinity,
            child: Container(
              margin: EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment:MainAxisAlignment.center ,
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  Text(currentQuestion.text,

                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  ...currentQuestion.getShuffleAnswers().map((item) {
                    return AnswerButton(answerText: item, onTap:(){answerQuestion(item);
                    },
                    );
                  }),
                  const SizedBox(height: 30),


                ],
              ),
            ),
          ),
        ),
      ),


    );


  }
}
