import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class AddTodo extends TodoEvent {
  final String title;
  final String category;

  const AddTodo(this.title, this.category);

  @override
  List<Object> get props => [title, category];
}

class DeleteTodo extends TodoEvent {
  final String id;

  const DeleteTodo(this.id);

  @override
  List<Object> get props => [id];
}

class ToggleTodoStatus extends TodoEvent {
  final String id;

  const ToggleTodoStatus(this.id);

  @override
  List<Object> get props => [id];
}

class EditTodo extends TodoEvent {
  final String id;
  final String newTitle;
  final String newCategory;

  const EditTodo(this.id, this.newTitle, this.newCategory);

  @override
  List<Object> get props => [id, newTitle, newCategory];
}

class LoadTodos extends TodoEvent {
  const LoadTodos();

  @override
  List<Object> get props => [];
}
