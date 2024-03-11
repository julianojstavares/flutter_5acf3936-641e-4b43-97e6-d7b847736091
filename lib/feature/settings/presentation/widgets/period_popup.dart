import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/feature/settings/presentation/cubit/dialog_cubit.dart';
import 'package:intl/intl.dart';

final _formKey = GlobalKey<FormBuilderState>();

class PeriodPopUp extends StatelessWidget {
  final DialogCubit dialogCubit;

  const PeriodPopUp({
    super.key,
    required this.dialogCubit,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Material(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const AutoSizeText("Novo Período"),
                  FormBuilder(
                    key: _formKey,
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          name: 'title',
                          decoration:
                              const InputDecoration(labelText: 'Título'),
                        ),
                        FormBuilderDateTimePicker(
                          name: 'start_date',
                          format: DateFormat('d MMM yyyy'),
                          decoration:
                              const InputDecoration(labelText: 'Data Inicial'),
                        ),
                        FormBuilderDateTimePicker(
                          name: 'end_date',
                          format: DateFormat('d MMM yyyy'),
                          decoration:
                              const InputDecoration(labelText: 'Data Final'),
                        ),
                        FormBuilderDropdown(
                          name: 'category',
                          decoration:
                              const InputDecoration(labelText: 'Categoria'),
                          items: ['Categoria 1', 'Categoria 2', 'Categoria 3']
                              .map((category) => DropdownMenuItem(
                                    value: category,
                                    child: Text(category),
                                  ))
                              .toList(),
                        ),
                        FormBuilderTextField(
                          name: 'meta1',
                          decoration: const InputDecoration(
                              labelText: 'Meta 1', hintText: 'Número'),
                          keyboardType: TextInputType.number,
                        ),
                        FormBuilderTextField(
                          name: 'meta2',
                          decoration: const InputDecoration(
                              labelText: 'Meta 2', hintText: 'Número'),
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  FilledButton(
                    onPressed: () {
                      // Adicione aqui a lógica para salvar os dados do formulário
                      dialogCubit.closeDialog();
                      Navigator.of(context).pop();
                    },
                    child: const AutoSizeText("Concluir"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
