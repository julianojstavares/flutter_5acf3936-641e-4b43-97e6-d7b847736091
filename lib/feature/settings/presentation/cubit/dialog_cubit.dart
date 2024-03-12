import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DialogCubit extends Cubit<bool> {
  DialogCubit() : super(false);

  void openDialog() {
    emit(true);
  }

  void closeDialog(BuildContext dialoContext) {
    Navigator.of(dialoContext).pop();
    emit(false);
  }
}