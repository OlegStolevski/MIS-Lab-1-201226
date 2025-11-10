import 'package:flutter/material.dart';
import '../data/exams.dart';
import '../widgets/exam_card.dart';
import 'exam_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final sorted = List.of(kExams)..sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Распоред за испити - 201226'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 88),
        itemBuilder: (context, i) {
          final exam = sorted[i];
          return ExamCard(
            exam: exam,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => ExamDetailsScreen(exam: exam)),
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemCount: sorted.length,
      ),
      
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 52,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 8,
                      children: [
                        const Icon(Icons.list_alt_rounded),
                        Text(
                          'Вкупно испити: ${sorted.length}',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
