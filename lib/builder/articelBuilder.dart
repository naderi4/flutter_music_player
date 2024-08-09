import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../articel/editor.dart';

class articelBuilder extends StatefulHookConsumerWidget {
  const articelBuilder({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _articelBuilderState();
}

class _articelBuilderState extends ConsumerState<articelBuilder> {
  @override
  Widget build(BuildContext context) {
    return ArticelEditor();
  }
}
