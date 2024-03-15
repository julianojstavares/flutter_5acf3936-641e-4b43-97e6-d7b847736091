import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/domain/entities/user_entity.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/dependency_injection/service_locator.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  final ImagePicker imgPicker = ImagePicker();
  XFile? imgPicked;
  String? profileImgPath;
  String? nickname;

  final nicknameController = TextEditingController();

  final user = getIt.get<UserEntity>(instanceName: "user");

  @override
  void initState() {
    super.initState();
    profileImgPath = user.imgProfilePath;
    nickname = user.nickname;
    if (nickname != null) nicknameController.text = nickname!;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AutoSizeText("Apelido"),
                TextField(
                  controller: nicknameController,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    isDense: true,
                    border: OutlineInputBorder(),
                  ),
                  onEditingComplete: () =>
                      user.nickname = nicknameController.text,
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
                foregroundImage: profileImgPath != null
                    ? FileImage(File(profileImgPath!)) as ImageProvider<Object>?
                    : const AssetImage("assets/images/profile.png"),
                radius: 25,
              ),
              TextButton(
                onPressed: () async {
                  imgPicked = await imgPicker.pickImage(
                    source: ImageSource.gallery,
                  );

                  if (imgPicked == null) return;

                  final downloadsDir = await getDownloadsDirectory();
                  final fileExtension = extension(imgPicked!.name);

                  File tmpFile = File(imgPicked!.path);

                  final newFilePath =
                      "${downloadsDir!.path}/profile$fileExtension";

                  final newFile = File(newFilePath);

                  final alreadyFile = await newFile.exists();

                  if (!alreadyFile) tmpFile.copy(newFilePath);

                  if (alreadyFile) {
                    await newFile.delete();
                    tmpFile.copy(newFilePath);
                  }

                  user.imgProfilePath = newFilePath;

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
