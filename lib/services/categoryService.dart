import '../entities/category.dart';
import 'package:isar/isar.dart';

import 'service.dart';

class CategoryLocalService {
  Future<Category?> getOne(int id) async {
    final item = isar.categorys.get(id);
    return item;
  }

  Future<List<Category>> getAll({int page = 1, int take = 20}) async {
    final items =
        isar.categorys.where().findAll(offset: page * take, limit: take);
    return items;
  }

  Future<Category> add(Category item) async {
    if (item.id == 0) {
      item = item.copyWith(id: isar.categorys.autoIncrement());
    }
    await isar.write((isar) async {
      isar.categorys.put(item); // insert & update
    });

    return item;
  }

  Future<Category> update(Category item) async {
    await isar.write((isar) async {
      isar.categorys.put(item); // insert & update
    });

    return item;
  }

  Future<bool> del(Category category) async {
    final res = await isar.write((isar) async {
      return isar.categorys.delete(category.id);
    });

    return res ? true : false;
  }

  Future<bool> clear() async {
    await isar.write((isar) async {
      isar.categorys.clear();
    });
    return true;
  }
}
