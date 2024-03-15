import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/dependency_injection/service_locator.dart';
import 'package:frontend/core/routes/app_router.dart';
import 'package:frontend/feature/auth/presentation/bloc/sign_in/signin_event.dart';
import 'package:frontend/feature/auth/presentation/widgets/signin_form.dart';

import '../bloc/sign_in/signin_state.dart';
import '../bloc/sign_in/signup_bloc.dart';
import '../cubit/view_cubit.dart';

class SignInFormBuilder extends StatelessWidget {
  const SignInFormBuilder({super.key});


  @override
  Widget build(BuildContext context) {
    final signInBloc = getIt.get<SignInBloc>();

    return BlocConsumer<SignInBloc, SigninState>(
      bloc: signInBloc,
      listener: (context, state) {
        if (state is SigninSuccess) {
          getIt.registerSingleton(
            instanceName: "user",
            state.user,
          );
          context.replaceRoute(const HomeRoute());
          log(name: "SignInFormBuilder", "navegar");
        }
      },
      builder: (context, state) => switch (state) {
        SigninInitial() => const SignInForm(),
        SigninLoading() => const Center(child: CircularProgressIndicator()),
        SigninError() => Center(
            child: Column(
              children: [
                AutoSizeText(state.message),
                const SizedBox(height: 10),
                FilledButton(
                  onPressed: () {
                    signInBloc.add(SignInRetried());
                  },
                  child: const AutoSizeText("Ok"),
                ),
                const SizedBox(height: 10),
                FilledButton(
                  onPressed: () {
                    signInBloc.add(SignInRetried());
                    context.read<ViewCubit>().initial();
                  },
                  child: const AutoSizeText("Voltar"),
                ),
              ],
            ),
          ),
        SigninSuccess() => const Center(child: AutoSizeText("Entrando ...")),
      },
    );
  }
}
