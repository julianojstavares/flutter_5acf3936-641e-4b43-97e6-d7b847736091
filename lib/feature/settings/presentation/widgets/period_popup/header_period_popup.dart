import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

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
        const AutoSizeText(
          "Novo Período",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        IconButton(
          onPressed: () => widget.dialogCubit.closeDialog(context),
          icon: const Icon(Icons.close),
        ),
      ],
    );
  }
}
