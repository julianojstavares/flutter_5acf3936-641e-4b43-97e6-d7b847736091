import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_cases/delete_period_use_case.dart';
import 'delete_period_event.dart';
import 'delete_period_state.dart';

@lazySingleton
class DeletePeriodBloc extends Bloc<DeletePeriodEvent, DeletePeriodState> {
  final DeletePeriodUseCase _deletePeriodUseCase;

  DeletePeriodBloc({
    required DeletePeriodUseCase deletePeriodUseCase,
  })  : _deletePeriodUseCase = deletePeriodUseCase,
        super(DeletePeriodInitial()) {
    on<PeriodDeleted>(_onPeriodDeleted);
  }

  void _onPeriodDeleted(
    PeriodDeleted event,
    Emitter<DeletePeriodState> emit,
  ) async {
    emit(DeletePeriodLoading());

    try {
      await _deletePeriodUseCase.call(periodID: event.periodID);
    } catch (e) {
      emit(DeletePeriodError(message: "$e"));
      return;
    }

    emit(DeletePeriodSuccess());
  }
}
