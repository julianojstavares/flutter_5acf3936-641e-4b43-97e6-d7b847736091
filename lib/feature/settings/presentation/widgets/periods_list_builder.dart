import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/domain/entities/user_entity.dart';
import 'package:frontend/feature/settings/presentation/bloc/read_periods/read_periods_event.dart';
import 'package:frontend/feature/settings/presentation/widgets/period_list_widget.dart';

import '../../../../core/dependency_injection/service_locator.dart';
import '../bloc/read_periods/read_periods_bloc.dart';
import '../bloc/read_periods/read_periods_state.dart';

class PeriodsListBuilder extends StatefulWidget {
  const PeriodsListBuilder({super.key});

  @override
  State<PeriodsListBuilder> createState() => _PeriodsListBuilderState();
}

class _PeriodsListBuilderState extends State<PeriodsListBuilder> {
  final readPeriodsBloc = getIt.get<ReadPeriodsBloc>();
  final userID = getIt.get<UserEntity>(instanceName: "user").id;

  @override
  void initState() {
    super.initState();
    readPeriodsBloc.add(PeriodsReaded(userID: userID));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadPeriodsBloc, ReadPeriodsState>(
      bloc: readPeriodsBloc,
      builder: (context, state) => switch (state) {
        ReadPeriodsLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
        ReadPeriodsError() => Center(child: AutoSizeText(state.message)),
        ReadPeriodsSuccess() => PeriodListWidget(periods: state.periods),
      },
    );
  }
}
