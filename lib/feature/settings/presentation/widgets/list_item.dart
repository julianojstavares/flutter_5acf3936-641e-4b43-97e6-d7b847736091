import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String title;
  final String startDate;
  final String endDate;

  const ListItem({
    super.key,
    required this.title,
    required this.startDate,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: const ButtonStyle(
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 15),
        ),
        backgroundColor: MaterialStatePropertyAll(Colors.white),
        foregroundColor: MaterialStatePropertyAll(Colors.black),
        overlayColor: MaterialStatePropertyAll(Colors.blue),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          Row(
            children: [
              AutoSizeText(
                startDate,
                style: const TextStyle(fontSize: 11),
              ),
              const AutoSizeText(
                " a ",
                style: TextStyle(fontSize: 11),
              ),
              AutoSizeText(
                endDate,
                style: const TextStyle(fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
