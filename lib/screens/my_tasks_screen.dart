import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/config/routes/route_location.dart';
import 'package:todoapp/data/models/task.dart';
import 'package:todoapp/provider/task/task_provider.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/display_list_of_task.dart';
import 'package:todoapp/widgets/display_white_text.dart';

class MyTaskScreen extends ConsumerStatefulWidget {
  const MyTaskScreen({super.key});

  @override
  ConsumerState<MyTaskScreen> createState() => _MyTaskScreenState();
}

class _MyTaskScreenState extends ConsumerState<MyTaskScreen> {
  @override
  Widget build(BuildContext context) {
    final taskState = ref.watch(taskProvider);
    final completedTasks = _completedTasks(taskState.tasks);

    return Scaffold(
      appBar: AppBar(
        title: const DisplayWhiteText(
          text: 'My Tasks',
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.push(RouteLocation.createTask);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Gap(20),
            Text(
              "Completed",
              style: context.textTheme.headlineMedium,
            ),
            const Gap(20),
            DisplayListOfTasks(
              tasks: completedTasks,
              isCompletedTasks: true,
            ),
          ],
        ),
      ),
    );
  }
}

List<Task> _completedTasks(List<Task> tasks) {
  final List<Task> filteredTasks = [];
  for (var task in tasks) {
    if (task.isCompleted) {
      filteredTasks.add(task);
    }
  }
  return filteredTasks;
}
