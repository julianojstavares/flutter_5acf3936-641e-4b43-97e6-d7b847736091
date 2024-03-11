import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:frontend/feature/settings/presentation/cubit/dialog_cubit.dart';

class PeriodPopUp extends StatelessWidget {
  final DialogCubit dialogCubit;

  const PeriodPopUp({
    super.key,
    required this.dialogCubit,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const AutoSizeText("Novo Período"),
              FilledButton(
                onPressed: () {
                  dialogCubit.closeDialog();
                  Navigator.of(context).pop();
                },
                child: const AutoSizeText("Concluir"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
