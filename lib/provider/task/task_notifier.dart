import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/data/models/task.dart';
import 'package:todoapp/data/repositories/task_repositories.dart';
import 'package:todoapp/provider/task/task.dart';

class TaskNotifier extends StateNotifier<TaskState> {
  final TaskRepository _taskRepository;

  TaskNotifier(this._taskRepository) : super(const TaskState.initial()) {
    //loading all data from database when the app starts
    getTasks();
  }

  Future<void> createTask(Task task) async {
    try {
      await _taskRepository.createTask(task);
      getTasks();
    } catch (e) {
      throw '$e';
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      final isCompleted = !task.isCompleted;
      final updatedTask = task.copyWith(isCompleted: isCompleted);
      await _taskRepository.updateTask(updatedTask);
      getTasks();
    } catch (e) {
      throw '$e';
    }
  }

  void getTasks() async {
    try {
      final tasks = await _taskRepository.getAllTasks();
      state = state.copyWith(tasks: tasks);
    } catch (e) {
      throw '$e';
    }
  }

  Future<void> deleteTask(Task task) async {
    try {
      await _taskRepository.deleteTask(task);
      getTasks();
    } catch (e) {
      throw '$e';
    }
  }
}
