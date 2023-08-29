// ignore_for_file: unused_field, unused_local_variable, file_names

import 'dart:async';

import 'package:flutter/material.dart';

class StreamTeste extends StatefulWidget {
  const StreamTeste({super.key});

  @override
  State<StreamTeste> createState() => _StreamTesteState();
}

class _StreamTesteState extends State<StreamTeste> {
  final Stream<int> _bids = (() {
    late final StreamController<int> streamController;
    streamController = StreamController<int>(
      onListen: () async {
        await Future<void>.delayed(const Duration(seconds: 2));
        streamController.add(10);
        await Future<void>.delayed(const Duration(seconds: 2));

        await streamController.close();
      },
    );
    return streamController.stream;
  })();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 236, 0, 0),
      ),
      body: Center(
        child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StreamBuilder(
                    initialData: 9,
                    stream: _bids,
                    builder: (context, snapshot) {
                      List<Widget> children;
                      if (snapshot.hasError) {
                        children = <Widget>[Text(' ${snapshot.data} ERRO')];
                      } else {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            children = <Widget>[Text(' ${snapshot.data} NONE')];

                          case ConnectionState.waiting:
                            children = <Widget>[
                              Text(' ${snapshot.data} WAITING')
                            ];

                          case ConnectionState.active:
                            children = <Widget>[
                              Text(' ${snapshot.data} ACTIVE')
                            ];

                          case ConnectionState.done:
                            children = <Widget>[Text(' ${snapshot.data} DONE')];
                        }
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: children,
                      );
                    }),
                IconButton(
                    onPressed: () => {},
                    icon: const Icon(Icons.home_repair_service)),
              ],
            )),
      ),
    );
  }
}
