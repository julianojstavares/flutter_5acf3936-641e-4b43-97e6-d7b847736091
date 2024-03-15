import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/dependency_injection/service_locator.dart';
import 'package:frontend/core/domain/entities/user_entity.dart';
import 'package:frontend/core/routes/app_router.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final username = getIt.get<UserEntity>(instanceName: "user").username;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AutoSizeText("Olá $username"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText("Home"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: IconButton(
          onPressed: () => context.pushRoute(const SettingsRoute()),
          icon: const Icon(Icons.settings),
        ),
      ),
    );
  }
}
