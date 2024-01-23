import 'dart:io';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

late Isar isar;

initIsar() async {
  final path = Platform.isWindows
      ? Platform.resolvedExecutable.substring(
          0, Platform.resolvedExecutable.length - Platform.executable.length)
      : (await getApplicationDocumentsDirectory()).path;

  isar = Isar.open(schemas: [], directory: path, name: 'rdb');
}

////
