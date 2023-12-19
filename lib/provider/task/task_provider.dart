import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/provider/task/task.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, TaskState>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return TaskNotifier(repository);
});
