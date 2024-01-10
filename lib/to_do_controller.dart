import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ToDoController extends GetxController {
  final TextEditingController taskController = TextEditingController();
  RxList<Task> tasks = <Task>[].obs;
  RxList<Task> completedTasks = <Task>[].obs;

  void addTask(String title) {
    if (title.isNotEmpty) {
      tasks.add(Task(title: title, isCompleted: false));
 
      tasks.refresh();
    }
  }

  void completeTask(int index) {
    Task completedTask = tasks[index];
    tasks.removeAt(index);


    if (!completedTasks.contains(completedTask)) {
      completedTasks.insert(0, completedTask);
    }

  
    completedTasks.refresh();

  
    Future.delayed(const Duration(seconds: 2), () {
      completedTasks.remove(completedTask);
      completedTasks.refresh();
    });
  }

  @override
  void onClose() {
    taskController.dispose();
    super.onClose();
  }
}

class Task {
  final String title;
  bool isCompleted;

  Task({required this.title, required this.isCompleted});
}
