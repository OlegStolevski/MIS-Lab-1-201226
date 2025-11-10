import 'package:intl/intl.dart';

final DateFormat kDateFmt = DateFormat('dd.MM.yyyy');
final DateFormat kTimeFmt = DateFormat('HH:mm');

String formatDaysHoursDiff(DateTime from, DateTime to) {
  final Duration diff = to.difference(from);
  final int totalHours = diff.inHours.abs(); 
  final int days = totalHours ~/ 24;
  final int hours = totalHours % 24;
  return '$days дена, $hours часа';
}
