import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_firebase/features/crud/data/datasources/create_task_data_source.dart';
import 'package:crud_firebase/features/crud/data/datasources/delete_task_data_source.dart';
import 'package:crud_firebase/features/crud/data/datasources/read_tasks_data_source.dart';
import 'package:crud_firebase/features/crud/data/datasources/update_task_data_source.dart';
import 'package:crud_firebase/features/crud/data/repositories/create_task_repository_impl.dart';
import 'package:crud_firebase/features/crud/data/repositories/delete_task_repository_impl.dart';
import 'package:crud_firebase/features/crud/data/repositories/read_tasks_repository_impl.dart';
import 'package:crud_firebase/features/crud/data/repositories/update_task_repository_impl.dart';
import 'package:crud_firebase/features/crud/domain/repositories/create_task_repository.dart';
import 'package:crud_firebase/features/crud/domain/repositories/delete_task_repository.dart';
import 'package:crud_firebase/features/crud/domain/repositories/read_tasks_repository.dart';
import 'package:crud_firebase/features/crud/domain/repositories/update_task_repository.dart';
import 'package:crud_firebase/features/crud/domain/usecases/create_task.dart';
import 'package:crud_firebase/features/crud/domain/usecases/delete_task.dart';
import 'package:crud_firebase/features/crud/domain/usecases/read_tasks.dart';
import 'package:crud_firebase/features/crud/domain/usecases/update_task.dart';
import 'package:crud_firebase/features/crud/presentation/mobx/home/home_store.dart';
import 'package:crud_firebase/features/crud/presentation/mobx/register/register_store.dart';
import 'package:crud_firebase/features/crud/presentation/pages/home/home_page.dart';
import 'package:crud_firebase/features/crud/presentation/pages/launch/launch_page.dart';
import 'package:crud_firebase/features/crud/presentation/pages/register/register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        // External
        Bind((i) => FirebaseFirestore.instance),

        // DataSource
        Bind((i) => CreateTaskDataSourceImpl(i.get<FirebaseFirestore>())),
        Bind((i) => ReadTasksDataSourceImpl(i.get<FirebaseFirestore>())),
        Bind((i) => UpdateTaskDataSourceImpl(i.get<FirebaseFirestore>())),
        Bind((i) => DeleteTaskDataSourceImpl(i.get<FirebaseFirestore>())),

        // Repository
        Bind((i) => CreateTaskRepositoryImpl(i.get<CreateTaskDataSource>())),
        Bind((i) => ReadTasksRepositoryImpl(i.get<ReadTasksDataSource>())),
        Bind((i) => UpdateTaskRepositoryImpl(i.get<UpdateTaskDataSource>())),
        Bind((i) => DeleteTaskRepositoryImpl(i.get<DeleteTaskDataSource>())),

        // Use cases
        Bind((i) => CreateTask(i.get<CreateTaskRepository>())),
        Bind((i) => ReadTasks(i.get<ReadTasksRepository>())),
        Bind((i) => UpdateTask(i.get<UpdateTaskRepository>())),
        Bind((i) => DeleteTask(i.get<DeleteTaskRepository>())),

        // Store
        Bind(
          (i) => HomeStore(
            i.get<ReadTasks>(),
            i.get<UpdateTask>(),
            i.get<DeleteTask>(),
          ),
        ),
        Bind(
          (i) => RegisterStore(
            i.get<CreateTask>(),
            i.get<UpdateTask>(),
            i.get<DeleteTask>(),
          ),
        ),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, args) => const LaunchPage(),
      transition: TransitionType.rightToLeft,
    ),
    ChildRoute(
      '/home',
      child: (context, args) => const HomePage(),
      transition: TransitionType.rightToLeft,
    ),
    ChildRoute(
      '/register',
      child: (context, args) => RegisterPage(
        taskModel: args.data,
      ),
      transition: TransitionType.rightToLeft,
    ),
  ];
}
