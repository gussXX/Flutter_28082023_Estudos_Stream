import 'package:flutter/material.dart';

class Tasks extends StatelessWidget {
  const Tasks({Key? key}) : super(key: key);

  addTask() {}

  removeTask(int index) {
    void f(int x) {
      debugPrint('debug: $x');
    }

    f(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
        actions: [IconButton(onPressed: addTask, icon: const Icon(Icons.add))],
      ),
      body: ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) => ListTile(
          title: Text(index.toString()),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => removeTask(index),
          ),
        ),
        separatorBuilder: (BuildContext context, int index) => Divider(
          color: Theme.of(context).dividerColor.withOpacity(0.5),
          thickness: .2,
        ),
      ),
    );
  }
}
