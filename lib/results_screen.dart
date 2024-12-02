import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.onRestartQuiz});

  final List<String> chosenAnswers;
  final void Function() onRestartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0, len = chosenAnswers.length; i < len; i++) {
      String eachAnswer = chosenAnswers[i];
      debugPrint('create summary for each answer: $eachAnswer');
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    if (chosenAnswers.isNotEmpty) print('chosenAnswers[0]');

    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where((summary) => summary['correct_answer'] == summary['user_answer'])
        .length;

    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
                style: const TextStyle(
                  color: Color.fromARGB(218, 255, 255, 255),
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              QuestionsSummary(summaryData: summaryData),
              const SizedBox(height: 30),
              TextButton.icon(
                onPressed: onRestartQuiz,
                icon: const Icon(Icons.refresh_sharp),
                label: const Text('Restart Quiz'),
                style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255)),
              )
            ],
          ),
        ));
  }
}
