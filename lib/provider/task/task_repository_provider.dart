
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/data/datasource/task_datasource_provider.dart';
import 'package:todoapp/data/repositories/repositories.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  final datasource = ref.watch(taskDatasourceProvider);
  return TaskRepositoryImp(datasource);
});