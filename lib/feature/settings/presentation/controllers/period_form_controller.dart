import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/core/domain/entities/period_entity.dart';

class PeriodFormController {
  void fill({
    required PeriodEntity? period,
    required GlobalKey<FormBuilderState> formKey,
  }) {
    log(name: "PeriodFormController", "Period: $period");

    if (period == null) return;

    if (formKey.currentState != null) {
      formKey.currentState?.patchValue({
        "title": period.title,
        "start_date": period.startDate,
        "end_date": period.endDate,
        "category": period.category,
        "goal1": "${period.goal1}",
        "goal2": "${period.goal2}",
      });
    }
  }
}
