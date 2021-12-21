import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_firebase/core/error/exceptions.dart';
import 'package:crud_firebase/features/crud/data/models/task_model.dart';

abstract class DeleteTaskDataSource {
  Future<void> delete({required TaskModel taskModel});
}

class DeleteTaskDataSourceImpl implements DeleteTaskDataSource {
  final FirebaseFirestore _instance;

  DeleteTaskDataSourceImpl(this._instance);

  @override
  Future<void> delete({required TaskModel taskModel}) {
    if (taskModel.uid != null) {
      return _instance.collection('todos').doc(taskModel.uid).delete();
    } else {
      throw ServerException();
    }
  }
}
