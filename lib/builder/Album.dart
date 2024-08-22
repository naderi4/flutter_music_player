import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:SocialLib/builder/Slider.dart';
import 'package:get/get.dart';

class Album extends StatefulWidget {
  const Album({required this.images, required this.titel});
  //final String url;
  final String titel;
  final List<String> images;
  @override
  _AlbumState createState() => _AlbumState();
}

class _AlbumState extends State<Album> {
  GlobalKey<ExtendedImageSlidePageState> slidePagekey =
      GlobalKey<ExtendedImageSlidePageState>();

  late ExtendedPageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = ExtendedPageController(
      initialPage: 0,
      pageSpacing: 50,
      shouldIgnorePointerWhenScrolling: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: [
            AutoSizeText(
              widget.titel,
              style: const TextStyle(fontSize: 20, color: Colors.black),
              minFontSize: 18,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
            Expanded(
                child: Material(
              color: Colors.transparent,
              child: ExtendedImageSlidePage(
                key: slidePagekey,
                slideAxis: SlideAxis.vertical,
                slideType: SlideType.onlyImage,
                child: GestureDetector(
                  child: Stack(children: [
                    ExtendedImageGesturePageView.builder(
                      controller: pageController,
                      //pageSnapping: false,
                      //preloadPagesCount: 2,
                      itemCount: widget.images.length,
                      itemBuilder: (BuildContext context, int index) {
                        final String url = widget.images[index];

                        return
                            // url == 'This is an video'
                            //     ? ExtendedImageSlidePageHandler(
                            //         child: Material(
                            //           child: Container(
                            //             alignment: Alignment.center,
                            //             color: Colors.yellow,
                            //             child: const Text('This is an video'),
                            //           ),
                            //         ),

                            //         ///make hero better when slide out
                            //         heroBuilderForSlidingPage: (Widget result) {
                            //           return Hero(
                            //             tag: url,
                            //             child: result,
                            //             flightShuttleBuilder:
                            //                 (BuildContext flightContext,
                            //                     Animation<double> animation,
                            //                     HeroFlightDirection flightDirection,
                            //                     BuildContext fromHeroContext,
                            //                     BuildContext toHeroContext) {
                            //               final Hero hero = (flightDirection ==
                            //                       HeroFlightDirection.pop
                            //                   ? fromHeroContext.widget
                            //                   : toHeroContext.widget) as Hero;

                            //               return hero.child;
                            //             },
                            //           );
                            //         },
                            //       )
                            //     :
                            HeroWidget(
                          // ExtendedImage.network(
                          //url,
                          tag: url,
                          slideType: SlideType.onlyImage,
                          slidePagekey: slidePagekey,
                          // ExtendedImage.network(
                          //url,
                          child: ExtendedImage.file(
                            File(url),
                            enableSlideOutPage: true,
                            fit: BoxFit.contain,
                            mode: ExtendedImageMode.gesture,
                            initGestureConfigHandler:
                                (ExtendedImageState state) {
                              return GestureConfig(
                                //you must set inPageView true if you want to use ExtendedImageGesturePageView
                                inPageView: true,
                                initialScale: 1.0,
                                maxScale: 5.0,
                                animationMaxScale: 6.0,
                                initialAlignment: InitialAlignment.center,
                              );
                            },
                          ),
                        );
                      },
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                hoverColor: Colors.amber,
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {
                                  pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 10),
                                      curve: Curves.bounceIn);
                                },
                                child: const Icon(Icons.keyboard_arrow_right,
                                    size: 46),
                              ),
                              InkWell(
                                hoverColor: Colors.amber,
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {
                                  pageController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 10),
                                      curve: Curves.bounceIn);
                                },
                                child: const Icon(Icons.keyboard_arrow_left,
                                    size: 46),
                              ),
                            ])),
                  ]),
                  onTap: () {
                    //slidePagekey.currentState!.popPage();
                    //  Navigator.pop(context);
                  },
                ),
              ),
            )),
            IconButton(
                onPressed: () => {Get.back()},
                icon: const Icon(
                  Icons.close,
                  color: Colors.red,
                )),
          ],
        ));
  }
}
