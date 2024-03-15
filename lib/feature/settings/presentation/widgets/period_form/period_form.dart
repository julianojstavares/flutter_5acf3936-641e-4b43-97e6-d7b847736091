import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../core/domain/entities/period_entity.dart';
import '../../controllers/period_form_controller.dart';
import 'category_field_period_form.dart';
import 'enddate_field_period_form.dart';
import 'goal1_field_period_form.dart';
import 'goal2_field_period_form.dart';
import 'startdate_field_period_form.dart';
import 'title_field_period_form.dart';

class PeriodForm extends StatefulWidget {
  const PeriodForm({
    super.key,
    required GlobalKey<FormBuilderState> formKey,
    this.period,
  }) : _formKey = formKey;

  final GlobalKey<FormBuilderState> _formKey;
  final PeriodEntity? period;

  @override
  State<PeriodForm> createState() => _PeriodFormState();
}

class _PeriodFormState extends State<PeriodForm> {
  final periodFormController = PeriodFormController();

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () => periodFormController.fill(
        formKey: widget._formKey,
        period: widget.period,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: widget._formKey,
      child: Column(
        children: [
          const TitleFieldPeriodForm(),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromRGBO(245, 246, 250, 1),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  StartDateFieldPeriodForm(),
                  Divider(),
                  EndDateFieldPeriodForm(),
                  Divider(),
                  CategoryFieldPeriodForm(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Goal1FieldPeriodForm(),
                SizedBox(height: 10),
                Goal2FieldPeriodForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
