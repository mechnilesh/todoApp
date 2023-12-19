import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/provider/date_provider.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/common_text_field.dart';
import 'package:intl/intl.dart';

import '../provider/time_provider.dart';

class SelecteDateTime extends ConsumerWidget {
  const SelecteDateTime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);

    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              _selectDate(context, ref);
            },
            child: CommonTextField(
              hintText: DateFormat.yMMMd().format(date),
              title: 'Date',
              readOnly: true,
            ),
          ),
        ),
        const Gap(10),
        Expanded(
          child: InkWell(
            onTap: () {
              _selectTime(context, ref);
            },
            child: CommonTextField(
              hintText: Helpers.timeToString(time),
              title: 'Time',
              readOnly: true,
            ),
          ),
        ),
      ],
    );
  }

  void _selectTime(BuildContext context, WidgetRef ref) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      ref.read(timeProvider.notifier).state = pickedTime;
    }
  }

  void _selectDate(BuildContext context, WidgetRef ref) async {
    final initialDate = ref.read(dateProvider);

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2090),
    );

    if (pickedDate != null) {
      ref.read(dateProvider.notifier).state = pickedDate;
    }
  }
}
