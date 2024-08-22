import 'package:SocialLib/view/songs/songs_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:SocialLib/common_widget/all_song_row.dart';
import 'package:SocialLib/view/main_player/main_player_view.dart';
import 'package:SocialLib/view_model/all_songs_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../articel/quill_screen.dart';
import '../../builder/Album.dart';
import '../../builder/Slider.dart';
import '../../builder/videoPlayer.dart';

class AllSongsView extends StatefulHookConsumerWidget {
  const AllSongsView({super.key});

  @override
  ConsumerState<AllSongsView> createState() => _AllSongsViewState();
}

class _AllSongsViewState extends ConsumerState<AllSongsView> {
  final allVM = Get.put(AllSongsViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            itemCount: allVM.allList.length,
            itemBuilder: (context, index) {
              var sObj = allVM.allList[index];

              return AllSongRow(
                sObj: sObj,
                onPressed: () {},
                onPressedPlay: () {
                  ref.read(tabProvider.notifier).set(index);
                },
              );
            }),
      ),
    );
  }
}
