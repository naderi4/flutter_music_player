import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_draggable_gridview/flutter_draggable_gridview.dart';

import 'Album.dart';
import 'PhotoEditor.dart';

class SliderPhoto extends StatefulWidget {
  final List<String> images;

  const SliderPhoto({super.key, required this.images});
  @override
  _Slider createState() => _Slider();
}

/// make hero better when slide out
class HeroWidget extends StatefulWidget {
  const HeroWidget({
    required this.child,
    required this.tag,
    required this.slidePagekey,
    this.slideType = SlideType.onlyImage,
  });
  final Widget child;
  final SlideType slideType;
  final Object tag;
  final GlobalKey<ExtendedImageSlidePageState> slidePagekey;
  @override
  _HeroWidgetState createState() => _HeroWidgetState();
}

class _HeroWidgetState extends State<HeroWidget> {
  RectTween? _rectTween;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.tag,
      createRectTween: (Rect? begin, Rect? end) {
        _rectTween = RectTween(begin: begin, end: end);
        return _rectTween!;
      },
      // make hero better when slide out
      flightShuttleBuilder: (BuildContext flightContext,
          Animation<double> animation,
          HeroFlightDirection flightDirection,
          BuildContext fromHeroContext,
          BuildContext toHeroContext) {
        // make hero more smoothly
        final Hero hero = (flightDirection == HeroFlightDirection.pop
            ? fromHeroContext.widget
            : toHeroContext.widget) as Hero;
        if (_rectTween == null) {
          return hero;
        }

        if (flightDirection == HeroFlightDirection.pop) {
          final bool fixTransform = widget.slideType == SlideType.onlyImage &&
              (widget.slidePagekey.currentState!.offset != Offset.zero ||
                  widget.slidePagekey.currentState!.scale != 1.0);

          final Widget toHeroWidget = (toHeroContext.widget as Hero).child;
          return AnimatedBuilder(
            animation: animation,
            builder: (BuildContext buildContext, Widget? child) {
              Widget animatedBuilderChild = hero.child;

              // make hero more smoothly
              animatedBuilderChild = Stack(
                clipBehavior: Clip.antiAlias,
                alignment: Alignment.center,
                children: <Widget>[
                  Opacity(
                    opacity: 1 - animation.value,
                    child: UnconstrainedBox(
                      child: SizedBox(
                        width: _rectTween!.begin!.width,
                        height: _rectTween!.begin!.height,
                        child: toHeroWidget,
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: animation.value,
                    child: animatedBuilderChild,
                  )
                ],
              );

              // fix transform when slide out
              if (fixTransform) {
                final Tween<Offset> offsetTween = Tween<Offset>(
                    begin: Offset.zero,
                    end: widget.slidePagekey.currentState!.offset);

                final Tween<double> scaleTween = Tween<double>(
                    begin: 1.0, end: widget.slidePagekey.currentState!.scale);
                animatedBuilderChild = Transform.translate(
                  offset: offsetTween.evaluate(animation),
                  child: Transform.scale(
                    scale: scaleTween.evaluate(animation),
                    child: animatedBuilderChild,
                  ),
                );
              }

              return animatedBuilderChild;
            },
          );
        }
        return hero.child;
      },
      child: widget.child,
    );
  }
}

class _Slider extends State<SliderPhoto> {
  // List<String> images = <String>[
  //   'https://photo.tuchong.com/14649482/f/601672690.jpg',
  //   'https://photo.tuchong.com/17325605/f/641585173.jpg',
  //   'https://photo.tuchong.com/3541468/f/256561232.jpg',
  //   'https://photo.tuchong.com/16709139/f/278778447.jpg',
  //   'This is an video',
  //   'https://photo.tuchong.com/5040418/f/43305517.jpg',
  //   'https://photo.tuchong.com/3019649/f/302699092.jpg'
  // ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Visibility(
          visible: widget.images.isNotEmpty,
          child: DraggableGridViewBuilder(
            scrollDirection: Axis.vertical,
            // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 4, mainAxisExtent: 200),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: widget.images.length == 1 ? 1000 : 500,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1 / 1.5),
            dragCompletion: (List<DraggableGridItem> list, int beforeIndex,
                int afterIndex) {},
            isOnlyLongPress: false,
            dragFeedback: (List<DraggableGridItem> list, int index) {
              return SizedBox(
                width: 120,
                height: 120,
                child: list[index].child,
              );
            },
            dragPlaceHolder: (List<DraggableGridItem> list, int index) {
              return PlaceHolderWidget(
                child: Container(
                  color: Colors.white,
                ),
              );
            },
            children: [
              for (var url in widget.images)
                DraggableGridItem(
                  child: GestureDetector(
                    child: AspectRatio(
                        aspectRatio: 1.0,
                        child: Hero(
                          tag: url,
                          child: Scaffold(
                              body: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                  child: url == 'This is an video'
                                      ? Container(
                                          alignment: Alignment.center,
                                          child: const Text('This is an video'),
                                        )
                                      : ExtendedImage.file(
                                          File(url),
                                          fit: BoxFit.cover,
                                        )),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                      iconSize: 24,
                                      onPressed: () => {
                                            widget.images.remove(url),
                                            setState(() {})
                                          },
                                      icon: const Icon(
                                        Icons.remove_circle,
                                        color: Colors.red,
                                      )),
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: IconButton(
                                      iconSize: 36,
                                      onPressed: () async => {
                                            await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        PhotoEditor(
                                                            imageURL: url),
                                                    fullscreenDialog: false)),
                                            setState(() {
                                              //imageCache.clear();
                                              imageCache.clearLiveImages();
                                            })
                                          },
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.blue,
                                      )),
                                ),
                              ),
                            ],
                          )),
                        )),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Album(
                                    url: url,
                                    images: widget.images,
                                  ),
                              fullscreenDialog: false));
                    },
                  ),
                  isDraggable: true,
                  dragCallback: (context, isDragging) {},
                ),
            ],
          )),
    );
  }
}

class SlidePage extends StatefulWidget {
  const SlidePage({this.url});
  final String? url;
  @override
  _SlidePageState createState() => _SlidePageState();
}

class _SlidePageState extends State<SlidePage> {
  GlobalKey<ExtendedImageSlidePageState> slidePagekey =
      GlobalKey<ExtendedImageSlidePageState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ExtendedImageSlidePage(
        key: slidePagekey,
        child: GestureDetector(
          child: widget.url == 'This is an video'
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
                      tag: widget.url!,
                      child: result,
                      flightShuttleBuilder: (BuildContext flightContext,
                          Animation<double> animation,
                          HeroFlightDirection flightDirection,
                          BuildContext fromHeroContext,
                          BuildContext toHeroContext) {
                        final Hero hero =
                            (flightDirection == HeroFlightDirection.pop
                                ? fromHeroContext.widget
                                : toHeroContext.widget) as Hero;

                        return hero.child;
                      },
                    );
                  },
                )
              : HeroWidget(
                  child: ExtendedImage.file(
                    File(widget.url!),
                    fit: BoxFit.cover,
                  ),
                  tag: widget.url!,
                  slideType: SlideType.onlyImage,
                  slidePagekey: slidePagekey,
                ),
          onTap: () {
            slidePagekey.currentState!.popPage();
            Navigator.pop(context);
          },
        ),
        slideAxis: SlideAxis.both,
        slideType: SlideType.onlyImage,
      ),
    );
  }
}
