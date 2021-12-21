import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_firebase/core/error/exceptions.dart';
import 'package:crud_firebase/features/crud/data/models/task_model.dart';

abstract class CreateTaskDataSource {
  Future<DocumentReference> create({required TaskModel taskModel});
}

class CreateTaskDataSourceImpl implements CreateTaskDataSource {
  final CollectionReference _reference;

  CreateTaskDataSourceImpl(this._reference);

  @override
  Future<DocumentReference> create({required TaskModel taskModel}) {
    if (taskModel.uid == null) {
      return _reference.add(taskModel.toJson());
    } else {
      throw ServerException();
    }
  }
}
