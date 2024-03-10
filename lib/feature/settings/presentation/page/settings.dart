import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../widgets/content_widget.dart';
import '../widgets/footer_widget.dart';
import '../widgets/header_widget.dart';
import '../widgets/settings_page_appbar.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SettingsPageAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
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
    );
  }
}


