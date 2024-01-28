import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:music_player/gallery/Slider.dart';

class gallerybuilder extends StatefulHookConsumerWidget {
  gallerybuilder({super.key, required this.images});

  List<String> images;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _gallerybuilderState();
}

// List<String> images = <String>[
//   // 'https://photo.tuchong.com/14649482/f/601672690.jpg',
//   // 'https://photo.tuchong.com/17325605/f/641585173.jpg',
//   // 'https://photo.tuchong.com/3541468/f/256561232.jpg',
//   // 'https://photo.tuchong.com/16709139/f/278778447.jpg',
//   // 'https://photo.tuchong.com/15195571/f/233361383.jpg',
//   // 'https://photo.tuchong.com/5040418/f/43305517.jpg',
//   //'C:/Users/snade/Documents/dw.jpg'
// ];

class _gallerybuilderState extends ConsumerState<gallerybuilder> {
  Future<void> _onImageButtonPressed(ImageSource source,
      {required BuildContext context, bool isMultiImage = false}) async {
    final ImagePicker _picker = ImagePicker();
    try {
      if (isMultiImage) {
        final List<XFile> pickedFileList = await _picker.pickMultiImage();
        widget.images.addAll(pickedFileList.map((e) => e.path).toList());
      } else {
        final XFile? pickedFile = await _picker.pickImage(
          source: source,
          //  maxWidth: maxWidth,
          //  maxHeight: maxHeight,
          //  imageQuality: quality,
        );
        widget.images.add(pickedFile!.path);
      }
      setState(() {});
    } catch (e) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Visibility(
                visible: true,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          _onImageButtonPressed(ImageSource.gallery,
                              context: context);
                        },
                        heroTag: 'imagesel1',
                        tooltip: 'انتخاب تصویر',
                        child: const Icon(Icons.photo),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          _onImageButtonPressed(ImageSource.camera,
                              context: context);
                        },
                        heroTag: 'imagesel2',
                        tooltip: 'دوربین',
                        child: const Icon(Icons.camera),
                      ),
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
          Expanded(
              flex: 6,
              child: Visibility(
                  visible: true,
                  child: SliderPhoto(
                    images: widget.images,
                  ))),
          // ElevatedButton(
          //   style: ButtonStyle(
          //     backgroundColor: MaterialStateProperty.all<Color>(
          //       const Color.fromARGB(255, 74, 137, 92),
          //     ),
          //   ),
          //   onPressed: () {
          //     _controller.clearTags();
          //   },
          //   child: const Text('CLEAR TAGS'),
          // ),
        ],
      ),
    );
  }
}
