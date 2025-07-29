import 'package:equatable/equatable.dart';
import 'package:todo_app/models/todo_models.dart'; // ✅ Match filename with your real model file

class TodoState extends Equatable {
  final List<Todo> todos;

  const TodoState({this.todos = const []});

  TodoState copyWith({List<Todo>? todos}) {
    return TodoState(todos: todos ?? this.todos);
  }

  @override
  List<Object> get props => [todos];
}
