import 'package:crud_firebase/features/crud/data/models/task_model.dart';
import 'package:crud_firebase/features/crud/domain/repositories/read_tasks_repository.dart';

class ReadTasks implements ReadTasksRepository {
  final ReadTasksRepository _repository;

  ReadTasks(this._repository);

  @override
  Stream<List<TaskModel>> read() {
    return _repository.read();
  }
}
