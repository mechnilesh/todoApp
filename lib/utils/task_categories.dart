import 'package:flutter/material.dart';

enum TaskCategories {
  education(icon: Icons.school, color: Colors.blueGrey),
  health(icon: Icons.favorite_sharp, color: Colors.deepOrange),
  home(icon: Icons.home, color: Colors.red),
  others(icon: Icons.other_houses, color: Colors.blue),
  personal(icon: Icons.personal_injury, color: Colors.pink),
  shopping(icon: Icons.shopping_bag, color: Colors.purple),
  social(icon: Icons.social_distance, color: Colors.orange),
  travel(icon: Icons.travel_explore, color: Colors.yellow),
  work(icon: Icons.work, color: Colors.green);

  static TaskCategories stringToCategory(String name) {
    try {
      return TaskCategories.values.firstWhere(
        (category) => category.name == name,
      );
    } catch (e) {
      return TaskCategories.others;
    }
  }

  final IconData icon;
  final Color color;
  const TaskCategories({
    required this.icon,
    required this.color,
  });
}
