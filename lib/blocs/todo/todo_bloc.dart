import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/blocs/todo/todo_event.dart';
import 'package:todo_app/blocs/todo/todo_state.dart';
import 'package:todo_app/models/todo_models.dart';
import 'package:collection/collection.dart'; // Used for firstWhereOrNull

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final Box<Todo> todoBox;

  TodoBloc({required this.todoBox}) : super(const TodoState()) {
    on<AddTodo>(_onAddTodo);
    on<DeleteTodo>(_onDeleteTodo);
    on<ToggleTodoStatus>(_onToggleTodoStatus);
    on<EditTodo>(_onEditTodo);
    on<LoadTodos>(_onLoadTodos);
  }

  void _onAddTodo(AddTodo event, Emitter<TodoState> emit) {
    final newTodo = Todo(
      id: DateTime.now().toIso8601String(),
      title: event.title,
      category: event.category,
      isCompleted: false,
    );

    todoBox.put(newTodo.id, newTodo);

    final updatedTodos = [...state.todos, newTodo];
    emit(state.copyWith(todos: updatedTodos));
  }

  void _onDeleteTodo(DeleteTodo event, Emitter<TodoState> emit) {
    todoBox.delete(event.id);

    final updatedTodos = state.todos
        .where((todo) => todo.id != event.id)
        .toList();
    emit(state.copyWith(todos: updatedTodos));
  }

  void _onToggleTodoStatus(ToggleTodoStatus event, Emitter<TodoState> emit) {
    final todo = state.todos.firstWhereOrNull((t) => t.id == event.id);
    if (todo == null) return;

    final updated = todo.copyWith(isCompleted: !todo.isCompleted);
    todoBox.put(updated.id, updated);

    final updatedTodos = state.todos.map((t) {
      return t.id == updated.id ? updated : t;
    }).toList();

    emit(state.copyWith(todos: updatedTodos));
  }

  void _onEditTodo(EditTodo event, Emitter<TodoState> emit) {
    final todo = state.todos.firstWhereOrNull((t) => t.id == event.id);
    if (todo == null) return;

    final updated = todo.copyWith(
      title: event.newTitle,
      category: event.newCategory,
    );
    todoBox.put(updated.id, updated);

    final updatedTodos = state.todos.map((t) {
      return t.id == updated.id ? updated : t;
    }).toList();

    emit(state.copyWith(todos: updatedTodos));
  }

  void _onLoadTodos(LoadTodos event, Emitter<TodoState> emit) {
    final todos = todoBox.values.toList();
    emit(state.copyWith(todos: todos));
  }
}
