import 'package:crud_firebase/core/utils/app_colors.dart';
import 'package:crud_firebase/core/utils/app_texts.dart';
import 'package:crud_firebase/features/crud/data/models/task_model.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
    required TaskModel? taskModel,
  })  : _taskModel = taskModel,
        super(key: key);

  final TaskModel? _taskModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 56,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _taskModel!.uid == null
                ? AppTexts.createTitle
                : AppTexts.updateTitle,
            style: const TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            _taskModel!.uid == null
                ? AppTexts.createMessage
                : AppTexts.updateMessage,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.grey600,
            ),
          ),
        ],
      ),
    );
  }
}
