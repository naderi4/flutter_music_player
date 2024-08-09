import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:SocialLib/audioTrimmer.dart';
import 'package:SocialLib/builder/audioPlayer.dart';

class audioBuilder extends StatefulHookConsumerWidget {
  audioBuilder({super.key});
  File? file = null;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _audioBuilderState();
}

class _audioBuilderState extends ConsumerState<audioBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Expanded(
          flex: 1,
          child: Visibility(
            visible: true,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(
                        type: FileType.audio,
                      );
                      if (result != null) {
                        widget.file = File(result.files.single.path!);
                        setState(() {});
                      } else {
                        // User canceled the picker
                      }
                    },
                    heroTag: 'imagesel1',
                    tooltip: 'انتخاب صوت',
                    child: const Icon(Icons.photo),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    heroTag: 'imagesel2',
                    tooltip: 'رکورد',
                    child: const Icon(Icons.camera),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Visibility(
                      child: FloatingActionButton(
                    onPressed: () async {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return AudioTrimmerView(widget.file!);
                        }),
                      );
                    },
                    heroTag: 'imagesel2',
                    tooltip: 'ویرایش',
                    child: const Icon(Icons.edit),
                  )),
                  // FloatingActionButton(
                  //   onPressed: () {
                  //     _onImageButtonPressed(
                  //       ImageSource.gallery,
                  //       context: context,
                  //       isMultiImage: true,
                  //     );
                  //   },
                  //   heroTag: 'imageselmulti',
                  //   tooltip: 'Pick Multiple Image from gallery',
                  //   child: const Icon(Icons.photo_library),
                  // ),
                ]),
          )),
      Visibility(
        visible: widget.file != null,
        child: Expanded(flex: 6, child: audioPlayer(file: widget.file)),
      ),
    ]));
  }
}
