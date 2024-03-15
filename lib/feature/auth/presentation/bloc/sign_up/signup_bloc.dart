import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/domain/entities/user_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/use_cases/signup_usecase.dart';
import 'signup_event.dart';
import 'signup_state.dart';

@lazySingleton
class SignUpBloc extends Bloc<SignupEvent, SignupState> {
  final SignUpUseCase _signUpUseCase;

  SignUpBloc({required SignUpUseCase signUpUseCase})
      : _signUpUseCase = signUpUseCase,
        super(SignupInitial()) {
    on<SignUpUserCreated>(_onUserCreated);
    on<SignUpRetried>(_onSignUpRetried);
  }

  void _onUserCreated(
    SignUpUserCreated event,
    Emitter<SignupState> emit,
  ) async {
    emit(SignupLoading());

    const uniqueID = Uuid();

    final newUser = UserEntity(
      uniqueID.v4(),
      event.username,
      event.password,
    );

    try {
      await _signUpUseCase.call(user: newUser);
    } catch (e) {
      emit(SignupError(message: "$e"));
      return;
    }

    emit(SignupSuccess(user: newUser));
  }

  void _onSignUpRetried(
    SignUpRetried event,
    Emitter<SignupState> emit,
  ) {
    emit(SignupInitial());
  }
}
