import 'package:crud_firebase/core/error/exceptions.dart';
import 'package:crud_firebase/core/error/failures.dart';
import 'package:crud_firebase/features/crud/data/datasources/delete_task_data_source.dart';
import 'package:crud_firebase/features/crud/data/models/task_model.dart';
import 'package:crud_firebase/features/crud/domain/repositories/delete_task_repository.dart';

class DeleteTaskRepositoryImpl implements DeleteTodoRepository {
  final DeleteTaskDataSource deleteTaskDataSource;

  DeleteTaskRepositoryImpl(this.deleteTaskDataSource);

  @override
  Future<void> delete({required TaskModel taskModel}) async {
    try {
      return await deleteTaskDataSource.delete(taskModel: taskModel);
    } on ServerException {
      throw ServerFailure('Error Deleting Task.');
    }
  }
}
