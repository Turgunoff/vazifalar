import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vazifalar/data/data.dart';
import 'package:vazifalar/providers/providers.dart';

final tasksProvider = StateNotifierProvider<TaskNotifier, TaskState>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return TaskNotifier(repository);
});
