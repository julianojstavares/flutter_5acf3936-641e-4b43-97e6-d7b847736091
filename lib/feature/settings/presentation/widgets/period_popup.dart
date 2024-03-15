import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../core/dependency_injection/service_locator.dart';
import '../../../../core/domain/entities/user_entity.dart';
import '../bloc/create_period/create_period_bloc.dart';
import '../bloc/create_period/create_period_event.dart';
import '../bloc/read_periods/read_periods_bloc.dart';
import '../bloc/read_periods/read_periods_event.dart';
import '../cubit/dialog_cubit.dart';
import 'period_form.dart';

class PeriodPopUp extends StatefulWidget {
  final DialogCubit dialogCubit;

  const PeriodPopUp({
    super.key,
    required this.dialogCubit,
  });

  @override
  State<PeriodPopUp> createState() => _PeriodPopUpState();
}

class _PeriodPopUpState extends State<PeriodPopUp> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Material(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const IconButton(
                            onPressed: null,
                            icon: Icon(Icons.close),
                            disabledColor: Color.fromRGBO(255, 255, 255, 0),
                          ),
                          const AutoSizeText(
                            "Novo Período",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              widget.dialogCubit.closeDialog(context);
                            },
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      PeriodForm(formKey: _formKey),
                      const SizedBox(height: 20),
                      FilledButton(
                        onPressed: () {
                          bool? isFormValid = _formKey.currentState?.validate();

                          if (isFormValid!) {
                            log(_formKey.currentState!.instantValue.toString());
                            _formKey.currentState!.save();
                            final periodObj = _formKey.currentState!.value;

                            final userID =
                                getIt.get<UserEntity>(instanceName: "user").id;

                            final stringGoal1 = (periodObj["goal1"] as String)
                                .replaceAll(',', '.');

                            final stringGoal2 = (periodObj["goal1"] as String)
                                .replaceAll(',', '.');

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
                            widget.dialogCubit.closeDialog(context);
                          }
                        },
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(15, 39, 139, 1),
                          ),
                        ),
                        child: const AutoSizeText("Concluir"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
