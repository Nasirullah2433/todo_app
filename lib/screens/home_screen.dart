import 'package:flutter/material.dart';
import 'package:todo_app/widgets/add_task_dialog.dart';
import 'package:todo_app/widgets/tab_bar_widget.dart';
import 'package:todo_app/widgets/task_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      // Today,Daily,Weekly,Monthly
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Todo App',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.indigo,
          elevation: 4,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: TabBarWidget(),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            TaskListWidget(category: 'Today'),
            TaskListWidget(category: 'Daily'),
            TaskListWidget(category: 'Weekly'),
            TaskListWidget(category: 'Monthly'),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => const AddTaskDialog(),
            );
          },
          backgroundColor: Colors.indigo,
          icon: const Icon(Icons.add),
          label: const Text('Add Task'),
        ),
      ),
    );
  }
}
