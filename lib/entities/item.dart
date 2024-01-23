import 'dart:js_interop';

import 'package:isar/isar.dart';
import 'package:music_player/entities/author.dart';
import 'package:music_player/entities/category.dart';
import 'package:music_player/entities/collect.dart';

import 'tag.dart';
part 'item.g.dart';

enum TypeItem { NON, GALLERY, ARTICEL, VIDEO, AUDIO }

class ItemInfo {
  int id;
  String name;
  String img;
  int length;
  AuthorLink author;
  CollectLink collect;
  List<TagLink> tags;
  TypeItem type;
  String file;
  DateTime dateCreate;
  DateTime dateUpdate;

  ItemInfo(
      {this.id = 0,
      this.name = '',
      this.img = '',
      this.length = 0,
      this.type = TypeItem.NON,
      this.file = '',
      required this.dateCreate,
      required this.dateUpdate,
      required this.author,
      required this.collect,
      required this.tags});

  ItemInfo.newone({int? id, String? name, String? img, int? length})
      : this(
            id: id ?? 0,
            name: name ?? "",
            img: img ?? '',
            length: length ?? 0,
            type: TypeItem.NON,
            file: '',
            dateCreate: DateTime.now(),
            dateUpdate: DateTime.now(),
            collect: CollectLink.clone(CollectInfo.newone()),
            author: AuthorLink(),
            tags: []);

  ItemInfo copyWith(
          {int? id,
          String? name,
          String? img,
          int? length,
          DateTime? dateCreate,
          DateTime? dateUpdate,
          List<TagLink>? tags,
          AuthorLink? author,
          CollectLink? collect}) =>
      ItemInfo(
        id: id ?? this.id,
        name: name ?? this.name,
        img: img ?? this.img,
        length: length ?? 0,
        tags: tags ?? this.tags,
        dateCreate: dateCreate ?? this.dateCreate,
        dateUpdate: dateUpdate ?? this.dateUpdate,
        author: author ?? this.author,
        collect: collect ?? this.collect,
      );

  factory ItemInfo.fromJson(Map<String, dynamic> map) {
    return ItemInfo(
        id: map['id'] as int,
        name: map['name'] as String,
        img: map['img'] as String,
        length: map['length'] as int,
        author: AuthorLink.clone(AuthorInfo.fromJson(map['author'])),
        tags: (map['tags'] as List<dynamic>)
            .map((e) =>
                TagLink.clone(TagInfo.fromJson(e as Map<String, dynamic>)))
            .toList(),
        dateCreate: map['dateCreate'] as DateTime,
        dateUpdate: map['dateUpdate'] as DateTime,
        collect: CollectLink.clone(CollectInfo.fromJson(map['collect'])));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'img': img,
      'length': length,
      'author': author.toJson(),
      'dateCreate': dateCreate,
      'dateUpdate': dateUpdate,
      'collect': collect.toJson(),
      'tags': [for (var item in tags) item.toJson()] as Map<String, dynamic>
    };
  }
}

@collection
class Item extends ItemInfo {
  @override
  int get id => super.id;

  Item({
    super.id = 0,
    super.name = '',
    super.img = '',
    super.length = 0,
    required super.author,
    required super.tags,
    required super.dateCreate,
    required super.dateUpdate,
    required super.collect,
  });

  @override
  Item copyWith(
          {int? id,
          String? name,
          String? img,
          int? length,
          DateTime? dateCreate,
          DateTime? dateUpdate,
          List<TagLink>? tags,
          AuthorLink? author,
          CollectLink? collect}) =>
      Item(
          id: id ?? this.id,
          name: name ?? this.name,
          img: img ?? this.img,
          length: length ?? this.length,
          tags: [],
          dateCreate: dateCreate ?? this.dateCreate,
          dateUpdate: dateUpdate ?? this.dateUpdate,
          author: author ?? this.author,
          collect: collect ?? this.collect);
}

@embedded
class ItemLink extends ItemInfo {
  @override
  int get id => super.id;

  ItemLink({
    super.id = 0,
    super.name = '',
    super.img = '',
    super.length = 0,
    required super.author,
    required super.tags,
    required super.dateCreate,
    required super.dateUpdate,
    required super.collect,
  });

  @override
  ItemLink copyWith(
          {int? id,
          String? name,
          String? img,
          int? length,
          DateTime? dateCreate,
          DateTime? dateUpdate,
          List<TagLink>? tags,
          AuthorLink? author,
          CollectLink? collect}) =>
      ItemLink(
        id: id ?? this.id,
        name: name ?? this.name,
        img: img ?? this.img,
        length: length ?? this.length,
        tags: [],
        dateCreate: dateCreate ?? this.dateCreate,
        dateUpdate: dateUpdate ?? this.dateUpdate,
        author: author ?? this.author,
        collect: collect ?? this.collect,
      );
}
