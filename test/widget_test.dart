
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:studylog_flutter/main.dart';
import 'package:studylog_flutter/providers/catatan_store.dart';

void main() {
  testWidgets('StudyLog menampilkan halaman beranda',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          ChangeNotifierProvider(
            create: (_) => CatatanStore(),
            child: const StudyLogApp(),
          ),
        );

        expect(find.text('Selamat Datang di StudyLog!'), findsOneWidget);
        expect(find.text('Lihat Daftar Catatan'), findsOneWidget);
      });
}
