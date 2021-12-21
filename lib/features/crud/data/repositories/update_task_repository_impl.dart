import 'package:crud_firebase/core/error/exceptions.dart';
import 'package:crud_firebase/core/error/failures.dart';
import 'package:crud_firebase/features/crud/data/datasources/update_task_data_source.dart';
import 'package:crud_firebase/features/crud/data/models/task_model.dart';
import 'package:crud_firebase/features/crud/domain/repositories/update_task_repository.dart';

class UpdateTaskRepositoryImpl implements UpdateTaskRepository {
  final UpdateTaskDataSource updateTaskDataSource;

  UpdateTaskRepositoryImpl(this.updateTaskDataSource);

  @override
  Future<void> update({required TaskModel taskModel}) async {
    try {
      return await updateTaskDataSource.update(taskModel: taskModel);
    } on ServerException {
      throw ServerFailure('Error Updating Task.');
    }
  }
}
