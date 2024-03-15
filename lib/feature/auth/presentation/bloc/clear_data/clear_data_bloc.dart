import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_cases/clear_data_usecase.dart';
import 'clear_data_event.dart';
import 'clear_data_state.dart';

@lazySingleton
class ClearDataBloc extends Bloc<ClearDataEvent, ClearDataState> {
  final ClearDataUseCase _clearDataUseCase;

  ClearDataBloc({
    required ClearDataUseCase clearDataUseCase,
  })  : _clearDataUseCase = clearDataUseCase,
        super(ClearDataInitial()) {
    on<ClearDataFinished>(_onClearDataFinished);
  }

  void _onClearDataFinished(
    ClearDataFinished event,
    Emitter<ClearDataState> emit,
  ) async {
    emit(ClearDataLoading());

    try {
      await _clearDataUseCase.call();
    } catch (e) {
      emit(ClearDataError(message: "$e"));
      await Future.delayed(const Duration(seconds: 3));
      emit(ClearDataInitial());
      return;
    }

    emit(ClearDataSuccess(
      message: "Todos os dados foram apagados",
    ));

    await Future.delayed(const Duration(seconds: 3));

    emit(ClearDataInitial());
  }
}
