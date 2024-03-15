import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/domain/entities/period_entity.dart';
import 'package:intl/intl.dart';

class ListItem extends StatelessWidget {
  final PeriodEntity period;

  const ListItem({
    super.key,
    required this.period,
  });

  @override
  Widget build(BuildContext context) {
    final title = period.title;
    final datePattern = DateFormat('dd/MM/yy');
    final startDate = datePattern.format(period.startDate);
    final endDate = datePattern.format(period.endDate);

    return FilledButton(
      style: const ButtonStyle(
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 15),
        ),
        backgroundColor: MaterialStatePropertyAll(Colors.white),
        foregroundColor: MaterialStatePropertyAll(Colors.black),
        overlayColor: MaterialStatePropertyAll(Colors.blue),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ),
      onPressed: () {
        log(name: "ListItem", period.id);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          Row(
            children: [
              AutoSizeText(
                startDate,
                style: const TextStyle(fontSize: 11),
              ),
              const AutoSizeText(
                " a ",
                style: TextStyle(fontSize: 11),
              ),
              AutoSizeText(
                endDate,
                style: const TextStyle(fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
