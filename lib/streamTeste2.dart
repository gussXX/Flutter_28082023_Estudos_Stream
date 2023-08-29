// ignore_for_file: unused_field, avoid_print, unused_local_variable, unnecessary_brace_in_string_interps, no_leading_underscores_for_local_identifiers, unused_element
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

/// MINHA CLASSE StreamTeste2 extende a CLASSE StatefulWidget
/// O OBJETO DA CLASSE StatefulWidget É UM WIDGET QUE PODE MUDAR SEU ESTADO
///
class StreamTeste2 extends StatefulWidget {
  const StreamTeste2({super.key});

  @override
  State<StreamTeste2> createState() {
    /// _MyAppState() É UM OBJETO DA CLASSE STATE
    /// ESPECIFICO PARA O WIDGET StreamTeste2
    /// RETORNAMOS O OBEJTO _MyAppState(); DA CLASSE StreamTeste2, QUE HERDA OS ATRIBUTOS E MOTODOS DO StatefulWidget
    //  STATE É UMA CLASSE ABSTRATA ESPECIFICA PARA O WIDGET StreamTeste2
    return _MyAppState();
  }
}
  /// A CLASSE HERDA DE State<StreamTeste2>
class _MyAppState extends State<StreamTeste2> {
  
  /// ESTANCIO UM CONTROLLER PARA MINHA STREAM FORA DO METODO BUILD
  /// O METODO .broadcast PERMITE QUE A STREAM TENHA MAIS DE UM OUVINTE/
  final _streamController = StreamController.broadcast(
    onCancel: () {print('Done');},
    onListen: () {print('Listen');},
  );

  /// TODAS AS CLASSES QUE HERDAM STATEFULWIDGET OBRIGATORIAMENTE DEVEM TER O METODO build(), QUE CONSTROI O WIDGET
  /// TODA VEZ QUE SetState() É CHAMADO, O METODO BUILD É CHAMADO TAMBEM
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
                  if (snapshot.hasError) {
                    return Text(snapshot.data.toString());
                  }else{
                    switch (snapshot.connectionState){
                      case ConnectionState.none:    return Text('None -->     ${snapshot.data.toString()}');
                      case ConnectionState.active:  return Text('Active -->   ${snapshot.data.toString()}');
                      case ConnectionState.done:    return Text('Done -->     ${snapshot.data.toString()}');
                      case ConnectionState.waiting: return const CircularProgressIndicator();
                    }
                  }
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
