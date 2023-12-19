import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/data/models/task.dart';
import 'package:todoapp/utils/extensions.dart';
import 'package:todoapp/widgets/widgets.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;

    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          CircleContainer(
            color: task.category.color.withOpacity(0.5),
            child: Center(
              child: Icon(
                task.category.icon,
                color: task.category.color,
              ),
            ),
          ),
          const Gap(16),
          Text(
            task.title,
            style: style.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            task.time,
            style: style.titleMedium,
          ),
          const Gap(16),
          Visibility(
            visible: !task.isCompleted,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Task to be completed on ${task.date}'),
                Icon(Icons.check_box, color: task.category.color),
              ],
            ),
          ),
          const Gap(16),
          Divider(
            thickness: 2,
            color: task.category.color,
          ),
          const Gap(16),
          Text(
            task.note.isEmpty ? 'No Additional Note' : task.note,
            style: style.titleMedium,
          ),
          const Gap(16),
          Visibility(
            visible: !task.isCompleted,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Task completed'),
                Icon(
                  Icons.check_box,
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
