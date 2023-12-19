import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/provider/task/task_provider.dart';
import 'package:todoapp/utils/extensions.dart';
import '../data/models/task.dart';
import 'common_container.dart';
import 'task_detail.dart';
import 'task_tile.dart';

class DisplayListOfTasks extends ConsumerWidget {
  const DisplayListOfTasks({
    super.key,
    required this.tasks,
    this.isCompletedTasks = false,
  });

  final List<Task> tasks;
  final bool isCompletedTasks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final height =
        isCompletedTasks ? deviceSize.height * 0.5 : deviceSize.height * 0.3;

    final emotyTaskMsg =
        isCompletedTasks ? 'No Completed Tasks' : 'No Tasks To Do';

    return CommonContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child: Text(
                emotyTaskMsg,
                style: context.textTheme.headlineLarge,
              ),
            )
          : ListView.separated(
              itemCount: tasks.length,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {
                final task = tasks[index];
                return InkWell(
                  onLongPress: () {
                    //todo delete task
                  },
                  onTap: () async {
                    //show task
                    await showModalBottomSheet(
                      context: context,
                      builder: (context) => TaskDetails(task: task),
                    );
                  },
                  child: TaskTile(
                      task: task,
                      onComplete: (value) async {
                        //todo update task
                        await ref.read(taskProvider.notifier).updateTask(task);
                      }),
                );
              },
              separatorBuilder: (context, index) => const Divider(thickness: 2),
            ),
    );
  }
}
