import 'package:crud_firebase/features/crud/data/models/task_model.dart';

abstract class UpdateTaskRepository {
  Future<void> update({required TaskModel taskModel});
}
