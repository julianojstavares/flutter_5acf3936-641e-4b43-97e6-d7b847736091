import 'package:flutter_bloc/flutter_bloc.dart';

import 'view_state.dart';

class ViewCubit extends Cubit<ViewState> {
  ViewCubit() : super(ViewInitial());

  void signIn() => emit(ViewSignIn());
  void signUp() => emit(ViewSignUp());
  void initial() => emit(ViewInitial());

}
