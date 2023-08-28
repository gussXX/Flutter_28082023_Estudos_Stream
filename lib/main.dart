import 'package:estudos_stream/streamTeste.dart';
import 'package:estudos_stream/streamTeste2.dart';
import 'package:estudos_stream/tasks.dart';
import 'package:flutter/material.dart';

import 'dashboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        './tasks': (context) => const Tasks(),
        './': (context) => const DashboardPage(),
        './stream': (context) => const StreamTeste(),
        './stream2': (context) => StreamTeste2()
      },
      home: StreamTeste2(),
    );
  }
}
