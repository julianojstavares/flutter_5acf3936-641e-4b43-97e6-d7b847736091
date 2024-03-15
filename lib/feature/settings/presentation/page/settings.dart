import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/feature/settings/presentation/cubit/period_popup_cubit/period_popup_cubit.dart';
import 'package:frontend/feature/settings/presentation/widgets/period_popup/period_popup.dart';

import '../cubit/dialog_cubit.dart';
import '../widgets/content_widget.dart';
import '../widgets/footer_widget.dart';
import '../widgets/header_widget.dart';
import '../widgets/settings_page_appbar.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SettingsPageAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: MultiBlocProvider(
            providers: [
              BlocProvider<DialogCubit>(
                create: (context) => DialogCubit(),
              ),
              BlocProvider<PeriodPopUpCubit>(
                create: (context) => PeriodPopUpCubit(),
              ),
            ],
            child: BlocListener<DialogCubit, bool>(
              listener: (context, isOpen) {
                final dialogCubit = context.read<DialogCubit>();
                final periodPopUpCubit = context.read<PeriodPopUpCubit>();

                if (isOpen) {
                  showDialog(
                    context: context,
                    builder: (context) => PeriodPopUp(
                      dialogCubit: dialogCubit,
                      periodPopUpCubit: periodPopUpCubit,
                    ),
                    barrierDismissible: false,
                  );
                }
              },
              child: const Column(
                children: [
                  HeaderWidget(),
                  Divider(),
                  ContentWidget(),
                  SizedBox(height: 50),
                  FooterWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
