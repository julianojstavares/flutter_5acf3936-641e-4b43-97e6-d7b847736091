import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/domain/entities/period_entity.dart';
import '../../../domain/use_cases/read_one_period_use_case.dart';
import 'read_one_period_event.dart';
import 'read_one_period_state.dart';

@lazySingleton
class ReadOnePeriodBloc extends Bloc<ReadOnePeriodEvent, ReadOnePeriodState> {
  final ReadOnePeriodUseCase _readOnePeriodUseCase;

  ReadOnePeriodBloc({required ReadOnePeriodUseCase readOnePeriodUseCase})
      : _readOnePeriodUseCase = readOnePeriodUseCase,
        super(ReadOnePeriodLoading()) {
    on<OnePeriodReaded>(_onOnePeriodReaded);
  }

  void _onOnePeriodReaded(
    OnePeriodReaded event,
    Emitter<ReadOnePeriodState> emit,
  ) async {
    late final PeriodEntity? period;

    try {
      period = await _readOnePeriodUseCase.call(periodID: event.periodID);
      if (period == null) throw Exception("Período não encontrado");
    } catch (e) {
      emit(ReadOnePeriodError(message: "$e"));
      return;
    }

    emit(ReadOnePeriodSuccess(period: period));
  }
}
