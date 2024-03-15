import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class Goal1FieldPeriodForm extends StatelessWidget {
  const Goal1FieldPeriodForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const AutoSizeText(
          "Meta 1",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          width: 80,
          child: FormBuilderTextField(
            name: 'goal1',
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: "Un",
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
            keyboardType: TextInputType.number,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
          ),
        ),
      ],
    );
  }
}