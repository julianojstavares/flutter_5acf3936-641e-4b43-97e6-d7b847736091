import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: AssetImage("assets/images/profile.png"),
        radius: 30,
      ),
      title: const AutoSizeText(
        "João",
        style: TextStyle(
          color: Color.fromRGBO(15, 38, 138, 1),
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Row(
        children: [
          InkWell(
            onTap: () {},
            child: const AutoSizeText(
              "Sair",
              style: TextStyle(
                color: Color.fromRGBO(15, 38, 138, 1),
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
