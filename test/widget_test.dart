
import 'package:flutter_test/flutter_test.dart';
import 'package:studylog_flutter/main.dart';

void main() {
  testWidgets('StudyLog menampilkan form catatan', (
      WidgetTester tester,
      ) async {
    await tester.pumpWidget(const StudyLogApp());

    expect(find.text('StudyLog - Form Catatan'), findsOneWidget);
    expect(find.text('Mata kuliah'), findsOneWidget);
    expect(find.text('Judul catatan'), findsOneWidget);
    expect(find.text('Isi catatan'), findsOneWidget);
    expect(find.text('Tampilkan Catatan'), findsOneWidget);
  });
}
