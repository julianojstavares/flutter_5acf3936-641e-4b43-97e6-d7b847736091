import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'list_item.dart';

class ContentWidget extends StatelessWidget {
  const ContentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          const Row(
            children: [
              AutoSizeText("Períodos"),
            ],
          ),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(245, 246, 250, 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: const [
                  ListItem(
                    title: "Super Feirão",
                    startDate: "01/01/21",
                    endDate: "01/01/22",
                  ),
                  ListItem(
                    title: "Super Feirão",
                    startDate: "01/01/21",
                    endDate: "01/01/22",
                  ),
                  ListItem(
                    title: "Super Feirão",
                    startDate: "01/01/21",
                    endDate: "01/01/22",
                  ),
                  ListItem(
                    title: "Super Feirão",
                    startDate: "01/01/21",
                    endDate: "01/01/22",
                  ),
                  ListItem(
                    title: "Super Feirão",
                    startDate: "01/01/21",
                    endDate: "01/01/22",
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FilledButton(
                onPressed: () {},
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromRGBO(15, 39, 139, 1),
                  ),
                ),
                child: const AutoSizeText("Adicionar Período"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
