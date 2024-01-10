import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 32) // Ensure that the typeId matches the one causing the error
class Task extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late bool isCompleted;

  Task({required this.title, required this.isCompleted});
}
