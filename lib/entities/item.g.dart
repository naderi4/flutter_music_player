// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetItemCollection on Isar {
  IsarCollection<int, Item> get items => this.collection();
}

const ItemSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'Item',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'name',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'img',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'length',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'author',
        type: IsarType.object,
        target: 'AuthorLink',
      ),
      IsarPropertySchema(
        name: 'collect',
        type: IsarType.object,
        target: 'CollectLink',
      ),
      IsarPropertySchema(
        name: 'tags',
        type: IsarType.objectList,
        target: 'TagLink',
      ),
      IsarPropertySchema(
        name: 'type',
        type: IsarType.byte,
        enumMap: {"NON": 0, "GALLERY": 1, "ARTICEL": 2, "VIDEO": 3, "AUDIO": 4},
      ),
      IsarPropertySchema(
        name: 'file',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'dateCreate',
        type: IsarType.dateTime,
      ),
      IsarPropertySchema(
        name: 'dateUpdate',
        type: IsarType.dateTime,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, Item>(
    serialize: serializeItem,
    deserialize: deserializeItem,
    deserializeProperty: deserializeItemProp,
  ),
  embeddedSchemas: [
    AuthorLinkSchema,
    CollectLinkSchema,
    CategoryLinkSchema,
    TagLinkSchema
  ],
);

@isarProtected
int serializeItem(IsarWriter writer, Item object) {
  IsarCore.writeString(writer, 1, object.name);
  IsarCore.writeString(writer, 2, object.img);
  IsarCore.writeLong(writer, 3, object.length);
  {
    final value = object.author;
    final objectWriter = IsarCore.beginObject(writer, 4);
    serializeAuthorLink(objectWriter, value);
    IsarCore.endObject(writer, objectWriter);
  }
  {
    final value = object.collect;
    final objectWriter = IsarCore.beginObject(writer, 5);
    serializeCollectLink(objectWriter, value);
    IsarCore.endObject(writer, objectWriter);
  }
  {
    final list = object.tags;
    final listWriter = IsarCore.beginList(writer, 6, list.length);
    for (var i = 0; i < list.length; i++) {
      {
        final value = list[i];
        final objectWriter = IsarCore.beginObject(listWriter, i);
        serializeTagLink(objectWriter, value);
        IsarCore.endObject(listWriter, objectWriter);
      }
    }
    IsarCore.endList(writer, listWriter);
  }
  IsarCore.writeByte(writer, 7, object.type.index);
  IsarCore.writeString(writer, 8, object.file);
  IsarCore.writeLong(
      writer, 9, object.dateCreate.toUtc().microsecondsSinceEpoch);
  IsarCore.writeLong(
      writer, 10, object.dateUpdate.toUtc().microsecondsSinceEpoch);
  return object.id;
}

@isarProtected
Item deserializeItem(IsarReader reader) {
  final int _id;
  _id = IsarCore.readId(reader);
  final String _name;
  _name = IsarCore.readString(reader, 1) ?? '';
  final String _img;
  _img = IsarCore.readString(reader, 2) ?? '';
  final int _length;
  {
    final value = IsarCore.readLong(reader, 3);
    if (value == -9223372036854775808) {
      _length = 0;
    } else {
      _length = value;
    }
  }
  final AuthorLink _author;
  {
    final objectReader = IsarCore.readObject(reader, 4);
    if (objectReader.isNull) {
      _author = AuthorLink();
    } else {
      final embedded = deserializeAuthorLink(objectReader);
      IsarCore.freeReader(objectReader);
      _author = embedded;
    }
  }
  final CollectLink _collect;
  {
    final objectReader = IsarCore.readObject(reader, 5);
    if (objectReader.isNull) {
      _collect = CollectLink(
        author: AuthorLink(),
        category: CategoryLink(),
      );
    } else {
      final embedded = deserializeCollectLink(objectReader);
      IsarCore.freeReader(objectReader);
      _collect = embedded;
    }
  }
  final List<TagLink> _tags;
  {
    final length = IsarCore.readList(reader, 6, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _tags = const <TagLink>[];
      } else {
        final list = List<TagLink>.filled(length, TagLink(), growable: true);
        for (var i = 0; i < length; i++) {
          {
            final objectReader = IsarCore.readObject(reader, i);
            if (objectReader.isNull) {
              list[i] = TagLink();
            } else {
              final embedded = deserializeTagLink(objectReader);
              IsarCore.freeReader(objectReader);
              list[i] = embedded;
            }
          }
        }
        IsarCore.freeReader(reader);
        _tags = list;
      }
    }
  }
  final DateTime _dateCreate;
  {
    final value = IsarCore.readLong(reader, 9);
    if (value == -9223372036854775808) {
      _dateCreate =
          DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
    } else {
      _dateCreate =
          DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  final DateTime _dateUpdate;
  {
    final value = IsarCore.readLong(reader, 10);
    if (value == -9223372036854775808) {
      _dateUpdate =
          DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
    } else {
      _dateUpdate =
          DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  final object = Item(
    id: _id,
    name: _name,
    img: _img,
    length: _length,
    author: _author,
    collect: _collect,
    tags: _tags,
    dateCreate: _dateCreate,
    dateUpdate: _dateUpdate,
  );
  {
    if (IsarCore.readNull(reader, 7)) {
      object.type = TypeItem.NON;
    } else {
      object.type = _itemType[IsarCore.readByte(reader, 7)] ?? TypeItem.NON;
    }
  }
  object.file = IsarCore.readString(reader, 8) ?? '';
  return object;
}

@isarProtected
dynamic deserializeItemProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      return IsarCore.readString(reader, 2) ?? '';
    case 3:
      {
        final value = IsarCore.readLong(reader, 3);
        if (value == -9223372036854775808) {
          return 0;
        } else {
          return value;
        }
      }
    case 4:
      {
        final objectReader = IsarCore.readObject(reader, 4);
        if (objectReader.isNull) {
          return AuthorLink();
        } else {
          final embedded = deserializeAuthorLink(objectReader);
          IsarCore.freeReader(objectReader);
          return embedded;
        }
      }
    case 5:
      {
        final objectReader = IsarCore.readObject(reader, 5);
        if (objectReader.isNull) {
          return CollectLink(
            author: AuthorLink(),
            category: CategoryLink(),
          );
        } else {
          final embedded = deserializeCollectLink(objectReader);
          IsarCore.freeReader(objectReader);
          return embedded;
        }
      }
    case 6:
      {
        final length = IsarCore.readList(reader, 6, IsarCore.readerPtrPtr);
        {
          final reader = IsarCore.readerPtr;
          if (reader.isNull) {
            return const <TagLink>[];
          } else {
            final list =
                List<TagLink>.filled(length, TagLink(), growable: true);
            for (var i = 0; i < length; i++) {
              {
                final objectReader = IsarCore.readObject(reader, i);
                if (objectReader.isNull) {
                  list[i] = TagLink();
                } else {
                  final embedded = deserializeTagLink(objectReader);
                  IsarCore.freeReader(objectReader);
                  list[i] = embedded;
                }
              }
            }
            IsarCore.freeReader(reader);
            return list;
          }
        }
      }
    case 7:
      {
        if (IsarCore.readNull(reader, 7)) {
          return TypeItem.NON;
        } else {
          return _itemType[IsarCore.readByte(reader, 7)] ?? TypeItem.NON;
        }
      }
    case 8:
      return IsarCore.readString(reader, 8) ?? '';
    case 9:
      {
        final value = IsarCore.readLong(reader, 9);
        if (value == -9223372036854775808) {
          return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true)
              .toLocal();
        }
      }
    case 10:
      {
        final value = IsarCore.readLong(reader, 10);
        if (value == -9223372036854775808) {
          return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true)
              .toLocal();
        }
      }
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _ItemUpdate {
  bool call({
    required int id,
    String? name,
    String? img,
    int? length,
    TypeItem? type,
    String? file,
    DateTime? dateCreate,
    DateTime? dateUpdate,
  });
}

class _ItemUpdateImpl implements _ItemUpdate {
  const _ItemUpdateImpl(this.collection);

  final IsarCollection<int, Item> collection;

  @override
  bool call({
    required int id,
    Object? name = ignore,
    Object? img = ignore,
    Object? length = ignore,
    Object? type = ignore,
    Object? file = ignore,
    Object? dateCreate = ignore,
    Object? dateUpdate = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (name != ignore) 1: name as String?,
          if (img != ignore) 2: img as String?,
          if (length != ignore) 3: length as int?,
          if (type != ignore) 7: type as TypeItem?,
          if (file != ignore) 8: file as String?,
          if (dateCreate != ignore) 9: dateCreate as DateTime?,
          if (dateUpdate != ignore) 10: dateUpdate as DateTime?,
        }) >
        0;
  }
}

sealed class _ItemUpdateAll {
  int call({
    required List<int> id,
    String? name,
    String? img,
    int? length,
    TypeItem? type,
    String? file,
    DateTime? dateCreate,
    DateTime? dateUpdate,
  });
}

class _ItemUpdateAllImpl implements _ItemUpdateAll {
  const _ItemUpdateAllImpl(this.collection);

  final IsarCollection<int, Item> collection;

  @override
  int call({
    required List<int> id,
    Object? name = ignore,
    Object? img = ignore,
    Object? length = ignore,
    Object? type = ignore,
    Object? file = ignore,
    Object? dateCreate = ignore,
    Object? dateUpdate = ignore,
  }) {
    return collection.updateProperties(id, {
      if (name != ignore) 1: name as String?,
      if (img != ignore) 2: img as String?,
      if (length != ignore) 3: length as int?,
      if (type != ignore) 7: type as TypeItem?,
      if (file != ignore) 8: file as String?,
      if (dateCreate != ignore) 9: dateCreate as DateTime?,
      if (dateUpdate != ignore) 10: dateUpdate as DateTime?,
    });
  }
}

extension ItemUpdate on IsarCollection<int, Item> {
  _ItemUpdate get update => _ItemUpdateImpl(this);

  _ItemUpdateAll get updateAll => _ItemUpdateAllImpl(this);
}

sealed class _ItemQueryUpdate {
  int call({
    String? name,
    String? img,
    int? length,
    TypeItem? type,
    String? file,
    DateTime? dateCreate,
    DateTime? dateUpdate,
  });
}

class _ItemQueryUpdateImpl implements _ItemQueryUpdate {
  const _ItemQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<Item> query;
  final int? limit;

  @override
  int call({
    Object? name = ignore,
    Object? img = ignore,
    Object? length = ignore,
    Object? type = ignore,
    Object? file = ignore,
    Object? dateCreate = ignore,
    Object? dateUpdate = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (name != ignore) 1: name as String?,
      if (img != ignore) 2: img as String?,
      if (length != ignore) 3: length as int?,
      if (type != ignore) 7: type as TypeItem?,
      if (file != ignore) 8: file as String?,
      if (dateCreate != ignore) 9: dateCreate as DateTime?,
      if (dateUpdate != ignore) 10: dateUpdate as DateTime?,
    });
  }
}

extension ItemQueryUpdate on IsarQuery<Item> {
  _ItemQueryUpdate get updateFirst => _ItemQueryUpdateImpl(this, limit: 1);

  _ItemQueryUpdate get updateAll => _ItemQueryUpdateImpl(this);
}

class _ItemQueryBuilderUpdateImpl implements _ItemQueryUpdate {
  const _ItemQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<Item, Item, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? name = ignore,
    Object? img = ignore,
    Object? length = ignore,
    Object? type = ignore,
    Object? file = ignore,
    Object? dateCreate = ignore,
    Object? dateUpdate = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (name != ignore) 1: name as String?,
        if (img != ignore) 2: img as String?,
        if (length != ignore) 3: length as int?,
        if (type != ignore) 7: type as TypeItem?,
        if (file != ignore) 8: file as String?,
        if (dateCreate != ignore) 9: dateCreate as DateTime?,
        if (dateUpdate != ignore) 10: dateUpdate as DateTime?,
      });
    } finally {
      q.close();
    }
  }
}

extension ItemQueryBuilderUpdate on QueryBuilder<Item, Item, QOperations> {
  _ItemQueryUpdate get updateFirst =>
      _ItemQueryBuilderUpdateImpl(this, limit: 1);

  _ItemQueryUpdate get updateAll => _ItemQueryBuilderUpdateImpl(this);
}

const _itemType = {
  0: TypeItem.NON,
  1: TypeItem.GALLERY,
  2: TypeItem.ARTICEL,
  3: TypeItem.VIDEO,
  4: TypeItem.AUDIO,
};

extension ItemQueryFilter on QueryBuilder<Item, Item, QFilterCondition> {
  QueryBuilder<Item, Item, QAfterFilterCondition> idEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> idGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> idGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> idLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> idLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> idBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 0,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> nameGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> nameLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> nameLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> imgEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> imgGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> imgGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> imgLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> imgLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> imgBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> imgStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> imgEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> imgContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> imgMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 2,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> imgIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> imgIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> lengthEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> lengthGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> lengthGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> lengthLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> lengthLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> lengthBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> tagsIsEmpty() {
    return not().tagsIsNotEmpty();
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 6, value: null),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> typeEqualTo(
    TypeItem value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 7,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> typeGreaterThan(
    TypeItem value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 7,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> typeGreaterThanOrEqualTo(
    TypeItem value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 7,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> typeLessThan(
    TypeItem value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 7,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> typeLessThanOrEqualTo(
    TypeItem value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 7,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> typeBetween(
    TypeItem lower,
    TypeItem upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 7,
          lower: lower.index,
          upper: upper.index,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> fileEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 8,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> fileGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 8,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> fileGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 8,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> fileLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 8,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> fileLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 8,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> fileBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 8,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> fileStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 8,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> fileEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 8,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> fileContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 8,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> fileMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 8,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> fileIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 8,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> fileIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 8,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> dateCreateEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 9,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> dateCreateGreaterThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 9,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition>
      dateCreateGreaterThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 9,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> dateCreateLessThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 9,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> dateCreateLessThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 9,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> dateCreateBetween(
    DateTime lower,
    DateTime upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 9,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> dateUpdateEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 10,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> dateUpdateGreaterThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 10,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition>
      dateUpdateGreaterThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 10,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> dateUpdateLessThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 10,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> dateUpdateLessThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 10,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> dateUpdateBetween(
    DateTime lower,
    DateTime upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 10,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }
}

extension ItemQueryObject on QueryBuilder<Item, Item, QFilterCondition> {
  QueryBuilder<Item, Item, QAfterFilterCondition> author(
      FilterQuery<AuthorLink> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, 4);
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> collect(
      FilterQuery<CollectLink> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, 5);
    });
  }
}

extension ItemQuerySortBy on QueryBuilder<Item, Item, QSortBy> {
  QueryBuilder<Item, Item, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> sortByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> sortByNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> sortByImg(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> sortByImgDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> sortByLength() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> sortByLengthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7, sort: Sort.desc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> sortByFile(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        8,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> sortByFileDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        8,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> sortByDateCreate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(9);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> sortByDateCreateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(9, sort: Sort.desc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> sortByDateUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(10);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> sortByDateUpdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(10, sort: Sort.desc);
    });
  }
}

extension ItemQuerySortThenBy on QueryBuilder<Item, Item, QSortThenBy> {
  QueryBuilder<Item, Item, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByImg(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByImgDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByLength() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByLengthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7, sort: Sort.desc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByFile(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(8, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByFileDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(8, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByDateCreate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(9);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByDateCreateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(9, sort: Sort.desc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByDateUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(10);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByDateUpdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(10, sort: Sort.desc);
    });
  }
}

extension ItemQueryWhereDistinct on QueryBuilder<Item, Item, QDistinct> {
  QueryBuilder<Item, Item, QAfterDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Item, Item, QAfterDistinct> distinctByImg(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Item, Item, QAfterDistinct> distinctByLength() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3);
    });
  }

  QueryBuilder<Item, Item, QAfterDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(7);
    });
  }

  QueryBuilder<Item, Item, QAfterDistinct> distinctByFile(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(8, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Item, Item, QAfterDistinct> distinctByDateCreate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(9);
    });
  }

  QueryBuilder<Item, Item, QAfterDistinct> distinctByDateUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(10);
    });
  }
}

extension ItemQueryProperty1 on QueryBuilder<Item, Item, QProperty> {
  QueryBuilder<Item, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<Item, String, QAfterProperty> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Item, String, QAfterProperty> imgProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<Item, int, QAfterProperty> lengthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<Item, AuthorLink, QAfterProperty> authorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<Item, CollectLink, QAfterProperty> collectProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<Item, List<TagLink>, QAfterProperty> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<Item, TypeItem, QAfterProperty> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<Item, String, QAfterProperty> fileProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }

  QueryBuilder<Item, DateTime, QAfterProperty> dateCreateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(9);
    });
  }

  QueryBuilder<Item, DateTime, QAfterProperty> dateUpdateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(10);
    });
  }
}

extension ItemQueryProperty2<R> on QueryBuilder<Item, R, QAfterProperty> {
  QueryBuilder<Item, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<Item, (R, String), QAfterProperty> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Item, (R, String), QAfterProperty> imgProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<Item, (R, int), QAfterProperty> lengthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<Item, (R, AuthorLink), QAfterProperty> authorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<Item, (R, CollectLink), QAfterProperty> collectProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<Item, (R, List<TagLink>), QAfterProperty> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<Item, (R, TypeItem), QAfterProperty> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<Item, (R, String), QAfterProperty> fileProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }

  QueryBuilder<Item, (R, DateTime), QAfterProperty> dateCreateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(9);
    });
  }

  QueryBuilder<Item, (R, DateTime), QAfterProperty> dateUpdateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(10);
    });
  }
}

extension ItemQueryProperty3<R1, R2>
    on QueryBuilder<Item, (R1, R2), QAfterProperty> {
  QueryBuilder<Item, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<Item, (R1, R2, String), QOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Item, (R1, R2, String), QOperations> imgProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<Item, (R1, R2, int), QOperations> lengthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<Item, (R1, R2, AuthorLink), QOperations> authorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<Item, (R1, R2, CollectLink), QOperations> collectProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<Item, (R1, R2, List<TagLink>), QOperations> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<Item, (R1, R2, TypeItem), QOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<Item, (R1, R2, String), QOperations> fileProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }

  QueryBuilder<Item, (R1, R2, DateTime), QOperations> dateCreateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(9);
    });
  }

  QueryBuilder<Item, (R1, R2, DateTime), QOperations> dateUpdateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(10);
    });
  }
}

// **************************************************************************
// _IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

const ItemLinkSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'ItemLink',
    embedded: true,
    properties: [
      IsarPropertySchema(
        name: 'id',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'name',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'img',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'length',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'author',
        type: IsarType.object,
        target: 'AuthorLink',
      ),
      IsarPropertySchema(
        name: 'collect',
        type: IsarType.object,
        target: 'CollectLink',
      ),
      IsarPropertySchema(
        name: 'tags',
        type: IsarType.objectList,
        target: 'TagLink',
      ),
      IsarPropertySchema(
        name: 'type',
        type: IsarType.byte,
        enumMap: {"NON": 0, "GALLERY": 1, "ARTICEL": 2, "VIDEO": 3, "AUDIO": 4},
      ),
      IsarPropertySchema(
        name: 'file',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'dateCreate',
        type: IsarType.dateTime,
      ),
      IsarPropertySchema(
        name: 'dateUpdate',
        type: IsarType.dateTime,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<void, ItemLink>(
    serialize: serializeItemLink,
    deserialize: deserializeItemLink,
  ),
);

@isarProtected
int serializeItemLink(IsarWriter writer, ItemLink object) {
  IsarCore.writeLong(writer, 1, object.id);
  IsarCore.writeString(writer, 2, object.name);
  IsarCore.writeString(writer, 3, object.img);
  IsarCore.writeLong(writer, 4, object.length);
  {
    final value = object.author;
    final objectWriter = IsarCore.beginObject(writer, 5);
    serializeAuthorLink(objectWriter, value);
    IsarCore.endObject(writer, objectWriter);
  }
  {
    final value = object.collect;
    final objectWriter = IsarCore.beginObject(writer, 6);
    serializeCollectLink(objectWriter, value);
    IsarCore.endObject(writer, objectWriter);
  }
  {
    final list = object.tags;
    final listWriter = IsarCore.beginList(writer, 7, list.length);
    for (var i = 0; i < list.length; i++) {
      {
        final value = list[i];
        final objectWriter = IsarCore.beginObject(listWriter, i);
        serializeTagLink(objectWriter, value);
        IsarCore.endObject(listWriter, objectWriter);
      }
    }
    IsarCore.endList(writer, listWriter);
  }
  IsarCore.writeByte(writer, 8, object.type.index);
  IsarCore.writeString(writer, 9, object.file);
  IsarCore.writeLong(
      writer, 10, object.dateCreate.toUtc().microsecondsSinceEpoch);
  IsarCore.writeLong(
      writer, 11, object.dateUpdate.toUtc().microsecondsSinceEpoch);
  return 0;
}

@isarProtected
ItemLink deserializeItemLink(IsarReader reader) {
  final int _id;
  {
    final value = IsarCore.readLong(reader, 1);
    if (value == -9223372036854775808) {
      _id = 0;
    } else {
      _id = value;
    }
  }
  final String _name;
  _name = IsarCore.readString(reader, 2) ?? '';
  final String _img;
  _img = IsarCore.readString(reader, 3) ?? '';
  final int _length;
  {
    final value = IsarCore.readLong(reader, 4);
    if (value == -9223372036854775808) {
      _length = 0;
    } else {
      _length = value;
    }
  }
  final AuthorLink _author;
  {
    final objectReader = IsarCore.readObject(reader, 5);
    if (objectReader.isNull) {
      _author = AuthorLink();
    } else {
      final embedded = deserializeAuthorLink(objectReader);
      IsarCore.freeReader(objectReader);
      _author = embedded;
    }
  }
  final CollectLink _collect;
  {
    final objectReader = IsarCore.readObject(reader, 6);
    if (objectReader.isNull) {
      _collect = CollectLink(
        author: AuthorLink(),
        category: CategoryLink(),
      );
    } else {
      final embedded = deserializeCollectLink(objectReader);
      IsarCore.freeReader(objectReader);
      _collect = embedded;
    }
  }
  final List<TagLink> _tags;
  {
    final length = IsarCore.readList(reader, 7, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _tags = const <TagLink>[];
      } else {
        final list = List<TagLink>.filled(length, TagLink(), growable: true);
        for (var i = 0; i < length; i++) {
          {
            final objectReader = IsarCore.readObject(reader, i);
            if (objectReader.isNull) {
              list[i] = TagLink();
            } else {
              final embedded = deserializeTagLink(objectReader);
              IsarCore.freeReader(objectReader);
              list[i] = embedded;
            }
          }
        }
        IsarCore.freeReader(reader);
        _tags = list;
      }
    }
  }
  final DateTime _dateCreate;
  {
    final value = IsarCore.readLong(reader, 10);
    if (value == -9223372036854775808) {
      _dateCreate =
          DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
    } else {
      _dateCreate =
          DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  final DateTime _dateUpdate;
  {
    final value = IsarCore.readLong(reader, 11);
    if (value == -9223372036854775808) {
      _dateUpdate =
          DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
    } else {
      _dateUpdate =
          DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  final object = ItemLink(
    id: _id,
    name: _name,
    img: _img,
    length: _length,
    author: _author,
    collect: _collect,
    tags: _tags,
    dateCreate: _dateCreate,
    dateUpdate: _dateUpdate,
  );
  {
    if (IsarCore.readNull(reader, 8)) {
      object.type = TypeItem.NON;
    } else {
      object.type = _itemLinkType[IsarCore.readByte(reader, 8)] ?? TypeItem.NON;
    }
  }
  object.file = IsarCore.readString(reader, 9) ?? '';
  return object;
}

const _itemLinkType = {
  0: TypeItem.NON,
  1: TypeItem.GALLERY,
  2: TypeItem.ARTICEL,
  3: TypeItem.VIDEO,
  4: TypeItem.AUDIO,
};

extension ItemLinkQueryFilter
    on QueryBuilder<ItemLink, ItemLink, QFilterCondition> {
  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> idEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> idGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition>
      idGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> idLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> idLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> idBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition>
      nameGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> nameLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> nameLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 2,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> imgEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> imgGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition>
      imgGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> imgLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> imgLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> imgBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> imgStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> imgEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> imgContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> imgMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 3,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> imgIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> imgIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> lengthEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> lengthGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition>
      lengthGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> lengthLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition>
      lengthLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> lengthBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 4,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> tagsIsEmpty() {
    return not().tagsIsNotEmpty();
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 7, value: null),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> typeEqualTo(
    TypeItem value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 8,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> typeGreaterThan(
    TypeItem value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 8,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition>
      typeGreaterThanOrEqualTo(
    TypeItem value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 8,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> typeLessThan(
    TypeItem value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 8,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> typeLessThanOrEqualTo(
    TypeItem value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 8,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> typeBetween(
    TypeItem lower,
    TypeItem upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 8,
          lower: lower.index,
          upper: upper.index,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> fileEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 9,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> fileGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 9,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition>
      fileGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 9,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> fileLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 9,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> fileLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 9,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> fileBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 9,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> fileStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 9,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> fileEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 9,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> fileContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 9,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> fileMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 9,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> fileIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 9,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> fileIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 9,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> dateCreateEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 10,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> dateCreateGreaterThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 10,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition>
      dateCreateGreaterThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 10,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> dateCreateLessThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 10,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition>
      dateCreateLessThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 10,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> dateCreateBetween(
    DateTime lower,
    DateTime upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 10,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> dateUpdateEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 11,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> dateUpdateGreaterThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 11,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition>
      dateUpdateGreaterThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 11,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> dateUpdateLessThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 11,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition>
      dateUpdateLessThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 11,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> dateUpdateBetween(
    DateTime lower,
    DateTime upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 11,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }
}

extension ItemLinkQueryObject
    on QueryBuilder<ItemLink, ItemLink, QFilterCondition> {
  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> author(
      FilterQuery<AuthorLink> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, 5);
    });
  }

  QueryBuilder<ItemLink, ItemLink, QAfterFilterCondition> collect(
      FilterQuery<CollectLink> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, 6);
    });
  }
}
