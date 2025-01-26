import 'package:flutter/material.dart';
import 'package:myporject/quizbank.dart';

void main() {
  runApp(FinTeen());
}

class FinTeen extends StatelessWidget {
  const FinTeen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<int> scoreKeeper = [];
  int questionNumber = 0;

  QuizBank quizBank = QuizBank();

  int sum(List<int> numbers) {
    return numbers.fold(0, (sum, number) => sum + number);
  }

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = quizBank.getQuestionAnswer(questionNumber);

    setState(() {
      // Update the score based on the user's answer
      if (userAnswer == correctAnswer) {
        print('You are right');
        scoreKeeper.add(1); // Add 1 for correct answer
      } else {
        print('You are wrong');
        scoreKeeper.add(0); // Add 0 for wrong answer
      }

      // Advance to the next question
      if (questionNumber < quizBank.questionBank.length - 1) {
        questionNumber++;
      } else {
        // Reset or show the final score when the quiz ends
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Quiz Completed'),
              content: Text('Your total score is: ${sum(scoreKeeper)}'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      questionNumber = 0;
                      scoreKeeper.clear();
                    });
                  },
                  child: Text('Restart'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                quizBank.getQuestionText(questionNumber),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                checkAnswer(true);
              },
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                checkAnswer(false);
              },
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: [
            Text(
              "Current Score: ${sum(scoreKeeper)}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
