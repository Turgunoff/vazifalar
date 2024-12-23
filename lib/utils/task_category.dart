import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

enum TaskCategory {
  education(IconsaxPlusBold.task, Colors.blueGrey),
  health(IconsaxPlusBold.heart, Colors.orange),
  home(IconsaxPlusBold.home, Colors.green),
  others(IconsaxPlusBold.calendar, Colors.purple),
  personal(IconsaxPlusBold.personalcard, Colors.lightBlue),
  shopping(IconsaxPlusBold.shopping_bag, Colors.deepOrange),
  social(IconsaxPlusBold.people, Colors.brown),
  travel(IconsaxPlusBold.airplane, Colors.pink),
  work(IconsaxPlusBold.card, Colors.amber);

  static TaskCategory stringToTaskCategory(String name) {
    try {
      return TaskCategory.values.firstWhere(
        (category) => category.name == name,
      );
    } catch (e) {
      return TaskCategory.others;
    }
  }

  final IconData icon;
  final Color color;
  const TaskCategory(this.icon, this.color);
}
