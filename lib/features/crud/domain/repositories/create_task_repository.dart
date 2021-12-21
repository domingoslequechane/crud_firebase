import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_firebase/features/crud/data/models/task_model.dart';

abstract class CreateTaskRepository {
  Future<DocumentReference> create({required TaskModel taskModel});
}
