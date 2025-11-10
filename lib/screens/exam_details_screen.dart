import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../utils/time_utils.dart';

class ExamDetailsScreen extends StatelessWidget {
  final Exam exam;
  const ExamDetailsScreen({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final bool isPast = exam.dateTime.isBefore(now);
    final String diff = formatDaysHoursDiff(now, exam.dateTime);

    return Scaffold(
      appBar: AppBar(title: const Text('Детали за испит')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exam.subject,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Row(children: [
                  const Icon(Icons.calendar_today_rounded),
                  const SizedBox(width: 8),
                  Text(kDateFmt.format(exam.dateTime)),
                  const SizedBox(width: 16),
                  const Icon(Icons.access_time_filled),
                  const SizedBox(width: 8),
                  Text(kTimeFmt.format(exam.dateTime)),
                ]),
                const SizedBox(height: 12),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Icon(Icons.location_on_rounded),
                  const SizedBox(width: 8),
                  Expanded(child: Text(exam.rooms.join(', '))),
                ]),
                const Divider(height: 24),
                Row(
                  children: [
                    Icon(
                      isPast ? Icons.check_circle_rounded : Icons.hourglass_bottom_rounded,
                      color: isPast ? Colors.green : Colors.orange,
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        isPast
                            ? 'Испитот помина пред $diff'
                            : 'Преостанува: $diff',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
