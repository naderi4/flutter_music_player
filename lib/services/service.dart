import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:SocialLib/entities/author.dart';
import 'package:SocialLib/entities/category.dart';
import 'package:SocialLib/entities/collect.dart';
import 'package:SocialLib/entities/item.dart';
import 'package:SocialLib/entities/tag.dart';
import 'package:path_provider/path_provider.dart';

late Isar isar;

initIsardb() async {
  final path = Platform.isWindows
      ? Platform.resolvedExecutable.substring(
          0, Platform.resolvedExecutable.length - Platform.executable.length)
      : (await getApplicationDocumentsDirectory()).path;

  isar = Isar.open(schemas: [
    TagSchema,
    CategorySchema,
    AuthorSchema,
    CollectSchema,
    ItemSchema
  ], directory: path, name: 'rdb');
}

//////////////////////////////////////////

class ItemStateNotifier extends StateNotifier<ItemInfo> {
  ItemStateNotifier(this.ref) : super(ItemInfo.newone());

  final Ref ref;

  void rest() {
    state = ItemInfo.newone();
  }

  void recalc() {
    state = state.copyWith();
  }

  void setState(ItemInfo item) {
    state = item;
  }
}

///////////////////////////////////////

final itemProvider = StateNotifierProvider<ItemStateNotifier, ItemInfo>((ref) {
  return ItemStateNotifier(ref);
});

///////////////////////////////////////