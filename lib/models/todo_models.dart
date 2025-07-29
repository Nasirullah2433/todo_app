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

  Todo({
    required this.id,
    required this.title,
    required this.category,
    required this.isCompleted,
  });

  Todo copyWith({
    String? id,
    String? title,
    String? category,
    bool? isCompleted,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
