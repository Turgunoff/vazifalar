import 'package:flutter/material.dart';
import 'package:vazifalar/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vazifalar/data/data.dart';
import 'package:vazifalar/providers/providers.dart';
import 'package:go_router/go_router.dart';

@immutable
class AppAlerts {
  const AppAlerts._();

  static displaySnackbar(BuildContext context, String message,
      {Color backgroundColor = Colors.red}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: context.textTheme.bodyMedium!.copyWith(color: Colors.white),
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }

  static Future<void> showAlertDeleteDialog({
    required BuildContext context,
    required WidgetRef ref,
    required Task task,
  }) async {
    Widget cancelButton = TextButton(
      child: const Text("Yo'q"),
      onPressed: () => context.pop(),
    );
    Widget deleteButton = TextButton(
      onPressed: () async {
        await ref.read(tasksProvider.notifier).deleteTask(task).then(
          (value) {
            displaySnackbar(
              context,
              "Vazifa muvaffaqiyatli o'chirildi",
              backgroundColor: Colors.indigo,
            );
            context.pop();
          },
        );
      },
      child: const Text('Ha',style: TextStyle(color: Colors.red),),
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Haqiqatan ham bu vazifani o'chirmoqchimisiz?"),
      actions: [
        deleteButton,
        cancelButton,
      ],
    );

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
