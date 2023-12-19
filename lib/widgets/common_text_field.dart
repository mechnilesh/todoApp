import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/utils/extensions.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.hintText,
    required this.title,
    this.controller,
    this.maxLines,
    this.readOnly = false,
  });

  final String hintText;
  final String title;
  final TextEditingController? controller;
  final int? maxLines;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: context.textTheme.titleLarge,
        ),
        const Gap(10),
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
          ),
          controller: controller,
          readOnly: readOnly,
          maxLines: maxLines,
          onChanged: (value) {},
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
        )
      ],
    );
  }
}
