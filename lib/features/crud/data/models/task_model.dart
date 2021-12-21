import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_firebase/features/crud/domain/entities/task.dart';

class TaskModel extends Task {
  TaskModel({
    String? uid,
    final String? name,
    final bool? isCompleted,
    final String? date,
    final String? time,
  }) : super(
          uid: uid,
          name: name,
          isCompleted: isCompleted ?? false,
          date: date,
          time: time,
        );

  factory TaskModel.fromJson(DocumentSnapshot snapshot) {
    return TaskModel(
      uid: snapshot.id,
      name: snapshot.get('name'),
      isCompleted: snapshot.get('isCompleted') ?? false,
      date: snapshot.get('date'),
      time: snapshot.get('time'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'isCompleted': isCompleted,
      'date': date,
      'time': time,
    };
  }

  TaskModel copyWith({
    String? uid,
    String? name,
    bool? isCompleted,
    String? date,
    String? time,
  }) =>
      TaskModel(
        uid: uid ?? this.uid,
        name: name ?? this.name,
        isCompleted: isCompleted ?? this.isCompleted,
        date: date ?? this.date,
        time: time ?? this.time,
      );
}
