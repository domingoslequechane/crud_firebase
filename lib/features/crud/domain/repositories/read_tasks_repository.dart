import 'package:crud_firebase/features/crud/data/models/task_model.dart';

abstract class ReadTasksRepository {
  Stream<List<TaskModel>> read();
}
