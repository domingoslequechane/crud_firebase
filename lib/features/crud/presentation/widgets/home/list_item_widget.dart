import 'package:crud_firebase/core/utils/app_colors.dart';
import 'package:crud_firebase/features/crud/data/models/task_model.dart';
import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  final TaskModel taskModel;
  final void Function()? onPressedCompleteTask;
  final void Function()? onTap;
  final void Function()? onPressedDeleteTask;
  const ListItemWidget({
    Key? key,
    required this.taskModel,
    required this.onPressedCompleteTask,
    required this.onTap,
    required this.onPressedDeleteTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: taskModel.isCompleted!
            ? const Icon(
                Icons.check_circle,
                color: AppColors.blue900,
              )
            : const Icon(
                Icons.check_circle_outline,
                color: AppColors.blue900,
              ),
        onPressed: onPressedCompleteTask,
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          taskModel.name!,
          style: TextStyle(
            decoration: taskModel.isCompleted!
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            color: AppColors.black,
            fontSize: 18,
          ),
        ),
      ),
      subtitle: Row(
        children: [
          Text(
            taskModel.time!,
            style: TextStyle(
              decoration: taskModel.isCompleted!
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              color: AppColors.black,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            taskModel.date!,
            style: TextStyle(
              decoration: taskModel.isCompleted!
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              color: AppColors.black,
            ),
          ),
        ],
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete_forever_outlined),
        onPressed: onPressedDeleteTask,
      ),
      onTap: onTap,
    );
  }
}
