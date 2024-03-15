import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

class PeriodForm extends StatelessWidget {
  const PeriodForm({
    super.key,
    required GlobalKey<FormBuilderState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormBuilderState> _formKey;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          FormBuilderTextField(
            name: 'title',
            style:
                const TextStyle(fontWeight: FontWeight.bold),
            decoration: const InputDecoration(
              hintText: "Nomeie seu período",
              isDense: false,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 8),
              filled: true,
              fillColor: Color.fromRGBO(245, 246, 250, 1),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
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
                          validator:
                              FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
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
                          validator:
                              FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
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
                              .map((category) =>
                                  DropdownMenuItem(
                                    value: category,
                                    child: Text(category),
                                  ))
                              .toList(),
                          validator:
                              FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
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
            padding:
                const EdgeInsets.symmetric(horizontal: 8),
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
                        name: 'goal1',
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
                        validator:
                            FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
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
                        name: 'goal2',
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
                        validator:
                            FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}