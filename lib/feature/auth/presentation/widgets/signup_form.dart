import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../cubit/view_cubit.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            FormBuilderTextField(
              name: 'username',
              decoration: const InputDecoration(labelText: 'Usuário'),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
            FormBuilderTextField(
              name: 'email',
              decoration: const InputDecoration(labelText: 'E-mail'),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.email(),
                FormBuilderValidators.required(),
              ]),
            ),
            FormBuilderTextField(
              name: 'password',
              decoration: const InputDecoration(labelText: 'Senha'),
              obscureText: true,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
            FormBuilderTextField(
              name: 'confirmPassword',
              decoration: const InputDecoration(labelText: 'Confirme a senha'),
              obscureText: true,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                (val) {
                  if (val != _formKey.currentState!.fields['password']?.value) {
                    return 'As senhas não são iguais';
                  }
                  return null;
                },
              ]),
            ),
            const SizedBox(height: 10),
            FilledButton(
              onPressed: () {
                bool? isFormValid = _formKey.currentState?.validate();

                if (isFormValid!) {
                  log(_formKey.currentState!.instantValue.toString());
                }
              },
              child: const AutoSizeText("Criar"),
            ),
            FilledButton(
              onPressed: () => context.read<ViewCubit>().initial(),
              child: const AutoSizeText("Voltar"),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
