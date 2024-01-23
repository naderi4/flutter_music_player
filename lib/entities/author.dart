import 'package:isar/isar.dart';
part 'author.g.dart';

class AuthorInfo {
  int id;
  String name;
  String img;

  AuthorInfo({this.id = 0, this.name = '', this.img = ''});

  AuthorInfo.newone({int? id, String? name, String? img})
      : this(id: id ?? 0, name: name ?? "", img: img ?? '');

  AuthorInfo copyWith({int? id, String? name, String? img}) => AuthorInfo(
        id: id ?? this.id,
        name: name ?? this.name,
        img: img ?? this.img,
      );

  factory AuthorInfo.fromJson(Map<String, dynamic> map) {
    return AuthorInfo(
      id: map['id'] as int,
      name: map['name'] as String,
      img: map['img'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'img': img,
    };
  }
}

@collection
class Author extends AuthorInfo {
  @override
  int get id => super.id;

  Author({
    super.id = 0,
    super.name = '',
    super.img = '',
  });

  static Author clone(AuthorInfo info) =>
      Author(id: info.id, name: info.name, img: info.img);

  @override
  Author copyWith({int? id, String? name, String? img}) => Author(
        id: id ?? this.id,
        name: name ?? this.name,
        img: img ?? this.img,
      );
}

@embedded
class AuthorLink extends AuthorInfo {
  @override
  int get id => super.id;

  AuthorLink({
    super.id = 0,
    super.name = '',
    super.img = '',
  });

  static AuthorLink clone(AuthorInfo info) =>
      AuthorLink(id: info.id, name: info.name, img: info.img);

  @override
  AuthorLink copyWith({int? id, String? name, String? img}) => AuthorLink(
        id: id ?? this.id,
        name: name ?? this.name,
        img: img ?? this.img,
      );
}
