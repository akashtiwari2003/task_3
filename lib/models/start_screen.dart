import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget{
  const StartScreen(this.startQuiz ,{super.key});
  final void Function() startQuiz;
  @override
  Widget build(context){
    return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assetss/quiz-logo.png',width: 300,
            ),
            SizedBox(height: 50
            ),
            const Text(
                'Learn Flutter the fun way!!!',
                style: TextStyle(color: Colors.white,fontSize: 24)
            ),
            const SizedBox(height: 50
            ),
            ElevatedButton.icon(
                onPressed:  startQuiz
                ,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                icon: const Icon(Icons.arrow_right_alt),
                label: Text('Start Quizz'))
          ],
        )
    );
  }

}