import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
    home: HomePage()));

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Kingdom songs")),
        body: Column(
          children: [
            Progress(),
            TaskList(),
          ],
        ));
  }
}

class Progress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("ECIB BRUXELLES!"),
        LinearProgressIndicator(value: 0.0),
      ],
    );
  }
}

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TaskItem(label: "Song 1"),
        for (var i=2; i<6; i++) TaskItem(label: "Song $i")
      ],
    );
  }
}

class TaskItem extends StatefulWidget {
  final String label;

  TaskItem({required this.label});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //redraw when the _value change

        Checkbox(value: _value, onChanged: toggle),
        Text(widget.label),
      ],
    );
  }

  void toggle(_) => setState(() => _value = !_value);
}