import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

class StartDateFieldPeriodForm extends StatelessWidget {
  const StartDateFieldPeriodForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const AutoSizeText(
          "Começa",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          width: 130,
          child: FormBuilderDateTimePicker(
            textAlign: TextAlign.center,
            name: 'start_date',
            inputType: InputType.date,
            format: DateFormat('d MMM yyyy'),
            decoration: InputDecoration(
              isDense: false,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
          ),
        ),
      ],
    );
  }
}
