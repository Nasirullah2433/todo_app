import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/todo/todo_bloc.dart';
import 'package:todo_app/blocs/todo/todo_event.dart';
import 'package:todo_app/blocs/todo/todo_state.dart';
import 'package:todo_app/widgets/edit_task_dialog.dart';

class TaskListWidget extends StatelessWidget {
  final String category;

  const TaskListWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        final tasks = state.todos
            .where(
              (todo) => todo.category.toLowerCase() == category.toLowerCase(),
            )
            .toList();

        if (tasks.isEmpty) {
          return const Center(child: Text('No tasks'));
        }

        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final todo = tasks[index];
            return CheckboxListTile(
              title: Text(
                todo.title,
                style: TextStyle(
                  decoration: todo.isCompleted
                      ? TextDecoration.lineThrough
                      : null,
                ),
              ),
              value: todo.isCompleted,
              onChanged: (_) {
                context.read<TodoBloc>().add(
                  ToggleTodoStatus(todo.id),
                ); // ✅ fixed typo
              },
              secondary: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => EditTaskDialog(todo: todo),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context.read<TodoBloc>().add(DeleteTodo(todo.id));
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
