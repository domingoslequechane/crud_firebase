import 'package:crud_firebase/features/crud/data/models/task_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_firebase/features/crud/domain/repositories/create_task_repository.dart';

class CreateTask implements CreateTaskRepository {
  final CreateTaskRepository _repository;

  CreateTask(this._repository);

  @override
  Future<DocumentReference> create({required TaskModel taskModel}) {
    return _repository.create(taskModel: taskModel);
  }
}
