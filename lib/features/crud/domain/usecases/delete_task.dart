import 'package:crud_firebase/features/crud/data/models/task_model.dart';
import 'package:crud_firebase/features/crud/domain/repositories/delete_task_repository.dart';

class DeleteTask implements DeleteTaskRepository {
  final DeleteTaskRepository _repository;

  DeleteTask(this._repository);

  @override
  Future<void> delete({required TaskModel taskModel}) {
    return _repository.delete(taskModel: taskModel);
  }
}
