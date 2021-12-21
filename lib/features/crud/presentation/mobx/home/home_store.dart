import 'package:crud_firebase/features/crud/data/models/task_model.dart';
import 'package:crud_firebase/features/crud/domain/usecases/delete_task.dart';
import 'package:crud_firebase/features/crud/domain/usecases/read_tasks.dart';
import 'package:crud_firebase/features/crud/domain/usecases/update_task.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final ReadTasks _readUseCase;
  final UpdateTask _updateUseCase;
  final DeleteTask _deleteUseCase;

  _HomeStoreBase(
    this._readUseCase,
    this._updateUseCase,
    this._deleteUseCase,
  ) {
    read();
  }
  @observable
  ObservableStream<List<TaskModel>>? listOfTasks;

  Future<void> read() async {
    listOfTasks = _readUseCase.read().asObservable();
  }

  Future<void> update({required TaskModel taskModel}) async {
    return _updateUseCase.update(taskModel: taskModel);
  }

  Future<void> delete({required TaskModel taskModel}) async {
    return _deleteUseCase.delete(taskModel: taskModel);
  }
}
