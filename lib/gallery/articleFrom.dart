import 'dart:math';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';
import 'package:textfield_tags/textfield_tags.dart';

import 'Slider.dart';

class ArticleFrom extends StatefulHookConsumerWidget {
  ArticleFrom({Key? key, required this.images}) : super(key: key);

  List<String> images;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _articleFrom();
}

class _articleFrom extends ConsumerState<ArticleFrom> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _emailFieldKey = GlobalKey<FormBuilderFieldState>();

  late double _distanceToField;
  late TextfieldTagsController _controller;

  final controller = MultiImagePickerController(
    maxImages: 10,
    withReadStream: true,
    allowedImageTypes: ['png', 'jpg', 'jpeg'],
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void dispose() {
    controller.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = TextfieldTagsController();
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

  static Future<void> alert(String message, BuildContext context) async {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: SingleChildScrollView(
            child: Row(
          children: <Widget>[
            const Icon(Icons.warning_rounded, color: Colors.red),
            Text(message)
          ],
        )),
        action: SnackBarAction(
          label: 'تایید',
          onPressed: () {
            // Code to execute.
          },
        )));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text('ثبت مطلب جدید'),
        ),
        floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Semantics(
                label: 'image_picker_example_from_gallery',
                child: FloatingActionButton(
                  onPressed: () {
                    alert(
                      'سند ذخیره شد',
                      context,
                    );
                  },
                  tooltip: 'ذخیره',
                  child: const Icon(Icons.check),
                ),
              )
            ]),
        body: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
                padding: EdgeInsets.only(
                    left: width / 6, //max((width - 800) / 2, 0),
                    right: width / 6,
                    bottom: 10), //max((width - 800) / 2, 0)),
                // decoration: BoxDecoration(
                //     borderRadius: const BorderRadius.all(Radius.circular(5)),
                //     gradient: LinearGradient(
                //         begin: Alignment.topRight,
                //         end: Alignment.bottomLeft,
                //         stops: const [
                //           0.2,
                //           0.5,
                //           0.8,
                //           0.7
                //         ],
                //         colors: [
                //           Colors.blue[50]!,
                //           Colors.blue[100]!,
                //           Colors.blue[200]!,
                //           Colors.blue[300]!
                //         ])),
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        key: _emailFieldKey,
                        name: 'عنوان',
                        decoration: const InputDecoration(labelText: 'عنوان'),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
                      ),
                      // FormBuilderChoiceChip<String>(
                      //   name: 'choice_chip',
                      //   selectedColor: Colors.amber,
                      //   crossAxisAlignment: WrapCrossAlignment.center,
                      //   decoration:
                      //       const InputDecoration(prefix: Text(' نوع محتوا: ')),
                      //   onChanged: (value) {
                      //     // print(value);
                      //   },
                      //   initialValue: 'عکس',
                      //   options: const [
                      //     FormBuilderChipOption(
                      //       value: 'نوشته',
                      //     ),
                      //     FormBuilderChipOption(
                      //       value: 'عکس',
                      //     ),
                      //     FormBuilderChipOption(
                      //       value: 'فیلم',
                      //     ),
                      //     FormBuilderChipOption(
                      //       value: 'صوتی',
                      //     )
                      //   ],
                      // ),
                      const SizedBox(
                        height: 5,
                      ),
                      // const Text('تگها'),
                      TextFieldTags(
                        textfieldTagsController: _controller,
                        initialTags: const [],
                        textSeparators: const [' ', ','],
                        letterCase: LetterCase.normal,
                        validator: (String tag) {
                          if (tag == 'php') {
                            return 'No, please just no';
                          } else if (_controller.getTags!.contains(tag)) {
                            return 'you already entered that';
                          }
                          return null;
                        },
                        inputfieldBuilder:
                            (context, tec, fn, error, onChanged, onSubmitted) {
                          return ((context, sc, tags, onTagDelete) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextField(
                                controller: tec,
                                focusNode: fn,
                                decoration: InputDecoration(
                                  isDense: true,
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 74, 137, 92),
                                      width: 3.0,
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 74, 137, 92),
                                      width: 3.0,
                                    ),
                                  ),
                                  // helperText: 'Enter language...',
                                  helperStyle: const TextStyle(
                                    color: Color.fromARGB(255, 74, 137, 92),
                                  ),
                                  hintText: _controller.hasTags
                                      ? ''
                                      : "تگها را مشخص کنید",
                                  errorText: error,
                                  prefixIconConstraints: BoxConstraints(
                                      maxWidth: _distanceToField * 0.74),
                                  prefixIcon: tags.isNotEmpty
                                      ? SingleChildScrollView(
                                          controller: sc,
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                              children: tags.map((String tag) {
                                            return Container(
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(20.0),
                                                ),
                                                color: Color.fromARGB(
                                                    255, 74, 137, 92),
                                              ),
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5.0),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10.0,
                                                      vertical: 5.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  InkWell(
                                                    child: Text(
                                                      '#$tag',
                                                      style: const TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    onTap: () {
                                                      print("$tag selected");
                                                    },
                                                  ),
                                                  const SizedBox(width: 4.0),
                                                  InkWell(
                                                    child: const Icon(
                                                      Icons.cancel,
                                                      size: 14.0,
                                                      color: Color.fromARGB(
                                                          255, 233, 233, 233),
                                                    ),
                                                    onTap: () {
                                                      onTagDelete(tag);
                                                    },
                                                  )
                                                ],
                                              ),
                                            );
                                          }).toList()),
                                        )
                                      : null,
                                ),
                                onChanged: onChanged,
                                onSubmitted: onSubmitted,
                              ),
                            );
                          });
                        },
                      ),
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
                                  SizedBox(
                                    width: 10,
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                      _onImageButtonPressed(
                                        ImageSource.gallery,
                                        context: context,
                                        isMultiImage: true,
                                      );
                                    },
                                    heroTag: 'imageselmulti',
                                    tooltip: 'Pick Multiple Image from gallery',
                                    child: const Icon(Icons.photo_library),
                                  ),
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
                ))));
  }
}
