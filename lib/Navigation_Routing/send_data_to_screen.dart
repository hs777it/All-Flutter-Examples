import 'package:flutter/material.dart';

class Task {
  final String taskName;
  final String description;

  Task(this.taskName, this.description);
}

void main() {
  runApp(MaterialApp(
    title: 'Passing Data',
    home: TodosScreen(
      // generate list
      tasks: List.generate(
        10,
        (i) => Task(
          'Task $i',
          'Task Description $i',
        ),
      ),
    ),
  ));
}

// Home screen
class TodosScreen extends StatelessWidget {
  final List<Task> tasks;

  const TodosScreen({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Data to Screen'),
        backgroundColor: Colors.green,
      ),
      // List builder
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index].taskName),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(task: tasks[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// detail screen
class DetailScreen extends StatelessWidget {
  final Task task;

  const DetailScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.taskName),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        // ignore: prefer_const_constructors
        padding: EdgeInsets.all(16.0),
        child: Text(task.description),
      ),
    );
  }
}
