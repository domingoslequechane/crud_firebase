import 'package:crud_firebase/features/crud/data/models/task_model.dart';
import 'package:crud_firebase/features/crud/domain/repositories/update_task_repository.dart';

class UpdateTask implements UpdateTaskRepository {
  final UpdateTaskRepository _repository;

  UpdateTask(this._repository);

  @override
  Future<void> update({required TaskModel taskModel}) {
    return _repository.update(taskModel: taskModel);
  }
}
