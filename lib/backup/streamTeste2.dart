// ignore_for_file: unused_local_variable, avoid_print, unused_element, void_checks

import 'dart:async';

import 'package:flutter/material.dart';

class StreamTeste2 extends StatelessWidget {
  const StreamTeste2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StreamController<int> streamController = StreamController<int>.broadcast();

  int counter = 0;

  void incrementCounter() {
    if (counter == 10) {
    } else {
      streamController.sink.add(counter++);
    }
  }

  final Stream<int> _teste2 = (() {
    late final StreamController<int> sc2;
    sc2 = StreamController<int>(
      onPause: () async* {},
      onCancel: () async* {},
      onResume: () async* {},
      onListen: () async {
        for (var i = 0; i < 78; i++) {
          await Future<void>.delayed(const Duration(seconds: 1));
          sc2.add(i);
        }
        await sc2.close();
      },
    );

    return sc2.stream;
  })();

  @override
  Widget build(BuildContext context) {
    print('METODO BUILD');

    return Scaffold(
      appBar: AppBar(
          title: StreamBuilder<int>(
        initialData: counter,
        stream: _teste2,
        builder: (context, snapshot) {
          return Text('${snapshot.data} X Atualizadas');
        },
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<int>(
                initialData: counter,
                stream: streamController.stream,
                builder: (context, snapshot) {
                  return Text(
                    '${snapshot.data}',
                    style: const TextStyle(fontSize: 20),
                  );
                }),
            StreamBuilder<int>(
                initialData: counter,
                stream: streamController.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('data');
                  } else {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Text("${snapshot.data} NONE");
                      case ConnectionState.active:
                        return Text("${snapshot.data} ACTIVE");
                      case ConnectionState.done:
                        return Text("${snapshot.data} DONE");
                      case ConnectionState.waiting:
                        return Text("${snapshot.data} WAITING");
                    }
                  }
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          incrementCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
