import '../entities/item.dart';
import 'package:isar/isar.dart';

import 'service.dart';

class ItemLocalService {
  Future<Item?> getOne(int id) async {
    final item = isar.items.get(id);
    return item;
  }

  Future<List<Item>> getAll({int page = 1, int take = 20}) async {
    final items = isar.items.where().findAll(offset: page * take, limit: take);
    return items;
  }

  Future<Item> add(Item item) async {
    if (item.id == 0) {
      item = item.copyWith(id: isar.items.autoIncrement());
    }
    await isar.write((isar) async {
      isar.items.put(item); // insert & update
    });

    return item;
  }

  Future<Item> update(Item item) async {
    await isar.write((isar) async {
      isar.items.put(item); // insert & update
    });

    return item;
  }

  Future<bool> del(Item item) async {
    final res = await isar.write((isar) async {
      return isar.items.delete(item.id);
    });

    return res ? true : false;
  }

  Future<bool> clear() async {
    await isar.write((isar) async {
      isar.items.clear();
    });
    return true;
  }
}
