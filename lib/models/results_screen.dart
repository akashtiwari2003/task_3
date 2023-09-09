import 'package:flutter/material.dart';
import 'start_screen.dart';
import 'quizz.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen ({super.key, required this.chosenAnswers, required this.finscore, required this.resetScore});
  final List<String> chosenAnswers;
  final int finscore;
  final void Function() resetScore;
  //final int val;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center ,
          children: [
            Text(
                'Your score is $finscore',
                style: const TextStyle(color: Colors.white,fontSize: 24)
            ),
            const SizedBox(height: 15),
            ElevatedButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Quizz(),
                ),
              );
            },
              child: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
