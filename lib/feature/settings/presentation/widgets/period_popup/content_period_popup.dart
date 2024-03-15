import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/feature/settings/presentation/widgets/period_form/period_form.dart';

import '../../cubit/period_popup_cubit/period_popup_cubit.dart';
import '../../cubit/period_popup_cubit/period_popup_state.dart';

class ContentPeriodPopUp extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  final PeriodPopUpCubit periodPopUpCubit;

  const ContentPeriodPopUp({
    super.key,
    required this.formKey, required this.periodPopUpCubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PeriodPopUpCubit, PeriodPopUpState>(
      bloc: periodPopUpCubit,
      builder: (context, state) => switch (state) {
        CreatePeriodPopUpState() => PeriodForm(formKey: formKey),
        EditPeriodPopUpState() => PeriodForm(
            formKey: formKey,
            period: state.period,
          ),
      },
    );
  }
}
