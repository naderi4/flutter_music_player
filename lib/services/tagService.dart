import '../entities/tag.dart';
import 'package:isar/isar.dart';

import 'service.dart';

class TagLocalService {
  Future<Tag?> getOne(int id) async {
    final item = isar.tags.get(id);
    return item;
  }

  Future<List<Tag>> getAll({int page = 1, int take = 20}) async {
    final items = isar.tags.where().findAll(offset: page * take, limit: take);
    return items;
  }

  Future<Tag> add(Tag item) async {
    if (item.id == 0) {
      item = item.copyWith(id: isar.tags.autoIncrement());
    }
    await isar.write((isar) async {
      isar.tags.put(item); // insert & update
    });

    return item;
  }

  Future<Tag> update(Tag item) async {
    await isar.write((isar) async {
      isar.tags.put(item); // insert & update
    });

    return item;
  }

  Future<bool> del(Tag tag) async {
    final res = await isar.write((isar) async {
      return isar.tags.delete(tag.id);
    });

    return res ? true : false;
  }

  Future<bool> clear() async {
    await isar.write((isar) async {
      isar.tags.clear();
    });
    return true;
  }
}
