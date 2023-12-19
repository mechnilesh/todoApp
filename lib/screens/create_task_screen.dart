import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/config/routes/routes.dart';
import 'package:todoapp/data/datasource/calender_client.dart';
import 'package:todoapp/provider/category_provider.dart';
import 'package:todoapp/provider/date_provider.dart';
import 'package:todoapp/provider/task/task_provider.dart';
import 'package:todoapp/provider/time_provider.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/widgets.dart';
import '../data/models/task.dart';

class CreateTaskScreen extends ConsumerStatefulWidget {
  static CreateTaskScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTaskScreen();

  const CreateTaskScreen({super.key});

  @override
  ConsumerState<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends ConsumerState<CreateTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DisplayWhiteText(text: "Add New Task"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CommonTextField(
              hintText: 'Task Title',
              title: 'Task Title',
              controller: _titleController,
            ),
            const Gap(16),
            const SelectCategory(),
            const Gap(16),
            const SelecteDateTime(),
            const Gap(16),
            CommonTextField(
              hintText: 'Task Note',
              title: 'Note',
              controller: _noteController,
              maxLines: 6,
            ),
            const Gap(60),
            ElevatedButton(
              child: const DisplayWhiteText(text: 'Save'),
              onPressed: () {
                _createTask();

                CalendarClient calendarClient = CalendarClient();

                // adding event to google calendar
                calendarClient.insert(
                  title: _titleController.text,
                  description: _noteController.text,
                  date: ref.watch(dateProvider),
                  event: Event(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _createTask() async {
    final title = _titleController.text.trim();
    final note = _noteController.text.trim();
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    final category = ref.watch(categoryProvider);

    if (title.isNotEmpty) {
      final task = Task(
        title: title,
        note: note,
        date: DateFormat.yMMMd().format(date),
        time: Helpers.timeToString(time),
        category: category,
        isCompleted: false,
      );

      await ref.read(taskProvider.notifier).createTask(task).then((value) {
        context.go(RouteLocation.home);
      });
    }
  }
}
