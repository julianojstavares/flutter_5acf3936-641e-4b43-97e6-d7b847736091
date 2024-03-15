import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/domain/entities/period_entity.dart';

import 'period_popup_state.dart';

class PeriodPopUpCubit extends Cubit<PeriodPopUpState> {
  PeriodPopUpCubit() : super(CreatePeriodPopUpState());

  void showCreateState() => emit(CreatePeriodPopUpState());

  void showEditState(PeriodEntity? period) => emit(
        EditPeriodPopUpState(period: period),
      );
}
