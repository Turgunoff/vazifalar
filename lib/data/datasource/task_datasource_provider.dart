import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vazifalar/data/datasource/datasource.dart';

final taskDatasourceProvider = Provider<TaskDatasource>((ref) {
  return TaskDatasource();
});
