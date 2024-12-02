import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((summary) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: (summary['user_answer'] == summary['correct_answer'])
                        ? const Color.fromARGB(255, 150, 198, 241)
                        : const Color.fromARGB(255, 249, 133, 241),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    ((summary['question_index'] as int) + 1).toString(),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 22, 2, 56),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        summary['question'] as String,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        summary['user_answer'].toString(),
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        summary['correct_answer'].toString(),
                        style: const TextStyle(
                          color: Colors.green,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
