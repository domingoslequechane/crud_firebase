import 'package:crud_firebase/core/error/exceptions.dart';
import 'package:crud_firebase/core/error/failures.dart';
import 'package:crud_firebase/features/crud/data/datasources/read_tasks_data_source.dart';
import 'package:crud_firebase/features/crud/data/models/task_model.dart';
import 'package:crud_firebase/features/crud/domain/repositories/read_tasks_repository.dart';

class ReadTasksRepositoryImpl implements ReadTasksRepository {
  final ReadTasksDataSource readTasksDataSource;

  ReadTasksRepositoryImpl(this.readTasksDataSource);

  @override
  Stream<List<TaskModel>> read() {
    try {
      return readTasksDataSource.read();
    } on ServerException {
      throw ServerFailure('Error Reading Tasks.');
    }
  }
}
