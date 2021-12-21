import 'package:crud_firebase/features/crud/data/models/task_model.dart';

abstract class DeleteTaskRepository {
  Future<void> delete({required TaskModel taskModel});
}
