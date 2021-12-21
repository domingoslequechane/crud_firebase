import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_firebase/core/error/exceptions.dart';
import 'package:crud_firebase/features/crud/data/models/task_model.dart';

abstract class ReadTasksDataSource {
  Stream<List<TaskModel>> read();
}

class ReadTasksDataSourceImpl implements ReadTasksDataSource {
  final CollectionReference _reference;

  ReadTasksDataSourceImpl(this._reference);

  @override
  Stream<List<TaskModel>> read() {
    try {
      return _reference.snapshots().map((snapshot) => snapshot.docs
          .map((document) => TaskModel.fromJson(document))
          .toList());
    } catch (e) {
      throw ServerException();
    }
  }
}
