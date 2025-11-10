import 'package:flutter_test/flutter_test.dart';
import 'package:exam_schedule/main.dart';

void main() {
  testWidgets('App builds and shows title', (WidgetTester tester) async {
    await tester.pumpWidget(const ExamsApp());
    await tester.pump(); 
    expect(find.text('Распоред за испити - 201226'), findsOneWidget);
  });
}
