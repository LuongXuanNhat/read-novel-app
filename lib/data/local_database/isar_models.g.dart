// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_models.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNovelLocalCollection on Isar {
  IsarCollection<NovelLocal> get novelLocals => this.collection();
}

const NovelLocalSchema = CollectionSchema(
  name: r'NovelLocal',
  id: 7827093538164978912,
  properties: {
    r'author': PropertySchema(
      id: 0,
      name: r'author',
      type: IsarType.string,
    ),
    r'coverUrl': PropertySchema(
      id: 1,
      name: r'coverUrl',
      type: IsarType.string,
    ),
    r'domain': PropertySchema(
      id: 2,
      name: r'domain',
      type: IsarType.string,
    ),
    r'isFavorite': PropertySchema(
      id: 3,
      name: r'isFavorite',
      type: IsarType.bool,
    ),
    r'lastAccessed': PropertySchema(
      id: 4,
      name: r'lastAccessed',
      type: IsarType.dateTime,
    ),
    r'lastReadChapterIndex': PropertySchema(
      id: 5,
      name: r'lastReadChapterIndex',
      type: IsarType.long,
    ),
    r'sourceUrl': PropertySchema(
      id: 6,
      name: r'sourceUrl',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 7,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _novelLocalEstimateSize,
  serialize: _novelLocalSerialize,
  deserialize: _novelLocalDeserialize,
  deserializeProp: _novelLocalDeserializeProp,
  idName: r'id',
  indexes: {
    r'sourceUrl': IndexSchema(
      id: -4622358680545194972,
      name: r'sourceUrl',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'sourceUrl',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _novelLocalGetId,
  getLinks: _novelLocalGetLinks,
  attach: _novelLocalAttach,
  version: '3.1.0+1',
);

int _novelLocalEstimateSize(
  NovelLocal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.author.length * 3;
  bytesCount += 3 + object.coverUrl.length * 3;
  bytesCount += 3 + object.domain.length * 3;
  bytesCount += 3 + object.sourceUrl.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _novelLocalSerialize(
  NovelLocal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.author);
  writer.writeString(offsets[1], object.coverUrl);
  writer.writeString(offsets[2], object.domain);
  writer.writeBool(offsets[3], object.isFavorite);
  writer.writeDateTime(offsets[4], object.lastAccessed);
  writer.writeLong(offsets[5], object.lastReadChapterIndex);
  writer.writeString(offsets[6], object.sourceUrl);
  writer.writeString(offsets[7], object.title);
}

NovelLocal _novelLocalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NovelLocal();
  object.author = reader.readString(offsets[0]);
  object.coverUrl = reader.readString(offsets[1]);
  object.domain = reader.readString(offsets[2]);
  object.id = id;
  object.isFavorite = reader.readBool(offsets[3]);
  object.lastAccessed = reader.readDateTimeOrNull(offsets[4]);
  object.lastReadChapterIndex = reader.readLong(offsets[5]);
  object.sourceUrl = reader.readString(offsets[6]);
  object.title = reader.readString(offsets[7]);
  return object;
}

P _novelLocalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _novelLocalGetId(NovelLocal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _novelLocalGetLinks(NovelLocal object) {
  return [];
}

void _novelLocalAttach(IsarCollection<dynamic> col, Id id, NovelLocal object) {
  object.id = id;
}

extension NovelLocalByIndex on IsarCollection<NovelLocal> {
  Future<NovelLocal?> getBySourceUrl(String sourceUrl) {
    return getByIndex(r'sourceUrl', [sourceUrl]);
  }

  NovelLocal? getBySourceUrlSync(String sourceUrl) {
    return getByIndexSync(r'sourceUrl', [sourceUrl]);
  }

  Future<bool> deleteBySourceUrl(String sourceUrl) {
    return deleteByIndex(r'sourceUrl', [sourceUrl]);
  }

  bool deleteBySourceUrlSync(String sourceUrl) {
    return deleteByIndexSync(r'sourceUrl', [sourceUrl]);
  }

  Future<List<NovelLocal?>> getAllBySourceUrl(List<String> sourceUrlValues) {
    final values = sourceUrlValues.map((e) => [e]).toList();
    return getAllByIndex(r'sourceUrl', values);
  }

  List<NovelLocal?> getAllBySourceUrlSync(List<String> sourceUrlValues) {
    final values = sourceUrlValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'sourceUrl', values);
  }

  Future<int> deleteAllBySourceUrl(List<String> sourceUrlValues) {
    final values = sourceUrlValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'sourceUrl', values);
  }

  int deleteAllBySourceUrlSync(List<String> sourceUrlValues) {
    final values = sourceUrlValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'sourceUrl', values);
  }

  Future<Id> putBySourceUrl(NovelLocal object) {
    return putByIndex(r'sourceUrl', object);
  }

  Id putBySourceUrlSync(NovelLocal object, {bool saveLinks = true}) {
    return putByIndexSync(r'sourceUrl', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySourceUrl(List<NovelLocal> objects) {
    return putAllByIndex(r'sourceUrl', objects);
  }

  List<Id> putAllBySourceUrlSync(List<NovelLocal> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'sourceUrl', objects, saveLinks: saveLinks);
  }
}

extension NovelLocalQueryWhereSort
    on QueryBuilder<NovelLocal, NovelLocal, QWhere> {
  QueryBuilder<NovelLocal, NovelLocal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NovelLocalQueryWhere
    on QueryBuilder<NovelLocal, NovelLocal, QWhereClause> {
  QueryBuilder<NovelLocal, NovelLocal, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterWhereClause> sourceUrlEqualTo(
      String sourceUrl) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'sourceUrl',
        value: [sourceUrl],
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterWhereClause> sourceUrlNotEqualTo(
      String sourceUrl) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sourceUrl',
              lower: [],
              upper: [sourceUrl],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sourceUrl',
              lower: [sourceUrl],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sourceUrl',
              lower: [sourceUrl],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sourceUrl',
              lower: [],
              upper: [sourceUrl],
              includeUpper: false,
            ));
      }
    });
  }
}

extension NovelLocalQueryFilter
    on QueryBuilder<NovelLocal, NovelLocal, QFilterCondition> {
  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> authorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> authorGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> authorLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> authorBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'author',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> authorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> authorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> authorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> authorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'author',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> authorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'author',
        value: '',
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition>
      authorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'author',
        value: '',
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> coverUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition>
      coverUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coverUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> coverUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coverUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> coverUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coverUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition>
      coverUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'coverUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> coverUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'coverUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> coverUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'coverUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> coverUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'coverUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition>
      coverUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition>
      coverUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'coverUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> domainEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'domain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> domainGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'domain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> domainLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'domain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> domainBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'domain',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> domainStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'domain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> domainEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'domain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> domainContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'domain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> domainMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'domain',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> domainIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'domain',
        value: '',
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition>
      domainIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'domain',
        value: '',
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> isFavoriteEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFavorite',
        value: value,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition>
      lastAccessedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastAccessed',
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition>
      lastAccessedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastAccessed',
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition>
      lastAccessedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastAccessed',
        value: value,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition>
      lastAccessedGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastAccessed',
        value: value,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition>
      lastAccessedLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastAccessed',
        value: value,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition>
      lastAccessedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastAccessed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition>
      lastReadChapterIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastReadChapterIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition>
      lastReadChapterIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastReadChapterIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition>
      lastReadChapterIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastReadChapterIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition>
      lastReadChapterIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastReadChapterIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> sourceUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition>
      sourceUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sourceUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> sourceUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sourceUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> sourceUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sourceUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition>
      sourceUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sourceUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> sourceUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sourceUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> sourceUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sourceUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> sourceUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sourceUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition>
      sourceUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition>
      sourceUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sourceUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension NovelLocalQueryObject
    on QueryBuilder<NovelLocal, NovelLocal, QFilterCondition> {}

extension NovelLocalQueryLinks
    on QueryBuilder<NovelLocal, NovelLocal, QFilterCondition> {}

extension NovelLocalQuerySortBy
    on QueryBuilder<NovelLocal, NovelLocal, QSortBy> {
  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy> sortByAuthor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.asc);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy> sortByAuthorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.desc);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy> sortByCoverUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverUrl', Sort.asc);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy> sortByCoverUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverUrl', Sort.desc);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy> sortByDomain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'domain', Sort.asc);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy> sortByDomainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'domain', Sort.desc);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy> sortByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy> sortByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy> sortByLastAccessed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAccessed', Sort.asc);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy> sortByLastAccessedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAccessed', Sort.desc);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy>
      sortByLastReadChapterIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReadChapterIndex', Sort.asc);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy>
      sortByLastReadChapterIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReadChapterIndex', Sort.desc);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy> sortBySourceUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceUrl', Sort.asc);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy> sortBySourceUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceUrl', Sort.desc);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension NovelLocalQuerySortThenBy
    on QueryBuilder<NovelLocal, NovelLocal, QSortThenBy> {
  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy> thenByAuthor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.asc);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy> thenByAuthorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.desc);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy> thenByCoverUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverUrl', Sort.asc);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy> thenByCoverUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverUrl', Sort.desc);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy> thenByDomain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'domain', Sort.asc);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy> thenByDomainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'domain', Sort.desc);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy> thenByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy> thenByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy> thenByLastAccessed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAccessed', Sort.asc);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy> thenByLastAccessedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAccessed', Sort.desc);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy>
      thenByLastReadChapterIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReadChapterIndex', Sort.asc);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy>
      thenByLastReadChapterIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReadChapterIndex', Sort.desc);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy> thenBySourceUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceUrl', Sort.asc);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy> thenBySourceUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceUrl', Sort.desc);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension NovelLocalQueryWhereDistinct
    on QueryBuilder<NovelLocal, NovelLocal, QDistinct> {
  QueryBuilder<NovelLocal, NovelLocal, QDistinct> distinctByAuthor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'author', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QDistinct> distinctByCoverUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coverUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QDistinct> distinctByDomain(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'domain', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QDistinct> distinctByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFavorite');
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QDistinct> distinctByLastAccessed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastAccessed');
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QDistinct>
      distinctByLastReadChapterIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastReadChapterIndex');
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QDistinct> distinctBySourceUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NovelLocal, NovelLocal, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension NovelLocalQueryProperty
    on QueryBuilder<NovelLocal, NovelLocal, QQueryProperty> {
  QueryBuilder<NovelLocal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NovelLocal, String, QQueryOperations> authorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'author');
    });
  }

  QueryBuilder<NovelLocal, String, QQueryOperations> coverUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverUrl');
    });
  }

  QueryBuilder<NovelLocal, String, QQueryOperations> domainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'domain');
    });
  }

  QueryBuilder<NovelLocal, bool, QQueryOperations> isFavoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFavorite');
    });
  }

  QueryBuilder<NovelLocal, DateTime?, QQueryOperations> lastAccessedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastAccessed');
    });
  }

  QueryBuilder<NovelLocal, int, QQueryOperations>
      lastReadChapterIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastReadChapterIndex');
    });
  }

  QueryBuilder<NovelLocal, String, QQueryOperations> sourceUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceUrl');
    });
  }

  QueryBuilder<NovelLocal, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetChapterLocalCollection on Isar {
  IsarCollection<ChapterLocal> get chapterLocals => this.collection();
}

const ChapterLocalSchema = CollectionSchema(
  name: r'ChapterLocal',
  id: 2438445681820610848,
  properties: {
    r'chapterIndex': PropertySchema(
      id: 0,
      name: r'chapterIndex',
      type: IsarType.long,
    ),
    r'content': PropertySchema(
      id: 1,
      name: r'content',
      type: IsarType.string,
    ),
    r'isDownloaded': PropertySchema(
      id: 2,
      name: r'isDownloaded',
      type: IsarType.bool,
    ),
    r'novelUrl': PropertySchema(
      id: 3,
      name: r'novelUrl',
      type: IsarType.string,
    ),
    r'scrollOffset': PropertySchema(
      id: 4,
      name: r'scrollOffset',
      type: IsarType.double,
    ),
    r'title': PropertySchema(
      id: 5,
      name: r'title',
      type: IsarType.string,
    ),
    r'url': PropertySchema(
      id: 6,
      name: r'url',
      type: IsarType.string,
    )
  },
  estimateSize: _chapterLocalEstimateSize,
  serialize: _chapterLocalSerialize,
  deserialize: _chapterLocalDeserialize,
  deserializeProp: _chapterLocalDeserializeProp,
  idName: r'id',
  indexes: {
    r'novelUrl': IndexSchema(
      id: -2378015030140707058,
      name: r'novelUrl',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'novelUrl',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'url': IndexSchema(
      id: -5756857009679432345,
      name: r'url',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'url',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _chapterLocalGetId,
  getLinks: _chapterLocalGetLinks,
  attach: _chapterLocalAttach,
  version: '3.1.0+1',
);

int _chapterLocalEstimateSize(
  ChapterLocal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.content.length * 3;
  bytesCount += 3 + object.novelUrl.length * 3;
  bytesCount += 3 + object.title.length * 3;
  bytesCount += 3 + object.url.length * 3;
  return bytesCount;
}

void _chapterLocalSerialize(
  ChapterLocal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.chapterIndex);
  writer.writeString(offsets[1], object.content);
  writer.writeBool(offsets[2], object.isDownloaded);
  writer.writeString(offsets[3], object.novelUrl);
  writer.writeDouble(offsets[4], object.scrollOffset);
  writer.writeString(offsets[5], object.title);
  writer.writeString(offsets[6], object.url);
}

ChapterLocal _chapterLocalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ChapterLocal();
  object.chapterIndex = reader.readLong(offsets[0]);
  object.content = reader.readString(offsets[1]);
  object.id = id;
  object.isDownloaded = reader.readBool(offsets[2]);
  object.novelUrl = reader.readString(offsets[3]);
  object.scrollOffset = reader.readDouble(offsets[4]);
  object.title = reader.readString(offsets[5]);
  object.url = reader.readString(offsets[6]);
  return object;
}

P _chapterLocalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _chapterLocalGetId(ChapterLocal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _chapterLocalGetLinks(ChapterLocal object) {
  return [];
}

void _chapterLocalAttach(
    IsarCollection<dynamic> col, Id id, ChapterLocal object) {
  object.id = id;
}

extension ChapterLocalByIndex on IsarCollection<ChapterLocal> {
  Future<ChapterLocal?> getByUrl(String url) {
    return getByIndex(r'url', [url]);
  }

  ChapterLocal? getByUrlSync(String url) {
    return getByIndexSync(r'url', [url]);
  }

  Future<bool> deleteByUrl(String url) {
    return deleteByIndex(r'url', [url]);
  }

  bool deleteByUrlSync(String url) {
    return deleteByIndexSync(r'url', [url]);
  }

  Future<List<ChapterLocal?>> getAllByUrl(List<String> urlValues) {
    final values = urlValues.map((e) => [e]).toList();
    return getAllByIndex(r'url', values);
  }

  List<ChapterLocal?> getAllByUrlSync(List<String> urlValues) {
    final values = urlValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'url', values);
  }

  Future<int> deleteAllByUrl(List<String> urlValues) {
    final values = urlValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'url', values);
  }

  int deleteAllByUrlSync(List<String> urlValues) {
    final values = urlValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'url', values);
  }

  Future<Id> putByUrl(ChapterLocal object) {
    return putByIndex(r'url', object);
  }

  Id putByUrlSync(ChapterLocal object, {bool saveLinks = true}) {
    return putByIndexSync(r'url', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUrl(List<ChapterLocal> objects) {
    return putAllByIndex(r'url', objects);
  }

  List<Id> putAllByUrlSync(List<ChapterLocal> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'url', objects, saveLinks: saveLinks);
  }
}

extension ChapterLocalQueryWhereSort
    on QueryBuilder<ChapterLocal, ChapterLocal, QWhere> {
  QueryBuilder<ChapterLocal, ChapterLocal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ChapterLocalQueryWhere
    on QueryBuilder<ChapterLocal, ChapterLocal, QWhereClause> {
  QueryBuilder<ChapterLocal, ChapterLocal, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterWhereClause> novelUrlEqualTo(
      String novelUrl) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'novelUrl',
        value: [novelUrl],
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterWhereClause>
      novelUrlNotEqualTo(String novelUrl) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'novelUrl',
              lower: [],
              upper: [novelUrl],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'novelUrl',
              lower: [novelUrl],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'novelUrl',
              lower: [novelUrl],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'novelUrl',
              lower: [],
              upper: [novelUrl],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterWhereClause> urlEqualTo(
      String url) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'url',
        value: [url],
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterWhereClause> urlNotEqualTo(
      String url) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'url',
              lower: [],
              upper: [url],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'url',
              lower: [url],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'url',
              lower: [url],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'url',
              lower: [],
              upper: [url],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ChapterLocalQueryFilter
    on QueryBuilder<ChapterLocal, ChapterLocal, QFilterCondition> {
  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      chapterIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chapterIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      chapterIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chapterIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      chapterIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chapterIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      chapterIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chapterIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      contentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      contentGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      contentLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      contentBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'content',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      contentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      contentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      contentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      contentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'content',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      contentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      contentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      isDownloadedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDownloaded',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      novelUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'novelUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      novelUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'novelUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      novelUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'novelUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      novelUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'novelUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      novelUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'novelUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      novelUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'novelUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      novelUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'novelUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      novelUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'novelUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      novelUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'novelUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      novelUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'novelUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      scrollOffsetEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scrollOffset',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      scrollOffsetGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scrollOffset',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      scrollOffsetLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scrollOffset',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      scrollOffsetBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scrollOffset',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition> urlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      urlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition> urlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition> urlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'url',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition> urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition> urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition> urlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition> urlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition> urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterFilterCondition>
      urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }
}

extension ChapterLocalQueryObject
    on QueryBuilder<ChapterLocal, ChapterLocal, QFilterCondition> {}

extension ChapterLocalQueryLinks
    on QueryBuilder<ChapterLocal, ChapterLocal, QFilterCondition> {}

extension ChapterLocalQuerySortBy
    on QueryBuilder<ChapterLocal, ChapterLocal, QSortBy> {
  QueryBuilder<ChapterLocal, ChapterLocal, QAfterSortBy> sortByChapterIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterIndex', Sort.asc);
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterSortBy>
      sortByChapterIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterIndex', Sort.desc);
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterSortBy> sortByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterSortBy> sortByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterSortBy> sortByIsDownloaded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDownloaded', Sort.asc);
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterSortBy>
      sortByIsDownloadedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDownloaded', Sort.desc);
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterSortBy> sortByNovelUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'novelUrl', Sort.asc);
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterSortBy> sortByNovelUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'novelUrl', Sort.desc);
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterSortBy> sortByScrollOffset() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scrollOffset', Sort.asc);
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterSortBy>
      sortByScrollOffsetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scrollOffset', Sort.desc);
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterSortBy> sortByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterSortBy> sortByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension ChapterLocalQuerySortThenBy
    on QueryBuilder<ChapterLocal, ChapterLocal, QSortThenBy> {
  QueryBuilder<ChapterLocal, ChapterLocal, QAfterSortBy> thenByChapterIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterIndex', Sort.asc);
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterSortBy>
      thenByChapterIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterIndex', Sort.desc);
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterSortBy> thenByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterSortBy> thenByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterSortBy> thenByIsDownloaded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDownloaded', Sort.asc);
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterSortBy>
      thenByIsDownloadedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDownloaded', Sort.desc);
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterSortBy> thenByNovelUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'novelUrl', Sort.asc);
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterSortBy> thenByNovelUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'novelUrl', Sort.desc);
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterSortBy> thenByScrollOffset() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scrollOffset', Sort.asc);
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterSortBy>
      thenByScrollOffsetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scrollOffset', Sort.desc);
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterSortBy> thenByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QAfterSortBy> thenByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension ChapterLocalQueryWhereDistinct
    on QueryBuilder<ChapterLocal, ChapterLocal, QDistinct> {
  QueryBuilder<ChapterLocal, ChapterLocal, QDistinct> distinctByChapterIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chapterIndex');
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QDistinct> distinctByContent(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'content', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QDistinct> distinctByIsDownloaded() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDownloaded');
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QDistinct> distinctByNovelUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'novelUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QDistinct> distinctByScrollOffset() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scrollOffset');
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterLocal, ChapterLocal, QDistinct> distinctByUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'url', caseSensitive: caseSensitive);
    });
  }
}

extension ChapterLocalQueryProperty
    on QueryBuilder<ChapterLocal, ChapterLocal, QQueryProperty> {
  QueryBuilder<ChapterLocal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ChapterLocal, int, QQueryOperations> chapterIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chapterIndex');
    });
  }

  QueryBuilder<ChapterLocal, String, QQueryOperations> contentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'content');
    });
  }

  QueryBuilder<ChapterLocal, bool, QQueryOperations> isDownloadedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDownloaded');
    });
  }

  QueryBuilder<ChapterLocal, String, QQueryOperations> novelUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'novelUrl');
    });
  }

  QueryBuilder<ChapterLocal, double, QQueryOperations> scrollOffsetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scrollOffset');
    });
  }

  QueryBuilder<ChapterLocal, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<ChapterLocal, String, QQueryOperations> urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'url');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDownloadTaskLocalCollection on Isar {
  IsarCollection<DownloadTaskLocal> get downloadTaskLocals => this.collection();
}

const DownloadTaskLocalSchema = CollectionSchema(
  name: r'DownloadTaskLocal',
  id: 4822695924264263963,
  properties: {
    r'currentChapter': PropertySchema(
      id: 0,
      name: r'currentChapter',
      type: IsarType.long,
    ),
    r'endChapter': PropertySchema(
      id: 1,
      name: r'endChapter',
      type: IsarType.long,
    ),
    r'novelTitle': PropertySchema(
      id: 2,
      name: r'novelTitle',
      type: IsarType.string,
    ),
    r'novelUrl': PropertySchema(
      id: 3,
      name: r'novelUrl',
      type: IsarType.string,
    ),
    r'startChapter': PropertySchema(
      id: 4,
      name: r'startChapter',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 5,
      name: r'status',
      type: IsarType.long,
    )
  },
  estimateSize: _downloadTaskLocalEstimateSize,
  serialize: _downloadTaskLocalSerialize,
  deserialize: _downloadTaskLocalDeserialize,
  deserializeProp: _downloadTaskLocalDeserializeProp,
  idName: r'id',
  indexes: {
    r'novelUrl': IndexSchema(
      id: -2378015030140707058,
      name: r'novelUrl',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'novelUrl',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _downloadTaskLocalGetId,
  getLinks: _downloadTaskLocalGetLinks,
  attach: _downloadTaskLocalAttach,
  version: '3.1.0+1',
);

int _downloadTaskLocalEstimateSize(
  DownloadTaskLocal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.novelTitle.length * 3;
  bytesCount += 3 + object.novelUrl.length * 3;
  return bytesCount;
}

void _downloadTaskLocalSerialize(
  DownloadTaskLocal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.currentChapter);
  writer.writeLong(offsets[1], object.endChapter);
  writer.writeString(offsets[2], object.novelTitle);
  writer.writeString(offsets[3], object.novelUrl);
  writer.writeLong(offsets[4], object.startChapter);
  writer.writeLong(offsets[5], object.status);
}

DownloadTaskLocal _downloadTaskLocalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DownloadTaskLocal();
  object.currentChapter = reader.readLong(offsets[0]);
  object.endChapter = reader.readLong(offsets[1]);
  object.id = id;
  object.novelTitle = reader.readString(offsets[2]);
  object.novelUrl = reader.readString(offsets[3]);
  object.startChapter = reader.readLong(offsets[4]);
  object.status = reader.readLong(offsets[5]);
  return object;
}

P _downloadTaskLocalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _downloadTaskLocalGetId(DownloadTaskLocal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _downloadTaskLocalGetLinks(
    DownloadTaskLocal object) {
  return [];
}

void _downloadTaskLocalAttach(
    IsarCollection<dynamic> col, Id id, DownloadTaskLocal object) {
  object.id = id;
}

extension DownloadTaskLocalByIndex on IsarCollection<DownloadTaskLocal> {
  Future<DownloadTaskLocal?> getByNovelUrl(String novelUrl) {
    return getByIndex(r'novelUrl', [novelUrl]);
  }

  DownloadTaskLocal? getByNovelUrlSync(String novelUrl) {
    return getByIndexSync(r'novelUrl', [novelUrl]);
  }

  Future<bool> deleteByNovelUrl(String novelUrl) {
    return deleteByIndex(r'novelUrl', [novelUrl]);
  }

  bool deleteByNovelUrlSync(String novelUrl) {
    return deleteByIndexSync(r'novelUrl', [novelUrl]);
  }

  Future<List<DownloadTaskLocal?>> getAllByNovelUrl(
      List<String> novelUrlValues) {
    final values = novelUrlValues.map((e) => [e]).toList();
    return getAllByIndex(r'novelUrl', values);
  }

  List<DownloadTaskLocal?> getAllByNovelUrlSync(List<String> novelUrlValues) {
    final values = novelUrlValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'novelUrl', values);
  }

  Future<int> deleteAllByNovelUrl(List<String> novelUrlValues) {
    final values = novelUrlValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'novelUrl', values);
  }

  int deleteAllByNovelUrlSync(List<String> novelUrlValues) {
    final values = novelUrlValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'novelUrl', values);
  }

  Future<Id> putByNovelUrl(DownloadTaskLocal object) {
    return putByIndex(r'novelUrl', object);
  }

  Id putByNovelUrlSync(DownloadTaskLocal object, {bool saveLinks = true}) {
    return putByIndexSync(r'novelUrl', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByNovelUrl(List<DownloadTaskLocal> objects) {
    return putAllByIndex(r'novelUrl', objects);
  }

  List<Id> putAllByNovelUrlSync(List<DownloadTaskLocal> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'novelUrl', objects, saveLinks: saveLinks);
  }
}

extension DownloadTaskLocalQueryWhereSort
    on QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QWhere> {
  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DownloadTaskLocalQueryWhere
    on QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QWhereClause> {
  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterWhereClause>
      novelUrlEqualTo(String novelUrl) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'novelUrl',
        value: [novelUrl],
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterWhereClause>
      novelUrlNotEqualTo(String novelUrl) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'novelUrl',
              lower: [],
              upper: [novelUrl],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'novelUrl',
              lower: [novelUrl],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'novelUrl',
              lower: [novelUrl],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'novelUrl',
              lower: [],
              upper: [novelUrl],
              includeUpper: false,
            ));
      }
    });
  }
}

extension DownloadTaskLocalQueryFilter
    on QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QFilterCondition> {
  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      currentChapterEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentChapter',
        value: value,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      currentChapterGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentChapter',
        value: value,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      currentChapterLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentChapter',
        value: value,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      currentChapterBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentChapter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      endChapterEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endChapter',
        value: value,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      endChapterGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endChapter',
        value: value,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      endChapterLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endChapter',
        value: value,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      endChapterBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endChapter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      novelTitleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'novelTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      novelTitleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'novelTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      novelTitleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'novelTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      novelTitleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'novelTitle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      novelTitleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'novelTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      novelTitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'novelTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      novelTitleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'novelTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      novelTitleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'novelTitle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      novelTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'novelTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      novelTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'novelTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      novelUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'novelUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      novelUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'novelUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      novelUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'novelUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      novelUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'novelUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      novelUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'novelUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      novelUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'novelUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      novelUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'novelUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      novelUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'novelUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      novelUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'novelUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      novelUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'novelUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      startChapterEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startChapter',
        value: value,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      startChapterGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startChapter',
        value: value,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      startChapterLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startChapter',
        value: value,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      startChapterBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startChapter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      statusEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      statusGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      statusLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterFilterCondition>
      statusBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DownloadTaskLocalQueryObject
    on QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QFilterCondition> {}

extension DownloadTaskLocalQueryLinks
    on QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QFilterCondition> {}

extension DownloadTaskLocalQuerySortBy
    on QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QSortBy> {
  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterSortBy>
      sortByCurrentChapter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentChapter', Sort.asc);
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterSortBy>
      sortByCurrentChapterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentChapter', Sort.desc);
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterSortBy>
      sortByEndChapter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endChapter', Sort.asc);
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterSortBy>
      sortByEndChapterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endChapter', Sort.desc);
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterSortBy>
      sortByNovelTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'novelTitle', Sort.asc);
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterSortBy>
      sortByNovelTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'novelTitle', Sort.desc);
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterSortBy>
      sortByNovelUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'novelUrl', Sort.asc);
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterSortBy>
      sortByNovelUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'novelUrl', Sort.desc);
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterSortBy>
      sortByStartChapter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startChapter', Sort.asc);
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterSortBy>
      sortByStartChapterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startChapter', Sort.desc);
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension DownloadTaskLocalQuerySortThenBy
    on QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QSortThenBy> {
  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterSortBy>
      thenByCurrentChapter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentChapter', Sort.asc);
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterSortBy>
      thenByCurrentChapterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentChapter', Sort.desc);
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterSortBy>
      thenByEndChapter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endChapter', Sort.asc);
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterSortBy>
      thenByEndChapterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endChapter', Sort.desc);
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterSortBy>
      thenByNovelTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'novelTitle', Sort.asc);
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterSortBy>
      thenByNovelTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'novelTitle', Sort.desc);
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterSortBy>
      thenByNovelUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'novelUrl', Sort.asc);
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterSortBy>
      thenByNovelUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'novelUrl', Sort.desc);
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterSortBy>
      thenByStartChapter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startChapter', Sort.asc);
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterSortBy>
      thenByStartChapterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startChapter', Sort.desc);
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension DownloadTaskLocalQueryWhereDistinct
    on QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QDistinct> {
  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QDistinct>
      distinctByCurrentChapter() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentChapter');
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QDistinct>
      distinctByEndChapter() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endChapter');
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QDistinct>
      distinctByNovelTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'novelTitle', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QDistinct>
      distinctByNovelUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'novelUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QDistinct>
      distinctByStartChapter() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startChapter');
    });
  }

  QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QDistinct>
      distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }
}

extension DownloadTaskLocalQueryProperty
    on QueryBuilder<DownloadTaskLocal, DownloadTaskLocal, QQueryProperty> {
  QueryBuilder<DownloadTaskLocal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DownloadTaskLocal, int, QQueryOperations>
      currentChapterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentChapter');
    });
  }

  QueryBuilder<DownloadTaskLocal, int, QQueryOperations> endChapterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endChapter');
    });
  }

  QueryBuilder<DownloadTaskLocal, String, QQueryOperations>
      novelTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'novelTitle');
    });
  }

  QueryBuilder<DownloadTaskLocal, String, QQueryOperations> novelUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'novelUrl');
    });
  }

  QueryBuilder<DownloadTaskLocal, int, QQueryOperations>
      startChapterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startChapter');
    });
  }

  QueryBuilder<DownloadTaskLocal, int, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }
}
