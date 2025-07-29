import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/models/todo_models.dart';

class MockTodoBox extends Mock implements Box<Todo> {}

void main() {
  late MockTodoBox mockTodoBox;

  setUp(() {
    mockTodoBox = MockTodoBox();

    // Mock necessary methods if accessed in TodoBloc
    when(() => mockTodoBox.values).thenReturn([]);
    when(() => mockTodoBox.put(any(), any())).thenAnswer((_) async {});
    when(() => mockTodoBox.delete(any())).thenAnswer((_) async {});
    when(() => mockTodoBox.isOpen).thenReturn(true);
  });

  testWidgets('App loads without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(todoBox: mockTodoBox));

    // This just ensures the app builds; you can add specific UI checks if needed
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
