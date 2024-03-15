import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../cubit/dialog_cubit.dart';
import '../../cubit/period_popup_cubit/period_popup_cubit.dart';
import 'content_period_popup.dart';
import 'footer_period_popup.dart';
import 'header_period_popup.dart';

class PeriodPopUp extends StatefulWidget {
  final DialogCubit dialogCubit;
  final PeriodPopUpCubit periodPopUpCubit;

  const PeriodPopUp({
    super.key,
    required this.dialogCubit,
    required this.periodPopUpCubit,
  });

  @override
  State<PeriodPopUp> createState() => _PeriodPopUpState();
}

class _PeriodPopUpState extends State<PeriodPopUp> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Material(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      HeaderPeriodPopUp(widget: widget),
                      const SizedBox(height: 20),
                      ContentPeriodPopUp(
                        formKey: _formKey,
                        periodPopUpCubit: widget.periodPopUpCubit,
                      ),
                      const SizedBox(height: 20),
                      FooterPeriodPopUp(
                        formKey: _formKey,
                        dialogCubit: widget.dialogCubit,
                        periodPopUpCubit: widget.periodPopUpCubit,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
