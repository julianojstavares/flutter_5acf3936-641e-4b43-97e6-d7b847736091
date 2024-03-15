import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/domain/entities/period_entity.dart';
import 'list_item.dart';

class PeriodListWidget extends StatelessWidget {
  final List<PeriodEntity> periods;

  const PeriodListWidget({
    super.key,
    required this.periods,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: periods.isNotEmpty,
      replacement: const Center(
        child: AutoSizeText(
          "Não há períodos cadastrados",
        ),
      ),
      child: ListView.builder(
        itemCount: periods.length,
        itemBuilder: (context, index) {
          final item = periods[index];
          final title = item.title;

          final datePattern = DateFormat('dd/MM/yy');

          final startDate = datePattern.format(item.startDate);
          final endDate = datePattern.format(item.endDate);

          return ListItem(
            title: title,
            startDate: startDate,
            endDate: endDate,
          );
        },
      ),
    );
  }
}
