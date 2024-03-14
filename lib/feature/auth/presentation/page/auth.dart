import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:frontend/feature/auth/presentation/widgets/view_cubit_builder.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/companyLogo.png"),
                radius: 100,
              ),
              SizedBox(height: 30),
              ViewCubitBuilder()
            ],
          ),
        ),
      ),
    );
  }
}
