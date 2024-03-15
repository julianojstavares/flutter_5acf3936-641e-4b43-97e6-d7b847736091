import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/feature/settings/presentation/cubit/dialog_cubit.dart';
import 'package:frontend/feature/settings/presentation/widgets/period_popup/create_period_button.dart';
import 'package:frontend/feature/settings/presentation/widgets/period_popup/edit_period_button.dart';
import 'package:frontend/feature/settings/presentation/widgets/period_popup/exclude_period_button.dart';

import '../../cubit/period_popup_cubit/period_popup_cubit.dart';
import '../../cubit/period_popup_cubit/period_popup_state.dart';

class FooterPeriodPopUp extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  final DialogCubit dialogCubit;
  final PeriodPopUpCubit periodPopUpCubit;

  const FooterPeriodPopUp({
    super.key,
    required this.formKey,
    required this.dialogCubit,
    required this.periodPopUpCubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PeriodPopUpCubit, PeriodPopUpState>(
      bloc: periodPopUpCubit,
      builder: (context, state) => switch (state) {
        CreatePeriodPopUpState() => CreatePeriodButton(
            formKey: formKey,
            dialogCubit: dialogCubit,
          ),
        EditPeriodPopUpState() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ExcludePeriodButton(
                formKey: formKey,
                dialogCubit: dialogCubit,
              ),
              EditPeriodButton(
                formKey: formKey,
                dialogCubit: dialogCubit,
              ),
            ],
          ),
      },
    );
  }
}
