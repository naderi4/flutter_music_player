import 'package:flutter/material.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_player/gallery/Slider.dart';

class imageBuilder extends StatefulHookConsumerWidget {
  const imageBuilder({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _imageBuilderState();
}

class _imageBuilderState extends ConsumerState<imageBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FormBuilderImagePicker(
        name: 'photos',
        previewAutoSizeWidth: true,
        showDecoration: true,
        previewWidth: MediaQuery.of(context).size.width,
        previewHeight: MediaQuery.of(context).size.height - 200,
        previewMargin: const EdgeInsetsDirectional.only(end: 8),
        decoration: const InputDecoration(labelText: 'انتخاب عکس'),
        // transformImageWidget: (context, displayImage) => Card(
        //   shape: const CircleBorder(),
        //   clipBehavior: Clip.antiAlias,
        //   child: SizedBox.expand(
        //     child: displayImage,
        //   ),
        // ),
        maxImages: 1,
        //fit: BoxFit.contain,
        //backgroundColor: Colors.black54,
        iconColor: Colors.white,
        onTap: (p) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => SliderPhoto(
                        images: [],
                      ),
                  fullscreenDialog: false));
        },
        //icon: Icons.image,
      ),
    );
  }
}
