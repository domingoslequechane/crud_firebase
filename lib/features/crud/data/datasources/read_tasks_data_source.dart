import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_firebase/core/error/exceptions.dart';
import 'package:crud_firebase/features/crud/data/models/task_model.dart';

abstract class ReadTasksDataSource {
  Stream<List<TaskModel>> read();
}

class ReadTasksDataSourceImpl implements ReadTasksDataSource {
  final FirebaseFirestore _instance;

  ReadTasksDataSourceImpl(this._instance);

  @override
  Stream<List<TaskModel>> read() {
    try {
      return _instance.collection('todos').snapshots().map((snapshot) =>
          snapshot.docs
              .map((document) => TaskModel.fromJson(document))
              .toList());
    } catch (e) {
      throw ServerException();
    }
  }
}
