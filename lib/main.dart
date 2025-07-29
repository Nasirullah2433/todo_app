import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/blocs/todo/todo_bloc.dart';
import 'package:todo_app/blocs/todo/todo_event.dart';
import 'package:todo_app/models/todo_models.dart';
import 'package:todo_app/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Register the Todo adapter
  Hive.registerAdapter(TodoAdapter());

  // Open the Hive box
  final todoBox = await Hive.openBox<Todo>('todos');

  // Run the app
  runApp(MyApp(todoBox: todoBox));
}

class MyApp extends StatelessWidget {
  final Box<Todo> todoBox;

  const MyApp({super.key, required this.todoBox});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoBloc>(
      create: (context) => TodoBloc(todoBox: todoBox)..add(LoadTodos()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo App',
        theme: ThemeData.light(),

        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,

        home: const HomeScreen(),
      ),
    );
  }
}
