import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../articel/editor.dart';
import '../articel/quill_screen.dart';

class articelBuilder extends StatefulHookConsumerWidget {
  const articelBuilder({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _articelBuilderState();
}

class _articelBuilderState extends ConsumerState<articelBuilder> {
  @override
  Widget build(BuildContext context) {
    return /*ArticelEditor()*/ QuillScreen(
        args: QuillScreenArgs(
      document: Document(),
    ));
  }
}
