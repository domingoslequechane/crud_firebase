import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_firebase/core/error/exceptions.dart';
import 'package:crud_firebase/features/crud/data/models/task_model.dart';

abstract class DeleteTaskDataSource {
  Future<void> delete({required TaskModel taskModel});
}

class DeleteTaskDataSourceiImpl implements DeleteTaskDataSource {
  final CollectionReference _reference;

  DeleteTaskDataSourceiImpl(this._reference);

  @override
  Future<void> delete({required TaskModel taskModel}) {
    if (taskModel.uid != null) {
      return _reference.doc(taskModel.uid).delete();
    } else {
      throw ServerException();
    }
  }
}
