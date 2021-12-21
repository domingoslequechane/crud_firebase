import 'package:crud_firebase/features/crud/data/models/task_model.dart';

abstract class DeleteTodoRepository {
  Future<void> delete({required TaskModel taskModel});
}
