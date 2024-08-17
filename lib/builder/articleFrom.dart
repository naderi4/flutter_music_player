import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';
import 'package:SocialLib/builder/articelBuilder.dart';
import 'package:SocialLib/builder/audioBuilder.dart';
import 'package:SocialLib/builder/gallery.dart';
import 'package:SocialLib/builder/imageBuilder.dart';
import 'package:SocialLib/builder/videoBuilder.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../common/color_extension.dart';
import '../entities/item.dart';
import '../locale_provider.dart';
import '../services/service.dart';
import '../view/songs/albums_view.dart';
import 'Slider.dart';

class ArticleFrom extends StatefulHookConsumerWidget {
  ArticleFrom({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _articleFrom();
}

class _articleFrom extends ConsumerState<ArticleFrom>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormBuilderState>();
  final _nameFieldKey = GlobalKey<FormBuilderFieldState>();
  ItemInfo item = ItemInfo.newone();

  late double _distanceToField;
  late StringTagController _stringTagController;

  // final controller = MultiImagePickerController(
  //   maxImages: 10,
  //   withReadStream: true,
  //   allowedImageTypes: ['png', 'jpg', 'jpeg'],
  // );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void dispose() {
    //controller.dispose();
    _stringTagController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _stringTagController = StringTagController();
    _tabController = TabController(vsync: this, length: 2);
    _tabController?.addListener(() {
      _tabIndex = _tabController?.index ?? 0;
      setState(() {});
    });
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

  int _tabIndex = 0;
  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final state = ref.watch(itemProvider);

    return Scaffold(
        floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            //  crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                heroTag: 'exithero',
                onPressed: () {
                  Navigator.pop(context);
                },
                tooltip: 'خروج',
                child: const Icon(Icons.close),
              ),
              FloatingActionButton(
                heroTag: 'savehero',
                onPressed: () {
                  alert(
                    'سند ذخیره شد',
                    context,
                  );
                },
                tooltip: 'ذخیره',
                child: const Icon(Icons.check),
              ),
            ]),
        body: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
                child: Center(
                    child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1200),
                        child: CustomScrollView(slivers: [
                          SliverToBoxAdapter(
                              child: TabBar(
                                  controller: _tabController,
                                  unselectedLabelColor: TColor.primaryText80,
                                  onTap: (int idx) async {
                                    setState(() {
                                      _tabIndex = idx;
                                      _tabController.index = idx;
                                    });
                                  },
                                  //unselectedLabelColor: Colors.white,
                                  // indicatorSize: TabBarIndicatorSize.tab,
                                  // indicator: BoxDecoration(
                                  //     borderRadius: BorderRadius.circular(0),
                                  //     color: Colors.purple.shade100),
                                  tabs: const [
                                Tab(
                                    child: Align(
                                  alignment: Alignment.center,
                                  child: AutoSizeText(
                                    'اطلاعات',
                                    style: TextStyle(fontSize: 14),
                                    minFontSize: 12,
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                  ),
                                )),
                                Tab(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: AutoSizeText(
                                      'محتوا',
                                      style: TextStyle(fontSize: 14),
                                      minFontSize: 12,
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                    ),
                                  ),
                                ),
                              ])),
                          const SliverToBoxAdapter(
                              child: SizedBox(
                            height: 30,
                          )),
                          SliverToBoxAdapter(
                              child: Container(
                                  width: 200,
                                  height: 900,
                                  child: TabBarView(
                                      controller: _tabController,
                                      children: [
                                        FormBuilder(
                                          key: _formKey,
                                          child: Column(
                                            children: [
                                              ListTile(
                                                selected: true,
                                                leading: const CircleAvatar(
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          255, 254, 254, 255),
                                                  child: Text(''),
                                                ),
                                                title: const Text('مجموعه'),
                                                subtitle: const Text(
                                                    'Item description'),
                                                trailing:
                                                    Icon(Icons.more_horiz),
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      color: Colors.white,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                onTap: () async {
                                                  final res = await Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              AlbumsView(
                                                                  selectmode:
                                                                      true),
                                                          fullscreenDialog:
                                                              false));

                                                  if (res != null) {}
                                                  setState(() {});
                                                },
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              FormBuilderImagePicker(
                                                name: 'photos',
                                                previewAutoSizeWidth: true,
                                                showDecoration: true,
                                                previewMargin:
                                                    const EdgeInsetsDirectional
                                                        .only(end: 8),
                                                decoration:
                                                    const InputDecoration(
                                                        labelText:
                                                            'انتخاب عکس'),
                                                transformImageWidget:
                                                    (context, displayImage) =>
                                                        Card(
                                                  shape: const CircleBorder(),
                                                  clipBehavior: Clip.antiAlias,
                                                  child: SizedBox.expand(
                                                    child: displayImage,
                                                  ),
                                                ),
                                                maxImages: 1,
                                                fit: BoxFit.contain,
                                                //backgroundColor: Colors.black54,
                                                iconColor: Colors.white,
                                                //icon: Icons.image,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              FormBuilderTextField(
                                                key: _nameFieldKey,
                                                name: 'name',
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: 'عنوان:',
                                                ),
                                                validator: FormBuilderValidators
                                                    .compose([
                                                  FormBuilderValidators
                                                      .required(),
                                                ]),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                  width: double.infinity,
                                                  height: 60,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                          flex: 1,
                                                          child:
                                                              FormBuilderTextField(
                                                            name: 'row',
                                                            decoration:
                                                                const InputDecoration(
                                                              labelText:
                                                                  'ردیف:',
                                                              labelStyle:
                                                                  TextStyle(
                                                                fontSize: 17,
                                                              ),
                                                            ),
                                                            validator:
                                                                FormBuilderValidators
                                                                    .compose([
                                                              FormBuilderValidators
                                                                  .required(),
                                                            ]),
                                                          )),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Expanded(
                                                          flex: 2,
                                                          child:
                                                              FormBuilderTextField(
                                                            name: 'length',
                                                            decoration:
                                                                const InputDecoration(
                                                              labelText:
                                                                  'تعداد/مدت(دقیه):',
                                                              labelStyle:
                                                                  TextStyle(
                                                                fontSize: 17,
                                                              ),
                                                            ),
                                                            validator:
                                                                FormBuilderValidators
                                                                    .compose([
                                                              FormBuilderValidators
                                                                  .required(),
                                                            ]),
                                                          )),
                                                    ],
                                                  )),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              //const Text('تگها'),
                                              TextFieldTags<String>(
                                                textfieldTagsController:
                                                    _stringTagController,
                                                initialTags: [],
                                                textSeparators: const [
                                                  ' ',
                                                  ','
                                                ],
                                                letterCase: LetterCase.normal,
                                                validator: (String tag) {
                                                  if (tag == 'php') {
                                                    return 'No, please just no';
                                                  } else if (_stringTagController
                                                      .getTags!
                                                      .contains(tag)) {
                                                    return 'You\'ve already entered that';
                                                  }
                                                  return null;
                                                },
                                                inputFieldBuilder: (context,
                                                    inputFieldValues) {
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10.0),
                                                    child: TextField(
                                                      onTap: () {
                                                        _stringTagController
                                                            .getFocusNode
                                                            ?.requestFocus();
                                                      },
                                                      controller: inputFieldValues
                                                          .textEditingController,
                                                      focusNode:
                                                          inputFieldValues
                                                              .focusNode,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        border:
                                                            const OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    74,
                                                                    137,
                                                                    92),
                                                            width: 3.0,
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            const OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    74,
                                                                    137,
                                                                    92),
                                                            width: 3.0,
                                                          ),
                                                        ),
                                                        helperText: '',
                                                        helperStyle:
                                                            const TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 74, 137, 92),
                                                        ),
                                                        hintText: inputFieldValues
                                                                .tags.isNotEmpty
                                                            ? ''
                                                            : "تگی را وارد کنید...",
                                                        errorText:
                                                            inputFieldValues
                                                                .error,
                                                        prefixIconConstraints:
                                                            BoxConstraints(
                                                                maxWidth:
                                                                    _distanceToField *
                                                                        0.8),
                                                        prefixIcon:
                                                            inputFieldValues
                                                                    .tags
                                                                    .isNotEmpty
                                                                ? SingleChildScrollView(
                                                                    controller:
                                                                        inputFieldValues
                                                                            .tagScrollController,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets
                                                                              .only(
                                                                        top: 8,
                                                                        bottom:
                                                                            8,
                                                                        left: 8,
                                                                      ),
                                                                      child: Wrap(
                                                                          runSpacing: 4.0,
                                                                          spacing: 4.0,
                                                                          children: inputFieldValues.tags.map((String tag) {
                                                                            return Container(
                                                                              decoration: const BoxDecoration(
                                                                                borderRadius: BorderRadius.all(
                                                                                  Radius.circular(20.0),
                                                                                ),
                                                                                color: Color.fromARGB(255, 74, 137, 92),
                                                                              ),
                                                                              margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                                                              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                children: [
                                                                                  InkWell(
                                                                                    child: Text(
                                                                                      '#$tag',
                                                                                      style: const TextStyle(color: Colors.white),
                                                                                    ),
                                                                                    onTap: () {
                                                                                      //print("$tag selected");
                                                                                    },
                                                                                  ),
                                                                                  const SizedBox(width: 4.0),
                                                                                  InkWell(
                                                                                    child: const Icon(
                                                                                      Icons.cancel,
                                                                                      size: 14.0,
                                                                                      color: Color.fromARGB(255, 233, 233, 233),
                                                                                    ),
                                                                                    onTap: () {
                                                                                      inputFieldValues.onTagRemoved(tag);
                                                                                    },
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            );
                                                                          }).toList()),
                                                                    ),
                                                                  )
                                                                : null,
                                                      ),
                                                      onChanged:
                                                          inputFieldValues
                                                              .onTagChanged,
                                                      onSubmitted:
                                                          inputFieldValues
                                                              .onTagSubmitted,
                                                    ),
                                                  );
                                                },
                                              ),
                                              // ElevatedButton(
                                              //   style: ButtonStyle(
                                              //     backgroundColor:
                                              //         MaterialStateProperty.all<
                                              //             Color>(
                                              //       const Color.fromARGB(
                                              //           255, 74, 137, 92),
                                              //     ),
                                              //   ),
                                              //   onPressed: () {
                                              //     _stringTagController
                                              //         .clearTags();
                                              //   },
                                              //   child: const Text(
                                              //     'پاک کردن تگها',
                                              //     style: TextStyle(
                                              //         color: Colors.white),
                                              //   ),
                                              // ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              FormBuilderChoiceChip<TypeItem>(
                                                alignment: WrapAlignment.center,
                                                name: 'type',
                                                selectedColor: Colors.white,
                                                backgroundColor:
                                                    Colors.purple.shade100,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.center,
                                                decoration:
                                                    const InputDecoration(
                                                        label: Text(
                                                  ' نوع محتوا: ',
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                )),
                                                onChanged: (value) {
                                                  // print(value);
                                                  state.type = value!;
                                                  setState(() {});
                                                },
                                                initialValue: state.type,
                                                spacing: 20,
                                                runSpacing: 10,
                                                labelStyle: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17),
                                                options: const [
                                                  FormBuilderChipOption(
                                                      value: TypeItem.GALLERY,
                                                      child: Row(
                                                        children: [
                                                          Text('آلبوم'),
                                                          Spacer(),
                                                          Icon(Icons.image)
                                                        ],
                                                      )),
                                                  FormBuilderChipOption(
                                                      value: TypeItem.ARTICEL,
                                                      child: Row(
                                                        children: [
                                                          Text('مقاله'),
                                                          Spacer(),
                                                          Icon(Icons.edit)
                                                        ],
                                                      )),
                                                  FormBuilderChipOption(
                                                      value: TypeItem.VIDEO,
                                                      child: Row(
                                                        children: [
                                                          Text('کلیپ'),
                                                          Spacer(),
                                                          Icon(Icons.videocam)
                                                        ],
                                                      )),
                                                  FormBuilderChipOption(
                                                      value: TypeItem.AUDIO,
                                                      child: Row(
                                                        children: [
                                                          Text('صوتی'),
                                                          Spacer(),
                                                          Icon(Icons.music_note)
                                                        ],
                                                      ))
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        //imageBuilder()
                                        IndexedStack(
                                          index: state.type.index,
                                          children: [
                                            gallerybuilder(images: []),
                                            articelBuilder(),
                                            videoBuilder(),
                                            audioBuilder()
                                          ],
                                        )
                                      ])))
                        ]))))));
  }
}
