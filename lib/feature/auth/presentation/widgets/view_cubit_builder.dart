import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/feature/auth/presentation/widgets/signup_form_builder.dart';

import '../cubit/view_cubit.dart';
import '../cubit/view_state.dart';
import 'signin_form.dart';

class ViewCubitBuilder extends StatelessWidget {
  const ViewCubitBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewCubit(),
      child: BlocBuilder<ViewCubit, ViewState>(
        builder: (context, state) => switch (state) {
          ViewInitial() => Column(
              children: [
                FilledButton(
                  onPressed: () => context.read<ViewCubit>().signIn(),
                  child: const AutoSizeText("Entrar"),
                ),
                FilledButton(
                  onPressed: () => context.read<ViewCubit>().signUp(),
                  child: const AutoSizeText("Criar Conta"),
                ),
              ],
            ),
          ViewSignIn() => const SignInForm(),
          ViewSignUp() => const SignUpFormBuilder(),
        },
      ),
    );
  }
}