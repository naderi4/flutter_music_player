import 'dart:async';
import 'dart:io';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/foundation.dart';

import 'videoEditor.dart';
import 'videoeditor/default_player.dart';

class videoBuilder extends StatefulHookConsumerWidget {
  const videoBuilder({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _videoBuilderState();
}

class _videoBuilderState extends ConsumerState<videoBuilder> {
  Future<void> _disposeVideoController() async {
    if (_toBeDisposed != null) {
      await _toBeDisposed!.dispose();
    }
    _toBeDisposed = _controller;
    _controller = null;
  }

  @override
  void dispose() {
    _disposeVideoController();
    maxWidthController.dispose();
    maxHeightController.dispose();
    qualityController.dispose();
    super.dispose();
  }

  VideoPlayerController? _controller;
  VideoPlayerController? _toBeDisposed;
  String? _retrieveDataError;

  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();

  Future<void> _playVideo(XFile? file) async {
    if (file != null && mounted) {
      await _disposeVideoController();
      late VideoPlayerController controller;
      if (kIsWeb) {
        controller = VideoPlayerController.networkUrl(Uri.parse(file.path));
      } else {
        controller = VideoPlayerController.file(File(file.path));
      }
      _controller = controller;
      // In web, most browsers won't honor a programmatic call to .play
      // if the video has a sound track (and is not muted).
      // Mute the video so it auto-plays in web!
      // This is not needed if the call to .play is the result of user
      // interaction (clicking on a "play" button, for example).
      const double volume = kIsWeb ? 0.0 : 1.0;
      await controller.setVolume(volume);
      await controller.initialize();
      await controller.setLooping(true);
      await controller.play();
      setState(() {});
    }
  }

  // Widget _buildWebView() {
  //   return SingleChildScrollView(
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.stretch,
  //       children: <Widget>[
  //         WebVideoPlayer(),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildMobileView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: DefaultPlayer(),
        ),
      ],
    );
  }

  File? filev;

  Future<void> _onImageButtonPressed(ImageSource source,
      {required BuildContext context, bool isMultiImage = false}) async {
    final ImagePicker _picker = ImagePicker();
    try {
      final XFile? file = await _picker.pickVideo(
          source: source, maxDuration: const Duration(seconds: 10));
      filev = File(file!.path);
      flickManager = FlickManager(
          videoPlayerController: VideoPlayerController.file(
        filev!,
      ));
      //await _playVideo(file);
      setState(() {});
    } catch (e) {
      setState(() {});
    }
  }

  FlickManager? flickManager;

  @override
  void initState() {
    super.initState();
    // flickManager = FlickManager(
    //     videoPlayerController: VideoPlayerController.networkUrl(
    //   Uri.parse("url"),
    // ));
  }

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
                    onPressed: () {
                      _onImageButtonPressed(ImageSource.gallery,
                          context: context);
                    },
                    heroTag: 'imagesel1',
                    tooltip: 'انتخاب کلیپ',
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
                  const SizedBox(
                    width: 10,
                  ),
                  Visibility(
                      visible: flickManager != null,
                      child: FloatingActionButton(
                        onPressed: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      VideoEditor(
                                        file: filev!,
                                      ),
                                  fullscreenDialog: false));
                          setState(() {
                            //imageCache.clear();
                            imageCache.clearLiveImages();
                          });
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
          visible: flickManager != null,
          child: Expanded(
            flex: 6,
            child: flickManager != null
                ? Center(child: FlickVideoPlayer(flickManager: flickManager!))
                : const Text(''),
          )),
    ]));
  }
}
