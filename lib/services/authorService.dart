import '../entities/author.dart';
import '../entities/author.dart';
import 'package:isar/isar.dart';

import 'service.dart';

class AuthorLocalService {
  Future<Author?> getOne(int id) async {
    final item = isar.authors.get(id);
    return item;
  }

  Future<List<Author>> getAll({int page = 1, int take = 20}) async {
    final items =
        isar.authors.where().findAll(offset: page * take, limit: take);
    return items;
  }

  Future<Author> add(Author item) async {
    if (item.id == 0) {
      item = item.copyWith(id: isar.authors.autoIncrement());
    }
    await isar.write((isar) async {
      isar.authors.put(item); // insert & update
    });

    return item;
  }

  Future<Author> update(Author item) async {
    await isar.write((isar) async {
      isar.authors.put(item); // insert & update
    });

    return item;
  }

  Future<bool> del(Author author) async {
    final res = await isar.write((isar) async {
      return isar.authors.delete(author.id);
    });

    return res ? true : false;
  }

  Future<bool> clear() async {
    await isar.write((isar) async {
      isar.authors.clear();
    });
    return true;
  }
}
