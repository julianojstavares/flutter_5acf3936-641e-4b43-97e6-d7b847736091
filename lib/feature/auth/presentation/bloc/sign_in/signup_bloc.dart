import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/domain/entities/user_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_cases/signin_usecase.dart';
import 'signin_event.dart';
import 'signin_state.dart';

@lazySingleton
class SignInBloc extends Bloc<SigninEvent, SigninState> {
  final SignInUseCase _signInUseCase;

  SignInBloc({required SignInUseCase signInUseCase})
      : _signInUseCase = signInUseCase,
        super(SigninInitial()) {
    on<SignInSucceeded>(_onSignInSucceeded);
    on<SignInRetried>(_onSignInRetried);
  }

  void _onSignInSucceeded(
    SignInSucceeded event,
    Emitter<SigninState> emit,
  ) async {
    emit(SigninLoading());
    late final UserEntity user;

    final usr = event.username;
    final psw = event.password;

    try {
      user = await _signInUseCase.call(username: usr, password: psw);
    } catch (e) {
      emit(SigninError(message: "$e"));
      return;
    }

    emit(SigninSuccess(user: user));
  }

  void _onSignInRetried(
    SignInRetried event,
    Emitter<SigninState> emit,
  ) {
    emit(SigninInitial());
  }
}
