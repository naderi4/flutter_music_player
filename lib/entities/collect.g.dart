// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collect.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetCollectCollection on Isar {
  IsarCollection<int, Collect> get collects => this.collection();
}

const CollectSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'Collect',
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
        name: 'category',
        type: IsarType.object,
        target: 'CategoryLink',
      ),
      IsarPropertySchema(
        name: 'tags',
        type: IsarType.objectList,
        target: 'TagLink',
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, Collect>(
    serialize: serializeCollect,
    deserialize: deserializeCollect,
    deserializeProperty: deserializeCollectProp,
  ),
  embeddedSchemas: [AuthorLinkSchema, CategoryLinkSchema, TagLinkSchema],
);

@isarProtected
int serializeCollect(IsarWriter writer, Collect object) {
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
    final value = object.category;
    final objectWriter = IsarCore.beginObject(writer, 5);
    serializeCategoryLink(objectWriter, value);
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
  return object.id;
}

@isarProtected
Collect deserializeCollect(IsarReader reader) {
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
  final CategoryLink _category;
  {
    final objectReader = IsarCore.readObject(reader, 5);
    if (objectReader.isNull) {
      _category = CategoryLink();
    } else {
      final embedded = deserializeCategoryLink(objectReader);
      IsarCore.freeReader(objectReader);
      _category = embedded;
    }
  }
  final List<TagLink> _tags;
  {
    final length = IsarCore.readList(reader, 6, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _tags = const [];
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
  final object = Collect(
    id: _id,
    name: _name,
    img: _img,
    length: _length,
    author: _author,
    category: _category,
    tags: _tags,
  );
  return object;
}

@isarProtected
dynamic deserializeCollectProp(IsarReader reader, int property) {
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
          return CategoryLink();
        } else {
          final embedded = deserializeCategoryLink(objectReader);
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
            return const [];
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
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _CollectUpdate {
  bool call({
    required int id,
    String? name,
    String? img,
    int? length,
  });
}

class _CollectUpdateImpl implements _CollectUpdate {
  const _CollectUpdateImpl(this.collection);

  final IsarCollection<int, Collect> collection;

  @override
  bool call({
    required int id,
    Object? name = ignore,
    Object? img = ignore,
    Object? length = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (name != ignore) 1: name as String?,
          if (img != ignore) 2: img as String?,
          if (length != ignore) 3: length as int?,
        }) >
        0;
  }
}

sealed class _CollectUpdateAll {
  int call({
    required List<int> id,
    String? name,
    String? img,
    int? length,
  });
}

class _CollectUpdateAllImpl implements _CollectUpdateAll {
  const _CollectUpdateAllImpl(this.collection);

  final IsarCollection<int, Collect> collection;

  @override
  int call({
    required List<int> id,
    Object? name = ignore,
    Object? img = ignore,
    Object? length = ignore,
  }) {
    return collection.updateProperties(id, {
      if (name != ignore) 1: name as String?,
      if (img != ignore) 2: img as String?,
      if (length != ignore) 3: length as int?,
    });
  }
}

extension CollectUpdate on IsarCollection<int, Collect> {
  _CollectUpdate get update => _CollectUpdateImpl(this);

  _CollectUpdateAll get updateAll => _CollectUpdateAllImpl(this);
}

sealed class _CollectQueryUpdate {
  int call({
    String? name,
    String? img,
    int? length,
  });
}

class _CollectQueryUpdateImpl implements _CollectQueryUpdate {
  const _CollectQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<Collect> query;
  final int? limit;

  @override
  int call({
    Object? name = ignore,
    Object? img = ignore,
    Object? length = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (name != ignore) 1: name as String?,
      if (img != ignore) 2: img as String?,
      if (length != ignore) 3: length as int?,
    });
  }
}

extension CollectQueryUpdate on IsarQuery<Collect> {
  _CollectQueryUpdate get updateFirst =>
      _CollectQueryUpdateImpl(this, limit: 1);

  _CollectQueryUpdate get updateAll => _CollectQueryUpdateImpl(this);
}

class _CollectQueryBuilderUpdateImpl implements _CollectQueryUpdate {
  const _CollectQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<Collect, Collect, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? name = ignore,
    Object? img = ignore,
    Object? length = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (name != ignore) 1: name as String?,
        if (img != ignore) 2: img as String?,
        if (length != ignore) 3: length as int?,
      });
    } finally {
      q.close();
    }
  }
}

extension CollectQueryBuilderUpdate
    on QueryBuilder<Collect, Collect, QOperations> {
  _CollectQueryUpdate get updateFirst =>
      _CollectQueryBuilderUpdateImpl(this, limit: 1);

  _CollectQueryUpdate get updateAll => _CollectQueryBuilderUpdateImpl(this);
}

extension CollectQueryFilter
    on QueryBuilder<Collect, Collect, QFilterCondition> {
  QueryBuilder<Collect, Collect, QAfterFilterCondition> idEqualTo(
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

  QueryBuilder<Collect, Collect, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Collect, Collect, QAfterFilterCondition> idGreaterThanOrEqualTo(
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

  QueryBuilder<Collect, Collect, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Collect, Collect, QAfterFilterCondition> idLessThanOrEqualTo(
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

  QueryBuilder<Collect, Collect, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Collect, Collect, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Collect, Collect, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Collect, Collect, QAfterFilterCondition>
      nameGreaterThanOrEqualTo(
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

  QueryBuilder<Collect, Collect, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Collect, Collect, QAfterFilterCondition> nameLessThanOrEqualTo(
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

  QueryBuilder<Collect, Collect, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Collect, Collect, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Collect, Collect, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Collect, Collect, QAfterFilterCondition> nameContains(
      String value,
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

  QueryBuilder<Collect, Collect, QAfterFilterCondition> nameMatches(
      String pattern,
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

  QueryBuilder<Collect, Collect, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Collect, Collect, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Collect, Collect, QAfterFilterCondition> imgEqualTo(
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

  QueryBuilder<Collect, Collect, QAfterFilterCondition> imgGreaterThan(
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

  QueryBuilder<Collect, Collect, QAfterFilterCondition> imgGreaterThanOrEqualTo(
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

  QueryBuilder<Collect, Collect, QAfterFilterCondition> imgLessThan(
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

  QueryBuilder<Collect, Collect, QAfterFilterCondition> imgLessThanOrEqualTo(
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

  QueryBuilder<Collect, Collect, QAfterFilterCondition> imgBetween(
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

  QueryBuilder<Collect, Collect, QAfterFilterCondition> imgStartsWith(
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

  QueryBuilder<Collect, Collect, QAfterFilterCondition> imgEndsWith(
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

  QueryBuilder<Collect, Collect, QAfterFilterCondition> imgContains(
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

  QueryBuilder<Collect, Collect, QAfterFilterCondition> imgMatches(
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

  QueryBuilder<Collect, Collect, QAfterFilterCondition> imgIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Collect, Collect, QAfterFilterCondition> imgIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Collect, Collect, QAfterFilterCondition> lengthEqualTo(
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

  QueryBuilder<Collect, Collect, QAfterFilterCondition> lengthGreaterThan(
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

  QueryBuilder<Collect, Collect, QAfterFilterCondition>
      lengthGreaterThanOrEqualTo(
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

  QueryBuilder<Collect, Collect, QAfterFilterCondition> lengthLessThan(
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

  QueryBuilder<Collect, Collect, QAfterFilterCondition> lengthLessThanOrEqualTo(
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

  QueryBuilder<Collect, Collect, QAfterFilterCondition> lengthBetween(
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

  QueryBuilder<Collect, Collect, QAfterFilterCondition> tagsIsEmpty() {
    return not().tagsIsNotEmpty();
  }

  QueryBuilder<Collect, Collect, QAfterFilterCondition> tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 6, value: null),
      );
    });
  }
}

extension CollectQueryObject
    on QueryBuilder<Collect, Collect, QFilterCondition> {
  QueryBuilder<Collect, Collect, QAfterFilterCondition> author(
      FilterQuery<AuthorLink> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, 4);
    });
  }

  QueryBuilder<Collect, Collect, QAfterFilterCondition> category(
      FilterQuery<CategoryLink> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, 5);
    });
  }
}

extension CollectQuerySortBy on QueryBuilder<Collect, Collect, QSortBy> {
  QueryBuilder<Collect, Collect, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<Collect, Collect, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<Collect, Collect, QAfterSortBy> sortByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Collect, Collect, QAfterSortBy> sortByNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Collect, Collect, QAfterSortBy> sortByImg(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Collect, Collect, QAfterSortBy> sortByImgDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Collect, Collect, QAfterSortBy> sortByLength() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<Collect, Collect, QAfterSortBy> sortByLengthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }
}

extension CollectQuerySortThenBy
    on QueryBuilder<Collect, Collect, QSortThenBy> {
  QueryBuilder<Collect, Collect, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<Collect, Collect, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<Collect, Collect, QAfterSortBy> thenByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Collect, Collect, QAfterSortBy> thenByNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Collect, Collect, QAfterSortBy> thenByImg(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Collect, Collect, QAfterSortBy> thenByImgDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Collect, Collect, QAfterSortBy> thenByLength() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<Collect, Collect, QAfterSortBy> thenByLengthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }
}

extension CollectQueryWhereDistinct
    on QueryBuilder<Collect, Collect, QDistinct> {
  QueryBuilder<Collect, Collect, QAfterDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Collect, Collect, QAfterDistinct> distinctByImg(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Collect, Collect, QAfterDistinct> distinctByLength() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3);
    });
  }
}

extension CollectQueryProperty1 on QueryBuilder<Collect, Collect, QProperty> {
  QueryBuilder<Collect, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<Collect, String, QAfterProperty> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Collect, String, QAfterProperty> imgProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<Collect, int, QAfterProperty> lengthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<Collect, AuthorLink, QAfterProperty> authorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<Collect, CategoryLink, QAfterProperty> categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<Collect, List<TagLink>, QAfterProperty> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }
}

extension CollectQueryProperty2<R> on QueryBuilder<Collect, R, QAfterProperty> {
  QueryBuilder<Collect, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<Collect, (R, String), QAfterProperty> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Collect, (R, String), QAfterProperty> imgProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<Collect, (R, int), QAfterProperty> lengthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<Collect, (R, AuthorLink), QAfterProperty> authorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<Collect, (R, CategoryLink), QAfterProperty> categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<Collect, (R, List<TagLink>), QAfterProperty> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }
}

extension CollectQueryProperty3<R1, R2>
    on QueryBuilder<Collect, (R1, R2), QAfterProperty> {
  QueryBuilder<Collect, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<Collect, (R1, R2, String), QOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Collect, (R1, R2, String), QOperations> imgProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<Collect, (R1, R2, int), QOperations> lengthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<Collect, (R1, R2, AuthorLink), QOperations> authorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<Collect, (R1, R2, CategoryLink), QOperations>
      categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<Collect, (R1, R2, List<TagLink>), QOperations> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }
}

// **************************************************************************
// _IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

const CollectLinkSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'CollectLink',
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
        name: 'category',
        type: IsarType.object,
        target: 'CategoryLink',
      ),
      IsarPropertySchema(
        name: 'tags',
        type: IsarType.objectList,
        target: 'TagLink',
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<void, CollectLink>(
    serialize: serializeCollectLink,
    deserialize: deserializeCollectLink,
  ),
);

@isarProtected
int serializeCollectLink(IsarWriter writer, CollectLink object) {
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
    final value = object.category;
    final objectWriter = IsarCore.beginObject(writer, 6);
    serializeCategoryLink(objectWriter, value);
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
  return 0;
}

@isarProtected
CollectLink deserializeCollectLink(IsarReader reader) {
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
  final CategoryLink _category;
  {
    final objectReader = IsarCore.readObject(reader, 6);
    if (objectReader.isNull) {
      _category = CategoryLink();
    } else {
      final embedded = deserializeCategoryLink(objectReader);
      IsarCore.freeReader(objectReader);
      _category = embedded;
    }
  }
  final List<TagLink> _tags;
  {
    final length = IsarCore.readList(reader, 7, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _tags = const [];
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
  final object = CollectLink(
    id: _id,
    name: _name,
    img: _img,
    length: _length,
    author: _author,
    category: _category,
    tags: _tags,
  );
  return object;
}

extension CollectLinkQueryFilter
    on QueryBuilder<CollectLink, CollectLink, QFilterCondition> {
  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition> idEqualTo(
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

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition>
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

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition>
      idLessThanOrEqualTo(
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

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition> idBetween(
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

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition>
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

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition>
      nameLessThanOrEqualTo(
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

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition> nameContains(
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

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition> imgEqualTo(
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

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition> imgGreaterThan(
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

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition>
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

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition> imgLessThan(
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

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition>
      imgLessThanOrEqualTo(
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

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition> imgBetween(
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

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition> imgStartsWith(
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

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition> imgEndsWith(
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

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition> imgContains(
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

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition> imgMatches(
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

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition> imgIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition>
      imgIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition> lengthEqualTo(
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

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition>
      lengthGreaterThan(
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

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition>
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

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition> lengthLessThan(
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

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition>
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

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition> lengthBetween(
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

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition> tagsIsEmpty() {
    return not().tagsIsNotEmpty();
  }

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition>
      tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 7, value: null),
      );
    });
  }
}

extension CollectLinkQueryObject
    on QueryBuilder<CollectLink, CollectLink, QFilterCondition> {
  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition> author(
      FilterQuery<AuthorLink> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, 5);
    });
  }

  QueryBuilder<CollectLink, CollectLink, QAfterFilterCondition> category(
      FilterQuery<CategoryLink> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, 6);
    });
  }
}
