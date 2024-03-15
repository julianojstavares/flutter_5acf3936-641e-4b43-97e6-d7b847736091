import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/feature/settings/presentation/cubit/dialog_cubit.dart';

import '../../controllers/submit_controller.dart';

class CreatePeriodButton extends StatelessWidget {
  const CreatePeriodButton({
    super.key,
    required GlobalKey<FormBuilderState> formKey,
    required this.dialogCubit,
  }) : _formKey = formKey;

  final GlobalKey<FormBuilderState> _formKey;
  final DialogCubit dialogCubit;
  @override
  Widget build(BuildContext context) {
    final submitController = SubmitController();

    return FilledButton(
      onPressed: () => submitController.createPeriod(
        _formKey,
        dialogCubit,
        context,
      ),
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          Color.fromRGBO(15, 39, 139, 1),
        ),
      ),
      child: const AutoSizeText("Concluir"),
    );
  }
}
