import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/core/domain/entities/period_entity.dart';
import 'package:frontend/feature/settings/presentation/bloc/update_period/update_period_bloc.dart';
import 'package:frontend/feature/settings/presentation/bloc/update_period/update_period_event.dart';
import 'package:frontend/feature/settings/presentation/cubit/dialog_cubit.dart';

import '../../../../core/dependency_injection/service_locator.dart';
import '../../../../core/domain/entities/user_entity.dart';
import '../bloc/create_period/create_period_bloc.dart';
import '../bloc/create_period/create_period_event.dart';
import '../bloc/read_periods/read_periods_bloc.dart';
import '../bloc/read_periods/read_periods_event.dart';

class SubmitController {
  void createPeriod(
    GlobalKey<FormBuilderState> formKey,
    DialogCubit dialogCubit,
    BuildContext context,
  ) {
    bool? isFormValid = formKey.currentState?.validate();

    if (isFormValid!) {
      log(name: "createPeriod", formKey.currentState!.instantValue.toString());
      formKey.currentState!.save();
      final periodObj = formKey.currentState!.value;

      final userID = getIt.get<UserEntity>(instanceName: "user").id;

      final stringGoal1 = (periodObj["goal1"] as String).replaceAll(',', '.');

      final stringGoal2 = (periodObj["goal1"] as String).replaceAll(',', '.');

      final goal1 = double.parse(stringGoal1);
      final goal2 = double.parse(stringGoal2);

      getIt.get<CreatePeriodBloc>().add(
            CreatePeriodSucceeded(
              userID: userID,
              title: periodObj["title"],
              startDate: periodObj["start_date"],
              endDate: periodObj["end_date"],
              category: periodObj["category"],
              goal1: goal1,
              goal2: goal2,
            ),
          );

      getIt.get<ReadPeriodsBloc>().add(
            PeriodsReaded(userID: userID),
          );

      dialogCubit.closeDialog(context);
    }
  }

  void editPeriod(
    GlobalKey<FormBuilderState> formKey,
    DialogCubit dialogCubit,
    BuildContext context,
    String periodID,
  ) {
    bool? isFormValid = formKey.currentState?.validate();

    if (isFormValid!) {
      log(name: "createPeriod", formKey.currentState!.instantValue.toString());
      formKey.currentState!.save();
      final periodObj = formKey.currentState!.value;

      final userID = getIt.get<UserEntity>(instanceName: "user").id;
      final id = periodID;
      final title = periodObj["title"];
      final startDate = periodObj["start_date"];
      final endDate = periodObj["end_date"];
      final category = periodObj["category"];
      final stringGoal1 = (periodObj["goal1"] as String).replaceAll(',', '.');
      final stringGoal2 = (periodObj["goal1"] as String).replaceAll(',', '.');
      final goal1 = double.parse(stringGoal1);
      final goal2 = double.parse(stringGoal2);

      final editedPeriod = PeriodEntity(
        id,
        userID,
        title,
        startDate,
        endDate,
        category,
        goal1,
        goal2,
      );

      getIt.get<UpdatePeriodBloc>().add(
            PeriodUpdated(periodUpdated: editedPeriod),
          );

      getIt.get<ReadPeriodsBloc>().add(
            PeriodsReaded(userID: userID),
          );

      dialogCubit.closeDialog(context);
    }
  }
}
