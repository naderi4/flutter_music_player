import 'package:isar/isar.dart';
part 'category.g.dart';

class CategoryInfo {
  int id;
  String name;
  String img;
  int length;

  CategoryInfo({this.id = 0, this.name = '', this.img = '', this.length = 0});

  CategoryInfo.newone({int? id, String? name, String? img, int? length})
      : this(
            id: id ?? 0, name: name ?? "", img: img ?? '', length: length ?? 0);

  CategoryInfo copyWith({int? id, String? name, String? img, int? length}) =>
      CategoryInfo(
          id: id ?? this.id,
          name: name ?? this.name,
          img: img ?? this.img,
          length: length ?? 0);

  factory CategoryInfo.fromJson(Map<String, dynamic> map) {
    return CategoryInfo(
      id: map['id'] as int,
      name: map['name'] as String,
      img: map['img'] as String,
      length: map['length'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'img': img, 'length': length};
  }
}

@collection
class Category extends CategoryInfo {
  @override
  int get id => super.id;

  Category({
    super.id = 0,
    super.name = '',
    super.img = '',
    super.length = 0,
  });

  static Category clone(CategoryInfo info) => Category(
      id: info.id, name: info.name, img: info.img, length: info.length);

  @override
  Category copyWith({int? id, String? name, String? img, int? length}) =>
      Category(
          id: id ?? this.id,
          name: name ?? this.name,
          img: img ?? this.img,
          length: length ?? this.length);
}

@embedded
class CategoryLink extends CategoryInfo {
  @override
  int get id => super.id;

  CategoryLink(
      {super.id = 0, super.name = '', super.img = '', super.length = 0});

  static CategoryLink clone(CategoryInfo info) => CategoryLink(
      id: info.id, name: info.name, img: info.img, length: info.length);

  @override
  CategoryLink copyWith({int? id, String? name, String? img, int? length}) =>
      CategoryLink(
          id: id ?? this.id,
          name: name ?? this.name,
          img: img ?? this.img,
          length: length ?? this.length);
}
