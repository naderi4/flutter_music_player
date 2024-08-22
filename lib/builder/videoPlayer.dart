import 'dart:async';
import 'dart:io';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/foundation.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'videoEditor.dart';
import 'videoeditor/default_player.dart';

class videoPlayer extends StatefulHookConsumerWidget {
  const videoPlayer({super.key, required this.filepath, required this.titel});
  final String filepath;
  final String titel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _videoBuilderState();
}

class _videoBuilderState extends ConsumerState<videoPlayer> {
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
    flickManager.dispose();
    super.dispose();
  }

  VideoPlayerController? _controller;
  VideoPlayerController? _toBeDisposed;

  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();

  // Future<void> _playVideo(XFile? file) async {
  //   if (file != null && mounted) {
  //     await _disposeVideoController();
  //     late VideoPlayerController controller;
  //     if (kIsWeb) {
  //       controller = VideoPlayerController.networkUrl(Uri.parse(file.path));
  //     } else {
  //       controller = VideoPlayerController.file(File(file.path));
  //     }
  //     _controller = controller;
  //     // In web, most browsers won't honor a programmatic call to .play
  //     // if the video has a sound track (and is not muted).
  //     // Mute the video so it auto-plays in web!
  //     // This is not needed if the call to .play is the result of user
  //     // interaction (clicking on a "play" button, for example).
  //     const double volume = kIsWeb ? 0.0 : 1.0;
  //     await controller.setVolume(volume);
  //     await controller.initialize();
  //     await controller.setLooping(true);
  //     await controller.play();
  //     setState(() {});
  //   }
  // }

  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.file(
      File(widget.filepath),
    ));
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width >= 800;

    return VisibilityDetector(
      key: ObjectKey(flickManager),
      onVisibilityChanged: (visibility) {
        if (visibility.visibleFraction == 0 && this.mounted) {
          flickManager.flickControlManager?.autoPause();
        } else if (visibility.visibleFraction == 1) {
          flickManager.flickControlManager?.autoResume();
        }
      },
      child: Container(
          child: Stack(
        children: [
          Expanded(
              child: FlickVideoPlayer(
            flickManager: flickManager,
            flickVideoWithControls: const FlickVideoWithControls(
              closedCaptionTextStyle: TextStyle(fontSize: 8),
              controls: FlickPortraitControls(),
            ),
            flickVideoWithControlsFullscreen: const FlickVideoWithControls(
              controls: FlickLandscapeControls(),
            ),
          )),
          if (!isDesktop)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.titel,
                  style: TextStyle(fontSize: 18),
                ),
                IconButton(
                    onPressed: () => {Get.back()},
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ))
              ],
            ),
        ],
      )),
    );
  }
}
