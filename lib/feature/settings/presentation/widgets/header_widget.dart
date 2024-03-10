import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

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