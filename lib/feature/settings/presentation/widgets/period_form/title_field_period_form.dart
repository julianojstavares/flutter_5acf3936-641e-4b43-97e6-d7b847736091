import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class TitleFieldPeriodForm extends StatelessWidget {
  const TitleFieldPeriodForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: 'title',
      style: const TextStyle(fontWeight: FontWeight.bold),
      decoration: const InputDecoration(
        hintText: "Nomeie seu período",
        isDense: false,
        contentPadding: EdgeInsets.symmetric(horizontal: 8),
        filled: true,
        fillColor: Color.fromRGBO(245, 246, 250, 1),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
    );
  }
}