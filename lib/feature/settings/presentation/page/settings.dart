import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        leading: IconButton(
          onPressed: () {},
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
      ),
      body: const Column(
        children: [HeaderWidget()],
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText("Apelido"),
              TextField(),
            ],
          ),
        ),
        Container(
          color: Colors.grey,
          child: Row(
            children: [
              const CircleAvatar(
                foregroundImage: AssetImage("assets/images/profile.png"),
              ),
              TextButton(
                onPressed: () {},
                child: const AutoSizeText("Editar Foto"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
