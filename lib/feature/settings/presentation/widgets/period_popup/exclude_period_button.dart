import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/core/domain/entities/period_entity.dart';
import 'package:frontend/core/domain/entities/user_entity.dart';
import 'package:frontend/feature/settings/presentation/bloc/delete_period/delete_period_event.dart';
import 'package:frontend/feature/settings/presentation/bloc/read_periods/read_periods_bloc.dart';
import 'package:frontend/feature/settings/presentation/bloc/read_periods/read_periods_event.dart';

import '../../../../../core/dependency_injection/service_locator.dart';
import '../../bloc/delete_period/delete_period_bloc.dart';
import '../../bloc/delete_period/delete_period_state.dart';
import '../../cubit/dialog_cubit.dart';

class ExcludePeriodButton extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  final DialogCubit dialogCubit;
  final PeriodEntity period;

  const ExcludePeriodButton({
    super.key,
    required this.formKey,
    required this.dialogCubit,
    required this.period,
  });

  @override
  Widget build(BuildContext context) {
    final deletePeriodBloc = getIt.get<DeletePeriodBloc>();

    return BlocConsumer<DeletePeriodBloc, DeletePeriodState>(
      bloc: deletePeriodBloc,
      listener: (context, state) {
        if (state is DeletePeriodError) {
          const snackBar = SnackBar(
            content: AutoSizeText("Excluir período"),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }

        if (state is DeletePeriodSuccess) {
          dialogCubit.closeDialog(context);
          final userID = getIt.get<UserEntity>(instanceName: "user").id;
          getIt.get<ReadPeriodsBloc>().add(PeriodsReaded(userID: userID));
        }
      },
      builder: (context, state) => switch (state) {
        DeletePeriodInitial() => FilledButton(
            onPressed: () => deletePeriodBloc.add(
              PeriodDeleted(periodID: period.id),
            ),
            child: const AutoSizeText("Excluir"),
          ),
        DeletePeriodLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
        DeletePeriodError() => const SizedBox.shrink(),
        DeletePeriodSuccess() => const SizedBox.shrink()
      },
    );
  }
}
