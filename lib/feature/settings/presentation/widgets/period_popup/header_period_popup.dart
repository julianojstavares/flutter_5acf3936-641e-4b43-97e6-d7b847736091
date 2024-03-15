import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/period_popup_cubit/period_popup_cubit.dart';
import '../../cubit/period_popup_cubit/period_popup_state.dart';
import 'period_popup.dart';

class HeaderPeriodPopUp extends StatelessWidget {
  const HeaderPeriodPopUp({
    super.key,
    required this.widget,
  });

  final PeriodPopUp widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const IconButton(
          onPressed: null,
          icon: Icon(Icons.close),
          disabledColor: Color.fromRGBO(255, 255, 255, 0),
        ),
        BlocBuilder<PeriodPopUpCubit, PeriodPopUpState>(
          bloc: widget.periodPopUpCubit,
          builder: (context, state) => switch (state) {
            CreatePeriodPopUpState() => const AutoSizeText(
                "Novo Período",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            EditPeriodPopUpState() => const AutoSizeText(
                "Editar Período",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
          },
        ),
        IconButton(
          onPressed: () => widget.dialogCubit.closeDialog(context),
          icon: const Icon(Icons.close),
        ),
      ],
    );
  }
}
