// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'dart:ui_web';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SizedBox(
          width: double.infinity,
          height: 150,
          child: Card(
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, './stream'),
              child: const Center(
                  child: Text(
                '${0} Tarefas',
              )),
            ),
          ),
        ),
      )),
    );
  }
}
