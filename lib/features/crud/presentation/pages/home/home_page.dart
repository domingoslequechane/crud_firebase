import 'package:crud_firebase/features/crud/data/models/task_model.dart';
import 'package:crud_firebase/features/crud/presentation/mobx/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Observer(builder: (_) {
        List<TaskModel>? listOfTasks = store.listOfTasks!.data;
        dynamic error = store.listOfTasks?.error;

        if (error != null) {
          return Center(child: Text(error));
        }

        if (listOfTasks == null) {
          return const Center(child: CircularProgressIndicator());
        }

        if (listOfTasks.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: listOfTasks.length,
          itemBuilder: (context, index) {
            TaskModel _taskModel = listOfTasks[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: ListTile(
                leading: IconButton(
                  icon: _taskModel.isCompleted!
                      ? const Icon(Icons.check_circle)
                      : const Icon(Icons.check_circle_outline),
                  onPressed: () {
                    TaskModel _newTaskModel = _taskModel.copyWith(
                      isCompleted: !_taskModel.isCompleted!,
                    );
                    store.update(taskModel: _newTaskModel);
                  },
                ),
                title: Text(_taskModel.name!),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_forever_outlined),
                  onPressed: () => store.delete(taskModel: _taskModel),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
