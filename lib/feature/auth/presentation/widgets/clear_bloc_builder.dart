import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/dependency_injection/service_locator.dart';
import 'package:frontend/feature/auth/presentation/bloc/clear_data/clear_data_bloc.dart';
import 'package:frontend/feature/auth/presentation/bloc/clear_data/clear_data_state.dart';

import '../bloc/clear_data/clear_data_event.dart';

class ClearBlocBuilder extends StatelessWidget {
  const ClearBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final clearDataBloc = getIt.get<ClearDataBloc>();

    return BlocConsumer<ClearDataBloc, ClearDataState>(
      bloc: clearDataBloc,
      listener: (context, state) {
        if (state is ClearDataError) {
          final snackBar = SnackBar(
            content: AutoSizeText(
              state.message,
            ),
            duration: const Duration(seconds: 3),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is ClearDataSuccess) {
          final snackBar = SnackBar(
            content: AutoSizeText(state.message),
            duration: const Duration(seconds: 3),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) => switch (state) {
        ClearDataInitial() => FilledButton(
            onPressed: () => clearDataBloc.add(
              ClearDataFinished(),
            ),
            child: const AutoSizeText("Limpar banco de dados"),
          ),
        ClearDataLoading() => const Center(child: LinearProgressIndicator()),
        ClearDataError() => const SizedBox.shrink(),
        ClearDataSuccess() => const SizedBox.shrink(),
      },
    );
  }
}
