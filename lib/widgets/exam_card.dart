import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../utils/time_utils.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback onTap;
  const ExamCard({super.key, required this.exam, required this.onTap});

  bool get isPast => exam.dateTime.isBefore(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final ColorScheme cs = Theme.of(context).colorScheme;

    final Color stripeColor = isPast
        ? cs.errorContainer.withOpacity(0.7)
        : cs.primaryContainer.withOpacity(0.7);

    final Color titleColor = isPast ? cs.onSurfaceVariant : cs.onPrimaryContainer;

    return Card(
      elevation: 1.5,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Container(width: 6, height: 96, color: stripeColor),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exam.subject,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600, color: titleColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today_rounded, size: 18),
                        const SizedBox(width: 6),
                        Text(kDateFmt.format(exam.dateTime)),
                        const SizedBox(width: 12),
                        const Icon(Icons.access_time_filled, size: 18),
                        const SizedBox(width: 6),
                        Text(kTimeFmt.format(exam.dateTime)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.location_on_rounded, size: 18),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            exam.rooms.join(', '),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
