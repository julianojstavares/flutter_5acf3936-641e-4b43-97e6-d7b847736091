import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/dependency_injection/service_locator.dart';
import 'package:frontend/core/routes/app_router.dart';
import 'package:frontend/feature/auth/presentation/bloc/signUp/signup_bloc.dart';
import 'package:frontend/feature/auth/presentation/bloc/signUp/signup_event.dart';
import 'package:frontend/feature/auth/presentation/widgets/signup_form.dart';

import '../bloc/signUp/signup_state.dart';
import '../cubit/view_cubit.dart';

class SignUpFormBuilder extends StatelessWidget {
  const SignUpFormBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<SignUpBloc>(),
      child: BlocConsumer<SignUpBloc, SignupState>(
        listener: (context, state) {
          if (state is SignupSuccess) {
            getIt.registerSingleton(
              instanceName: "user",
              state.user,
            );
            context.replaceRoute(const HomeRoute());
            log(name: "SignUpFormBuilder", "navegar");
          }
        },
        builder: (context, state) => switch (state) {
          SignupInitial() => const SignUpForm(),
          SignupLoading() => const Center(child: CircularProgressIndicator()),
          SignupError() => Center(
              child: Column(
                children: [
                  AutoSizeText(state.message),
                  const SizedBox(height: 10),
                  FilledButton(
                    onPressed: () {
                      context.read<SignUpBloc>().add(SignUpRetried());
                    },
                    child: const AutoSizeText("Ok"),
                  ),
                  const SizedBox(height: 10),
                  FilledButton(
                    onPressed: () {
                      context.read<ViewCubit>().initial();
                    },
                    child: const AutoSizeText("Voltar"),
                  ),
                ],
              ),
            ),
          SignupSuccess() => const Center(child: AutoSizeText("Entrando ...")),
        },
      ),
    );
  }
}
