import '../entities/collect.dart';
import 'package:isar/isar.dart';

import 'service.dart';

class CollectLocalService {
  Future<Collect?> getOne(int id) async {
    final item = isar.collects.get(id);
    return item;
  }

  Future<List<Collect>> getAll({int page = 1, int take = 20}) async {
    final items =
        isar.collects.where().findAll(offset: page * take, limit: take);
    return items;
  }

  Future<Collect> add(Collect item) async {
    if (item.id == 0) {
      item = item.copyWith(id: isar.collects.autoIncrement());
    }
    await isar.write((isar) async {
      isar.collects.put(item); // insert & update
    });

    return item;
  }

  Future<Collect> update(Collect item) async {
    await isar.write((isar) async {
      isar.collects.put(item); // insert & update
    });

    return item;
  }

  Future<bool> del(Collect collect) async {
    final res = await isar.write((isar) async {
      return isar.collects.delete(collect.id);
    });

    return res ? true : false;
  }

  Future<bool> clear() async {
    await isar.write((isar) async {
      isar.collects.clear();
    });
    return true;
  }
}
