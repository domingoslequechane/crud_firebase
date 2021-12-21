import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_firebase/core/error/exceptions.dart';
import 'package:crud_firebase/features/crud/data/models/task_model.dart';

abstract class UpdateTaskDataSource {
  Future<void> update({required TaskModel taskModel});
}

class UpdateTaskDataSourceImpl implements UpdateTaskDataSource {
  final CollectionReference _reference;

  UpdateTaskDataSourceImpl(this._reference);

  @override
  Future<void> update({required TaskModel taskModel}) {
    if (taskModel.uid != null) {
      return _reference.doc(taskModel.uid).update(taskModel.toJson());
    } else {
      throw ServerException();
    }
  }
}
