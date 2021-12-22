import 'package:crud_firebase/core/utils/app_colors.dart';
import 'package:crud_firebase/core/utils/app_texts.dart';
import 'package:crud_firebase/core/utils/date_formatter.dart';
import 'package:crud_firebase/features/crud/data/models/task_model.dart';
import 'package:crud_firebase/features/crud/presentation/mobx/register/register_store.dart';
import 'package:crud_firebase/features/crud/presentation/widgets/register/app_bar_widget.dart';
import 'package:crud_firebase/features/crud/presentation/widgets/register/date_widget.dart';
import 'package:crud_firebase/features/crud/presentation/widgets/register/fab_widget.dart';
import 'package:crud_firebase/features/crud/presentation/widgets/register/header_widget.dart';
import 'package:crud_firebase/features/crud/presentation/widgets/register/text_form_field_widget.dart';
import 'package:crud_firebase/features/crud/presentation/widgets/register/time_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterPage extends StatefulWidget {
  final TaskModel? taskModel;
  const RegisterPage({
    Key? key,
    this.taskModel,
  }) : super(key: key);

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends ModularState<RegisterPage, RegisterStore> {
  TaskModel? _taskModel;
  final _formKey = GlobalKey<FormState>();
  final _dateFormatter = DateFormatter();

  @override
  void initState() {
    _taskModel = widget.taskModel ?? TaskModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        child: AppBarWidget(
          uid: _taskModel!.uid,
        ),
        preferredSize: const Size.fromHeight(56),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FabButtonWidget(
        label: AppTexts.saveButton,
        labelColor: AppColors.white,
        icon: Icons.save,
        iconColor: AppColors.white,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            store.save(taskModel: _taskModel!);
            Modular.to.pop();
          }
        },
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: store.autovalidateMode,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderWidget(taskModel: _taskModel),
                    const SizedBox(height: 20),
                    TextFormFieldWidget(
                      icon: Icons.title_outlined,
                      label: AppTexts.formTitleEX,
                      initialValue: _taskModel!.name,
                      validator: store.validateTaskName,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      onChanged: (value) {
                        _taskModel!.name = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    DateWidget(
                      date: _taskModel!.date,
                      onPressed: () async {
                        DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2030),
                          builder: (context, child) {
                            return Theme(
                              data: ThemeData.light().copyWith(
                                colorScheme: const ColorScheme.light(
                                  primary: AppColors.blue900,
                                ),
                                buttonTheme: const ButtonThemeData(
                                  textTheme: ButtonTextTheme.primary,
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );
                        if (picked != null) {
                          var date = _dateFormatter.formatDateTime(
                            dateTime: picked,
                          );
                          setState(() {
                            _taskModel!.date = date;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    TimeWidget(
                      time: _taskModel!.time,
                      onPressed: () async {
                        TimeOfDay? picked = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                          builder: (context, child) {
                            return Theme(
                              data: ThemeData.light().copyWith(
                                colorScheme: const ColorScheme.light(
                                  primary: AppColors.blue900,
                                ),
                                buttonTheme: const ButtonThemeData(
                                  textTheme: ButtonTextTheme.primary,
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );
                        if (picked != null) {
                          var time = _dateFormatter.formatTimeOfDay(
                            timeOfDay: picked,
                          );
                          setState(() {
                            _taskModel!.time = time;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
