import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../cubit/dialog_cubit.dart';

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
                  const AutoSizeText(
                    "Novo Período",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  FormBuilder(
                    key: _formKey,
                    child: Column(
                      children: [
                        FormBuilderTextField(
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
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromRGBO(245, 246, 250, 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            horizontal: 8,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const AutoSizeText(
                                      "Termina",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 130,
                                      child: FormBuilderDateTimePicker(
                                        textAlign: TextAlign.center,
                                        name: 'end_date',
                                        inputType: InputType.date,
                                        format: DateFormat('d MMM yyyy'),
                                        decoration: InputDecoration(
                                          isDense: false,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            horizontal: 8,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const AutoSizeText(
                                      "Categoria",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 130,
                                      child: FormBuilderDropdown(
                                        name: 'category',
                                        decoration: InputDecoration(
                                          isDense: false,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            horizontal: 8,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                        ),
                                        items: [
                                          'Categoria 1',
                                          'Categoria 2',
                                          'Categoria 3'
                                        ]
                                            .map((category) => DropdownMenuItem(
                                                  value: category,
                                                  child: Text(category),
                                                ))
                                            .toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      name: 'meta1',
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        hintText: "Un",
                                        isDense: false,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          horizontal: 8,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const AutoSizeText(
                                    "Meta 2",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80,
                                    child: FormBuilderTextField(
                                      name: 'meta2',
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        hintText: "Un",
                                        isDense: false,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          horizontal: 8,
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  FilledButton(
                    onPressed: () {
                      dialogCubit.closeDialog();
                      Navigator.of(context).pop();
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Color.fromRGBO(15, 39, 139, 1),
                      ),
                    ),
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
