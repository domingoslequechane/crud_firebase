import 'package:crud_firebase/features/crud/data/models/task_model.dart';
import 'package:crud_firebase/features/crud/domain/usecases/create_task.dart';
import 'package:crud_firebase/features/crud/domain/usecases/delete_task.dart';
import 'package:crud_firebase/features/crud/domain/usecases/update_task.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  final CreateTask createUseCase;
  final UpdateTask updateUseCase;
  final DeleteTask deleteUseCase;

  _RegisterStoreBase(
    this.createUseCase,
    this.updateUseCase,
    this.deleteUseCase,
  );

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? validateTaskName(String? value) {
    if (value!.length <= 3) {
      autovalidateMode = AutovalidateMode.always;
      return 'Cannot be empty or shorter than 3 caracters.';
    } else {
      return null;
    }
  }

  void save({required TaskModel taskModel}) {
    if (taskModel.uid == null) {
      createUseCase.create(taskModel: taskModel);
    } else {
      updateUseCase.update(taskModel: taskModel);
    }
  }

  Future<void> delete({required TaskModel taskModel}) async =>
      deleteUseCase.delete(taskModel: taskModel);
}
