import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../core/dependency_injection/service_locator.dart';
import '../../bloc/update_period/update_period_bloc.dart';
import '../../bloc/update_period/update_period_state.dart';
import '../../controllers/submit_controller.dart';
import '../../cubit/dialog_cubit.dart';

class EditPeriodButton extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  final DialogCubit dialogCubit;
  final String periodID;

  const EditPeriodButton({
    super.key,
    required this.formKey,
    required this.dialogCubit,
    required this.periodID,
  });

  @override
  Widget build(BuildContext context) {
    final updatePeriodBloc = getIt.get<UpdatePeriodBloc>();
    final submitController = SubmitController();

    return BlocConsumer<UpdatePeriodBloc, UpdatePeriodState>(
      bloc: updatePeriodBloc,
      listener: (context, state) {
        if (state is UpdatePeriodError) {
          const snackBar = SnackBar(
            content: AutoSizeText("Editar período"),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) => switch (state) {
        UpdatePeriodInitial() => FilledButton(
            onPressed: () => submitController.editPeriod(
              formKey,
              dialogCubit,
              context,
              periodID,
            ),
            child: const AutoSizeText("Editar"),
          ),
        UpdatePeriodLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
        UpdatePeriodError() => const SizedBox.shrink(),
        UpdatePeriodSuccess() => const SizedBox.shrink()
      },
    );
  }
}
