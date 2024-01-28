import 'package:isar/isar.dart';
import 'package:music_player/entities/author.dart';
import 'package:music_player/entities/category.dart';

import 'tag.dart';
part 'collect.g.dart';

class CollectInfo {
  int id;
  String name;
  String img;
  int length;
  AuthorLink author;
  CategoryLink category;
  List<TagLink> tags;

  CollectInfo(
      {this.id = 0,
      this.name = '',
      this.img = '',
      this.length = 0,
      required this.author,
      required this.category,
      required this.tags});

  CollectInfo.newone({int? id, String? name, String? img, int? length})
      : this(
            id: id ?? 0,
            name: name ?? "",
            img: img ?? '',
            length: length ?? 0,
            author: AuthorLink(),
            category: CategoryLink(),
            tags: []);

  CollectInfo copyWith({
    int? id,
    String? name,
    String? img,
    int? length,
    AuthorLink? author,
    CategoryLink? category,
    List<TagLink>? tags,
  }) =>
      CollectInfo(
          id: id ?? this.id,
          name: name ?? this.name,
          img: img ?? this.img,
          length: length ?? 0,
          author: author ?? this.author,
          category: category ?? this.category,
          tags: tags ?? this.tags);

  factory CollectInfo.fromJson(Map<String, dynamic> map) {
    return CollectInfo(
        id: map['id'] as int,
        name: map['name'] as String,
        img: map['img'] as String,
        length: map['length'] as int,
        author: AuthorLink.clone(AuthorInfo.fromJson(map['author'])),
        category: CategoryLink.clone(CategoryInfo.fromJson(map['category'])),
        tags: (map['tags'] as List<dynamic>)
            .map((e) =>
                TagLink.clone(TagInfo.fromJson(e as Map<String, dynamic>)))
            .toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'img': img,
      'length': length,
      'author': author.toJson(),
      'category': category.toJson(),
      'tags': [for (var item in tags) item.toJson()] as Map<String, dynamic>
    };
  }
}

@collection
class Collect extends CollectInfo {
  @override
  int get id => super.id;

  Collect({
    super.id = 0,
    super.name = '',
    super.img = '',
    super.length = 0,
    required super.author,
    required super.category,
    super.tags = const [],
  });

  static Collect clone(CollectInfo info) => Collect(
      id: info.id,
      name: info.name,
      img: info.img,
      length: info.length,
      author: info.author,
      category: info.category);

  @override
  Collect copyWith({
    int? id,
    String? name,
    String? img,
    int? length,
    AuthorLink? author,
    CategoryLink? category,
    List<TagLink>? tags,
  }) =>
      Collect(
          id: id ?? this.id,
          name: name ?? this.name,
          img: img ?? this.img,
          length: length ?? this.length,
          author: author ?? this.author,
          category: category ?? this.category,
          tags: tags ?? this.tags);
}

@embedded
class CollectLink extends CollectInfo {
  @override
  int get id => super.id;

  CollectLink({
    super.id = 0,
    super.name = '',
    super.img = '',
    super.length = 0,
    required super.author,
    required super.category,
    super.tags = const [],
  });

  static CollectLink clone(CollectInfo info) => CollectLink(
      id: info.id,
      name: info.name,
      img: info.img,
      length: info.length,
      author: info.author,
      category: info.category);

  @override
  CollectLink copyWith({
    int? id,
    String? name,
    String? img,
    int? length,
    AuthorLink? author,
    CategoryLink? category,
    List<TagLink>? tags,
  }) =>
      CollectLink(
          id: id ?? this.id,
          name: name ?? this.name,
          img: img ?? this.img,
          length: length ?? this.length,
          author: author ?? this.author,
          category: category ?? this.category,
          tags: tags ?? this.tags);
}
