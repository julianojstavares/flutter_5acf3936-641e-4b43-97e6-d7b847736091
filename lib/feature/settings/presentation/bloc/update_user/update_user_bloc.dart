import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_cases/update_user_use_case.dart';
import 'update_user_event.dart';
import 'update_user_state.dart';

@lazySingleton
class UpdateUserBloc extends Bloc<UpdateUserEvent, UpdateUserState> {
  final UpdateUserUseCase _updateUserUseCase;

  UpdateUserBloc({
    required UpdateUserUseCase updateUserUseCase,
  })  : _updateUserUseCase = updateUserUseCase,
        super(UpdateUserInitial()) {
    on<UserUpdated>(_onUserUpdated);
  }

  void _onUserUpdated(
    UserUpdated event,
    Emitter<UpdateUserState> emit,
  ) async {
    emit(UpdateUserLoading());

    try {
      await _updateUserUseCase.call(userUpdated: event.userUpdated);
    } catch (e) {
      emit(UpdateUserError(message: "$e"));
      return;
    }

    emit(UpdateUserSuccess());
  }
}
