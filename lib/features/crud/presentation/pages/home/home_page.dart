import 'package:crud_firebase/core/utils/app_colors.dart';
import 'package:crud_firebase/features/crud/data/models/task_model.dart';
import 'package:crud_firebase/features/crud/presentation/mobx/home/home_store.dart';
import 'package:crud_firebase/features/crud/presentation/widgets/home/app_bar_widget.dart';
import 'package:crud_firebase/features/crud/presentation/widgets/home/empty_list_widget.dart';
import 'package:crud_firebase/features/crud/presentation/widgets/home/error_list_widget.dart';
import 'package:crud_firebase/features/crud/presentation/widgets/home/fab_widget.dart';
import 'package:crud_firebase/features/crud/presentation/widgets/home/list_item_widget.dart';
import 'package:crud_firebase/features/crud/presentation/widgets/home/loading_list_widget.dart';
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
      backgroundColor: AppColors.white,
      appBar: const PreferredSize(
        child: AppBarWidget(),
        preferredSize: Size.fromHeight(56),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FabWidget(
        isMini: true,
        iconData: Icons.add,
        onPressed: () {
          Modular.to.pushNamed('/register');
        },
      ),
      body: Observer(builder: (_) {
        List<TaskModel>? listOfTasks = store.listOfTasks!.data;
        dynamic error = store.listOfTasks?.error;

        if (error != null) {
          return ErrorListWidget(error: error);
        }

        if (listOfTasks == null) {
          return const LoadingListWidget();
        }

        if (listOfTasks.isEmpty) {
          return const EmptyListWidget();
        }

        return _buildList(
          listOfTasks: listOfTasks,
          store: store,
        );
      }),
    );
  }
}

Widget _buildList({
  required List<TaskModel>? listOfTasks,
  required HomeStore store,
}) {
  return ListView.builder(
    itemCount: listOfTasks!.length,
    itemBuilder: (context, index) {
      TaskModel _taskModel = listOfTasks[index];
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Card(
          child: ListItemWidget(
            taskModel: _taskModel,
            onPressedCompleteTask: () {
              TaskModel newTaskModel = _taskModel.copyWith(
                isCompleted: !_taskModel.isCompleted!,
              );
              store.update(taskModel: newTaskModel);
            },
            onDismissed: (_) {
              store.delete(taskModel: _taskModel);
            },
            onTap: () {
              Modular.to.pushNamed('/register', arguments: _taskModel);
            },
          ),
        ),
      );
    },
  );
}
