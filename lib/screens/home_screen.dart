import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/config/routes/route_location.dart';
import 'package:todoapp/data/models/task.dart';
import 'package:todoapp/provider/task/task_provider.dart';
import 'package:todoapp/utils/extensions.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;

    final taskState = ref.watch(taskProvider);

    final incompletedTasks = _incompletedTasks(taskState.tasks);

    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          context.push(RouteLocation.createTask);
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: DisplayWhiteText(
            text: 'Add New Task',
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
                color: colors.primary,
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DisplayWhiteText(
                        text: 'My Todo List',
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: 130,
            left: 0,
            right: 0,
            bottom: 10,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const DisplayWhiteText(
                      text: 'Upcoming Tasks',
                      fontSize: 20,
                      // fontWeight: FontWeight.bold,
                    ),
                    const Gap(20),
                    DisplayListOfTasks(
                      tasks: incompletedTasks,
                    ),
                    const Gap(20),
                    const Text(
                      'Ongoing Tasks',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    const Gap(20),
                    DisplayListOfTasks(
                      tasks: incompletedTasks,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<Task> _incompletedTasks(List<Task> tasks) {
  final List<Task> filteredTasks = [];
  for (var task in tasks) {
    if (!task.isCompleted) {
      filteredTasks.add(task);
    }
  }
  return filteredTasks;
}
