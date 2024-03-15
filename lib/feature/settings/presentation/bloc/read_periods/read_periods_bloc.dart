import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/domain/entities/period_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_cases/read_periods_use_case.dart';
import 'read_periods_event.dart';
import 'read_periods_state.dart';

@lazySingleton
class ReadPeriodsBloc extends Bloc<ReadPeriodsEvent, ReadPeriodsState> {
  final ReadPeriodsUseCase _readPeriodsUseCase;

  ReadPeriodsBloc({required ReadPeriodsUseCase readPeriodsUseCase})
      : _readPeriodsUseCase = readPeriodsUseCase,
        super(ReadPeriodInitial()) {
    on<PeriodsReaded>(_onPeriodsReaded);
  }

  void _onPeriodsReaded(
    PeriodsReaded event,
    Emitter<ReadPeriodsState> emit,
  ) async {
    emit(ReadPeriodLoading());

    final List<PeriodEntity> periods;

    try {
      periods = await _readPeriodsUseCase.call(userID: event.userID);
    } catch (e) {
      emit(ReadPeriodError(message: "$e"));
      return;
    }

    emit(ReadPeriodSuccess(periods: periods));
  }
}
