import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:music_player/gallery/Slider.dart';

class Album extends StatefulWidget {
  const Album({required this.url, required this.images});
  final String url;
  final List<String> images;
  @override
  _AlbumState createState() => _AlbumState();
}

class _AlbumState extends State<Album> {
  GlobalKey<ExtendedImageSlidePageState> slidePagekey =
      GlobalKey<ExtendedImageSlidePageState>();

  @override
  Widget build(BuildContext context) {
    final pageController = ExtendedPageController(
      initialPage: widget.images.indexOf(widget.url),
      pageSpacing: 50,
      shouldIgnorePointerWhenScrolling: false,
    );

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Material(
          color: Colors.transparent,
          child: ExtendedImageSlidePage(
            key: slidePagekey,
            child: GestureDetector(
              child: Stack(children: [
                ExtendedImageGesturePageView.builder(
                  controller: pageController,
                  //preloadPagesCount: 2,
                  itemCount: widget.images.length,
                  itemBuilder: (BuildContext context, int index) {
                    final String url = widget.images[index];

                    return url == 'This is an video'
                        ? ExtendedImageSlidePageHandler(
                            child: Material(
                              child: Container(
                                alignment: Alignment.center,
                                color: Colors.yellow,
                                child: const Text('This is an video'),
                              ),
                            ),

                            ///make hero better when slide out
                            heroBuilderForSlidingPage: (Widget result) {
                              return Hero(
                                tag: url,
                                child: result,
                                flightShuttleBuilder:
                                    (BuildContext flightContext,
                                        Animation<double> animation,
                                        HeroFlightDirection flightDirection,
                                        BuildContext fromHeroContext,
                                        BuildContext toHeroContext) {
                                  final Hero hero = (flightDirection ==
                                          HeroFlightDirection.pop
                                      ? fromHeroContext.widget
                                      : toHeroContext.widget) as Hero;

                                  return hero.child;
                                },
                              );
                            },
                          )
                        : HeroWidget(
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
                            tag: url,
                            slideType: SlideType.wholePage,
                            slidePagekey: slidePagekey,
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
                              pageController.previousPage(
                                  duration: const Duration(milliseconds: 10),
                                  curve: Curves.bounceIn);
                            },
                            child: const Icon(Icons.keyboard_arrow_right,
                                size: 46),
                          ),
                          InkWell(
                            hoverColor: Colors.amber,
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              pageController.nextPage(
                                  duration: const Duration(milliseconds: 10),
                                  curve: Curves.bounceIn);
                            },
                            child:
                                const Icon(Icons.keyboard_arrow_left, size: 46),
                          ),
                        ])),
              ]),
              onTap: () {
                //slidePagekey.currentState!.popPage();
                //  Navigator.pop(context);
              },
            ),
            slideAxis: SlideAxis.both,
            slideType: SlideType.onlyImage,
          ),
        ));
  }
}
