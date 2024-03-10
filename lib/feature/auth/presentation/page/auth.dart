import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/routes/app_router.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/companyLogo.png"),
              radius: 100,
            ),
            const SizedBox(height: 30),
            FilledButton(
              onPressed: () => context.router.replace(const HomeRoute()),
              child: const AutoSizeText("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
