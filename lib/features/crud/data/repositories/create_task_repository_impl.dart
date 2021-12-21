import 'package:crud_firebase/core/error/exceptions.dart';
import 'package:crud_firebase/core/error/failures.dart';
import 'package:crud_firebase/features/crud/data/datasources/create_task_data_source.dart';
import 'package:crud_firebase/features/crud/data/models/task_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_firebase/features/crud/domain/repositories/create_task_repository.dart';

class CreateTaskRepositoryImpl implements CreateTaskRepository {
  final CreateTaskDataSource createTaskDataSource;

  CreateTaskRepositoryImpl(this.createTaskDataSource);

  @override
  Future<DocumentReference> create({required TaskModel taskModel}) async {
    try {
      return await createTaskDataSource.create(taskModel: taskModel);
    } on ServerException {
      throw ServerFailure('Error Creating Task.');
    }
  }
}
