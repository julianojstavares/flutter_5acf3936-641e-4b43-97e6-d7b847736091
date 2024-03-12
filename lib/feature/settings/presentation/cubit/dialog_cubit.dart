import 'package:flutter_bloc/flutter_bloc.dart';

class DialogCubit extends Cubit<bool> {
  DialogCubit() : super(false);

  void openDialog() {
    emit(true);
  }

  void closeDialog() {
    emit(false);
  }
}