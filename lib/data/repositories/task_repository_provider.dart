import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vazifalar/data/data.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  final datasource = ref.read(taskDatasourceProvider);
  return TaskRepositoryImpl(datasource);
});