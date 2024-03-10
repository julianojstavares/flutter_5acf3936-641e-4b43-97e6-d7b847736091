import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SettingsPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SettingsPageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 40,
      leading: IconButton(
        onPressed: () => context.popRoute(),
        icon: const Icon(
          Icons.arrow_back_ios_new,
          size: 15,
        ),
      ),
      titleSpacing: 0,
      title: const AutoSizeText(
        "Configurações",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
