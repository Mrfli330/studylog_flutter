
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/catatan_store.dart';
import 'pages/beranda_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CatatanStore(),
      child: const StudyLogApp(),
    ),
  );
}

class StudyLogApp extends StatelessWidget {
  const StudyLogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StudyLog',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
      ),
      home: const BerandaPage(),
    );
  }
}
