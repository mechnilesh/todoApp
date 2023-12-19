import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/widgets.dart';

import '../provider/providers.dart';

class SelectCategory extends ConsumerWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SelectedCategory = ref.watch(categoryProvider);
    final categories = TaskCategories.values.toList();

    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Text(
            'Category',
            style: context.textTheme.titleLarge,
          ),
          const Gap(20),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                final category = categories[index];

                return InkWell(
                  onTap: () {
                    ref.read(categoryProvider.notifier).state = category;
                  },
                  child: CircleContainer(
                    color: category.color.withOpacity(0.3),
                    child: Icon(
                      category.icon,
                      color: category == SelectedCategory
                          ? context.colorScheme.onPrimary
                          : category.color,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Gap(10);
              },
              itemCount: categories.length,
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}
