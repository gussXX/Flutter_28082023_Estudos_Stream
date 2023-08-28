// ignore_for_file: unused_field, avoid_print, unused_local_variable, unnecessary_brace_in_string_interps, no_leading_underscores_for_local_identifiers, unused_element
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class StreamTeste2 extends StatefulWidget {
  const StreamTeste2({super.key});

  @override
  State<StreamTeste2> createState() => _MyAppState();
}

class _MyAppState extends State<StreamTeste2> {
  final _streamController = StreamController.broadcast(
    onCancel: () {},
    onListen: () {},
  );
  // Future<String> _convertIntergeinString(int value) async {
  //   return 'convertido ${value}';
  // }

  @override
  Widget build(BuildContext context) {
    print('BUILD');

    // final streamTypes =
    //     _streamController.stream.asyncMap(_convertIntergeinString);

    _streamController.stream.listen(
      (event) => print(event),
      onDone: () => print('Done'),
      onError: (error) => print(error),
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pausa do StreamBuilder'),
        ),
        body: Center(
            child: StreamBuilder(
                initialData: 0,
                stream: _streamController.stream,
                builder: ((context, snapshot) {
                  return Text(snapshot.data.toString());
                }))),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              child: const Icon(Icons.play_arrow),
              onPressed: () {
                if (_streamController.isClosed) {
                } else {
                  var random = Random();
                  var number = random.nextInt(99);

                  if (number == 57) {
                    _streamController.close();
                  } else {
                    _streamController.sink.add(number);
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
