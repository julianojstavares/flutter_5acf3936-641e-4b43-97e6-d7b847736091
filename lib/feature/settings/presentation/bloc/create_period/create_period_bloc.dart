import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/domain/entities/period_entity.dart';
import '../../../domain/use_cases/ceate_period_use_case.dart';
import 'create_period_event.dart';
import 'create_period_state.dart';

@lazySingleton
class CreatePeriodBloc extends Bloc<CreatePeriodEvent, CreatePeriodState> {
  final CreatePeriodUseCase _createPeriodUseCase;

  CreatePeriodBloc({
    required CreatePeriodUseCase createPeriodUseCase,
  })  : _createPeriodUseCase = createPeriodUseCase,
        super(CreatePeriodInitial()) {
    on<CreatePeriodSucceeded>(_onCreatePeriodSucceeded);
  }

  void _onCreatePeriodSucceeded(
    CreatePeriodSucceeded event,
    Emitter<CreatePeriodState> emit,
  ) async {
    emit(CreatePeriodLoading());

    const uniqueID = Uuid();

    final newPeriod = PeriodEntity(
      uniqueID.v4(),
      event.userID,
      event.title,
      event.startDate,
      event.endDate,
      event.category,
      event.goal1,
      event.goal2,
    );

    try {
      await _createPeriodUseCase.call(period: newPeriod);
    } catch (e) {
      emit(CreatePeriodError(message: "$e"));
      await Future.delayed(const Duration(seconds: 3));
      emit(CreatePeriodInitial());
      return;
    }

    emit(CreatePeriodSuccess());
  }
}
