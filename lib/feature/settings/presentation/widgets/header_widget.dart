import 'dart:developer';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  final ImagePicker imgPicker = ImagePicker();
  XFile? imgLocal;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText("Apelido"),
                TextField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    isDense: true,
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(240, 240, 240, 1),
            borderRadius: BorderRadius.circular(9),
          ),
          child: Row(
            children: [
              CircleAvatar(
                foregroundImage: imgLocal != null
                    ? FileImage(File(imgLocal!.path)) as ImageProvider<Object>?
                    : const AssetImage("assets/images/profile.png"),
                radius: 25,
              ),
              TextButton(
                onPressed: () async {
                  imgLocal = await imgPicker.pickImage(
                    source: ImageSource.gallery,
                  );
                  Directory appDocDir =
                      await getApplicationDocumentsDirectory();
                  String appDocPath = appDocDir.path;

                  String novoCaminho = '$appDocPath/${imgLocal!.name}';

                  File imagemSelecionada = File(imgLocal!.path);
                  await imagemSelecionada.copy(novoCaminho);

                  log(imgLocal?.path ?? "no image");
                  log(novoCaminho);

                  setState(() {});
                },
                style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(Colors.black),
                  overlayColor: MaterialStatePropertyAll(Colors.blue),
                ),
                child: const AutoSizeText(
                  "Editar Foto",
                  style: TextStyle(fontSize: 11),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
