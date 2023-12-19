import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/widgets.dart';
import '../data/models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task, this.onComplete});
  final Task task;
  final Function(bool?)? onComplete;

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: context.textTheme.titleMedium?.copyWith(
                  decoration:
                      task.isCompleted ? TextDecoration.lineThrough : null,
                ),
              ),
              Text(
                task.time,
              ),
            ],
          ),
        ),
        Checkbox(
          value: task.isCompleted,
          onChanged: onComplete,
        ),
      ],
    );
  }
}
