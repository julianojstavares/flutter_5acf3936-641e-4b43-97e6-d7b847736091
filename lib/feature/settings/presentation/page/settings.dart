import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../widgets/header_widget.dart';
import '../widgets/settings_page_appbar.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SettingsPageAppBar(),
      body: Column(
        children: [
          HeaderWidget(),
        ],
      ),
    );
  }
}
