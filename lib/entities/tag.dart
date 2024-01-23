import 'package:isar/isar.dart';
part 'tag.g.dart';

class TagInfo {
  final int id;
  final String name;

  TagInfo({
    this.id = 0,
    this.name = '',
  });

  TagInfo.newone({
    int? id,
    String? name,
  }) : this(
          id: id ?? 0,
          name: name ?? "",
        );

  TagInfo copyWith({
    int? id,
    String? name,
  }) =>
      TagInfo(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory TagInfo.fromJson(Map<String, dynamic> map) {
    return TagInfo(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

@collection
class Tag extends TagInfo {
  @override
  int get id => super.id;

  Tag({
    super.id = 0,
    super.name = '',
  });

  static Tag clone(TagInfo info) => Tag(id: info.id, name: info.name);

  @override
  Tag copyWith({
    int? id,
    String? name,
  }) =>
      Tag(
        id: id ?? this.id,
        name: name ?? this.name,
      );
}

@embedded
class TagLink extends TagInfo {
  @override
  int get id => super.id;

  TagLink({
    super.id = 0,
    super.name = '',
  });

  static TagLink clone(TagInfo info) => TagLink(id: info.id, name: info.name);

  @override
  TagLink copyWith({
    int? id,
    String? name,
  }) =>
      TagLink(
        id: id ?? this.id,
        name: name ?? this.name,
      );
}
