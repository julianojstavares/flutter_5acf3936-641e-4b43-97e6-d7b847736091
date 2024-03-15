import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/feature/settings/domain/use_cases/update_period_use_case.dart';
import 'package:injectable/injectable.dart';

import 'update_period_event.dart';
import 'update_period_state.dart';

@lazySingleton
class UpdatePeriodBloc extends Bloc<UpdatePeriodEvent, UpdatePeriodState> {
  final UpdatePeriodUseCase _updatePeriodUseCase;

  UpdatePeriodBloc({
    required UpdatePeriodUseCase updatePeriodUseCase,
  })  : _updatePeriodUseCase = updatePeriodUseCase,
        super(UpdatePeriodInitial()) {
    on<PeriodUpdated>(_onPeriodUpdated);
  }

  void _onPeriodUpdated(
    PeriodUpdated event,
    Emitter<UpdatePeriodState> emit,
  ) async {
    emit(UpdatePeriodLoading());

    try {
      await _updatePeriodUseCase.call(periodUpdated: event.periodUpdated);
    } catch (e) {
      emit(UpdatePeriodError(message: "$e"));
      await Future.delayed(const Duration(seconds: 3));
      emit(UpdatePeriodInitial());
      return;
    }

    emit(UpdatePeriodSuccess());
    emit(UpdatePeriodInitial());
  }
}
