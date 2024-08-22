import 'dart:math';

import 'package:SocialLib/articel/quill_screen.dart';
import 'package:SocialLib/builder/videoPlayer.dart';
import 'package:SocialLib/view/main_player/main_player_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:SocialLib/view/songs/albums_view.dart';
import 'package:SocialLib/view/songs/all_songs_view.dart';
import 'package:SocialLib/view/songs/artists_view.dart';
import 'package:SocialLib/view/songs/genres_view.dart';
import 'package:SocialLib/view/songs/playlists_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../articel/sample.dart';
import '../../builder/Album.dart';
import '../../common/color_extension.dart';
import '../../builder/articleFrom.dart';
import '../../view_model/splash_view_model.dart';
import '../searchbar.dart';

class SongsView extends StatefulHookConsumerWidget {
  const SongsView({super.key});

  @override
  ConsumerState<SongsView> createState() => _SongsViewState();
}

class tabStateNotifier extends StateNotifier<int> {
  tabStateNotifier(this.ref) : super(0);

  final Ref ref;

  void set(int state2) {
    state = state2;
  }
}

final tabProvider = StateNotifierProvider<tabStateNotifier, int>((ref) {
  return tabStateNotifier(ref);
});

class _SongsViewState extends ConsumerState<SongsView>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  int selectTab = 0;
  int _selIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 4, vsync: this);
    controller?.addListener(() {
      selectTab = controller?.index ?? 0;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width >= 800;

    ref.listen<int>(
      tabProvider,
      (previous, index) {
        if (isDesktop) {
          setState(() {
            _selIndex = index;
          });
        } else {
          if (index == 0) {
            Get.to(() => Album(
                  titel: 'name',
                  // url: 'D:/sociallib/assets/content/1.jpg',
                  images: const [
                    'D:\\sociallib\\assets\\content\\2.jpg',
                    'D:\\sociallib\\assets\\content\\1.jpg',
                    'D:\\sociallib\\assets\\content\\3.jpg',
                    'D:\\sociallib\\assets\\content\\4.jpg',
                  ],
                ));
          } else if (index == 1) {
            Get.to(() => videoPlayer(
                  titel: 'name',
                  filepath: 'D:/sociallib/assets/content/ghl.mp4',
                ));
          } else if (index == 2) {
            Get.to(() => QuillScreen(
                  titel: 'name',
                  args: QuillScreenArgs(
                    document: Document(),
                  ),
                  viewMode: true,
                ));
          } else {
            Get.to(() => const MainPlayerView());
          }
        }
      },
    );

    return Scaffold(
        extendBodyBehindAppBar: true,
        floatingActionButton: Row(
            mainAxisAlignment:
                isDesktop ? MainAxisAlignment.start : MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                backgroundColor: const Color(0xff23273B),
                onPressed: () async {
                  final res = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ArticleFrom(),
                          fullscreenDialog: false));

                  if (res != null) {}
                },
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Image.asset("assets/img/add.png"),
                ),
              )
            ]),
        // appBar: AppBar(
        //   backgroundColor: TColor.bg,
        //   elevation: 0,
        //   leading: IconButton(
        //     onPressed: () {},
        //     icon: Image.asset(
        //       "assets/img/menu.png",
        //       width: 25,
        //       height: 25,
        //       fit: BoxFit.contain,
        //     ),
        //   ),
        //   title: Text(
        //     "کتابخانه",
        //     style: TextStyle(
        //         color: TColor.primaryText80,
        //         fontSize: 17,
        //         fontWeight: FontWeight.w600),
        //   ),
        //   actions: [
        //     IconButton(
        //       onPressed: () {},
        //       icon: Image.asset(
        //         "assets/img/app_logo.png",
        //         width: 30,
        //         height: 30,
        //         fit: BoxFit.contain,
        //         // color: TColor.primaryText35,
        //       ),
        //     ),
        //     const SizedBox(
        //       width: 20,
        //     ),
        //   ],
        // ),
        body: Row(
          children: [
            Expanded(
                child: DefaultTabController(
              length: 4,
              child: NestedScrollView(
                  //controller: scrollController,
                  headerSliverBuilder: (context, value) {
                    return [
                      SliverAppBar(
                        backgroundColor: TColor.bg,
                        elevation: 0,
                        leading: IconButton(
                          onPressed: () {
                            //Get.put(SplashViewMode());
                            //Get.find<SplashViewMode>().openDrawer();
                          },
                          icon: Image.asset(
                            "assets/img/menu.png",
                            width: 25,
                            height: 25,
                            fit: BoxFit.contain,
                          ),
                        ),
                        title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "کتابخانه",
                                style: TextStyle(
                                    color: TColor.primaryText80,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              )
                            ]),
                        actions: [
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/img/app_logo.png",
                              width: 30,
                              height: 30,
                              fit: BoxFit.contain,
                              // color: TColor.primaryText35,
                            ),
                          ),
                          const SizedBox(
                            width: 1,
                          ),
                        ],
                      ),
                      const SliverToBoxAdapter(
                          child: Padding(
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: Center(
                                child: SearchingBar(),
                              ))),

                      SliverPersistentHeader(
                          pinned: true,
                          delegate: _SliverAppBarDelegate(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: ColoredBox(
                                    color: TColor.bg,
                                    child: TabBar(
                                      //labelPadding: EdgeInsets.all(0),
                                      //padding: EdgeInsets.only(left: 10),
                                      tabAlignment: TabAlignment.center,
                                      controller: controller,
                                      indicatorColor: TColor.focus,
                                      // indicatorPadding:
                                      //     const EdgeInsets.symmetric(horizontal: 20),
                                      isScrollable: true,
                                      labelColor: TColor.focus,
                                      labelStyle: TextStyle(
                                          color: TColor.focus,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                      unselectedLabelColor:
                                          TColor.primaryText80,
                                      unselectedLabelStyle: TextStyle(
                                          color: TColor.primaryText80,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                      tabs: const [
                                        Tab(
                                          text: "مطالب",
                                        ),
                                        // Tab(
                                        //   text: "Playlists",
                                        // ),
                                        Tab(
                                          text: "مجموعه ها",
                                        ),
                                        Tab(
                                          text: "نویسندگان",
                                        ),
                                        Tab(
                                          text: "دسته بندی",
                                        ),
                                      ],
                                    )),
                              ),
                              minHeight: 65,
                              maxHeight: 65)),
                      // SliverToBoxAdapter(
                      //     child: Expanded(
                      //         child: TabBarView(
                      //   controller: controller,
                      //   children: const [
                      //     AllSongsView(),
                      //     //  PlaylistsView(),
                      //     AlbumsView(),
                      //     ArtistsView(),
                      //     GenresView(),
                      //   ],
                      // ))),
                    ];
                  },
                  body: Padding(
                      padding: const EdgeInsets.all(0),
                      child: TabBarView(
                        controller: controller,
                        children: const [
                          AllSongsView(),
                          // Text('data'),
                          // Text('data'),
                          // Text('data'),
                          // Text('data'),
                          //PlaylistsView(),
                          AlbumsView(),
                          ArtistsView(),
                          GenresView(),
                        ],
                      ))),
            )),
            if (isDesktop)
              Expanded(
                  flex: 4,
                  child: ColoredBox(
                    color: Colors.white,
                    child: Expanded(
                        child: IndexedStack(index: _selIndex, children: [
                      Album(
                        titel: 'name',
                        // url: 'D:/sociallib/assets/content/1.jpg',
                        images: const [
                          'D:\\sociallib\\assets\\content\\2.jpg',
                          'D:\\sociallib\\assets\\content\\1.jpg',
                          'D:\\sociallib\\assets\\content\\3.jpg',
                          'D:\\sociallib\\assets\\content\\4.jpg',
                        ],
                      ),
                      videoPlayer(
                        titel: 'name',
                        filepath: 'D:/sociallib/assets/content/ghl.mp4',
                      ),
                      QuillScreen(
                        titel: 'name',
                        args: QuillScreenArgs(
                          document: Document.fromJson(quillTextSample),
                        ),
                        viewMode: true,
                      ),
                      const MainPlayerView()
                    ])),
                  )),
          ],
        ));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
