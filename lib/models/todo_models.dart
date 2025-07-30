import 'package:hive/hive.dart';

part 'todo_models.g.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String category;

  @HiveField(3)
  final bool isCompleted;

  //Constructor for Todo model

  Todo({
    required this.id,
    required this.title,
    required this.category,
    required this.isCompleted,
  });
  //Method to convert Todo object to a map
  Todo copyWith({
    String? id,
    String? title,
    String? category,
    bool? isCompleted,
  }) {
    // Returns a new Todo object with updated fields
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
