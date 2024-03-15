import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../cubit/dialog_cubit.dart';

class EditPeriodButton extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  final DialogCubit dialogCubit;

  const EditPeriodButton({
    super.key,
    required this.formKey,
    required this.dialogCubit,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      child: const AutoSizeText("Editar"),
    );
  }
}
