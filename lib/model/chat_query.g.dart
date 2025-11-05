// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_query.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetChatQueryCollection on Isar {
  IsarCollection<ChatQuery> get chatQuerys => this.collection();
}

const ChatQuerySchema = CollectionSchema(
  name: r'ChatQuery',
  id: 5577991563499347250,
  properties: {
    r'queryText': PropertySchema(
      id: 0,
      name: r'queryText',
      type: IsarType.string,
    ),
    r'responseText': PropertySchema(
      id: 1,
      name: r'responseText',
      type: IsarType.string,
    ),
    r'timestamp': PropertySchema(
      id: 2,
      name: r'timestamp',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _chatQueryEstimateSize,
  serialize: _chatQuerySerialize,
  deserialize: _chatQueryDeserialize,
  deserializeProp: _chatQueryDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _chatQueryGetId,
  getLinks: _chatQueryGetLinks,
  attach: _chatQueryAttach,
  version: '3.1.0+1',
);

int _chatQueryEstimateSize(
  ChatQuery object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.queryText.length * 3;
  bytesCount += 3 + object.responseText.length * 3;
  return bytesCount;
}

void _chatQuerySerialize(
  ChatQuery object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.queryText);
  writer.writeString(offsets[1], object.responseText);
  writer.writeDateTime(offsets[2], object.timestamp);
}

ChatQuery _chatQueryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ChatQuery();
  object.id = id;
  object.queryText = reader.readString(offsets[0]);
  object.responseText = reader.readString(offsets[1]);
  object.timestamp = reader.readDateTime(offsets[2]);
  return object;
}

P _chatQueryDeserializeProp<P>(
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
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _chatQueryGetId(ChatQuery object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _chatQueryGetLinks(ChatQuery object) {
  return [];
}

void _chatQueryAttach(IsarCollection<dynamic> col, Id id, ChatQuery object) {
  object.id = id;
}

extension ChatQueryQueryWhereSort
    on QueryBuilder<ChatQuery, ChatQuery, QWhere> {
  QueryBuilder<ChatQuery, ChatQuery, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ChatQueryQueryWhere
    on QueryBuilder<ChatQuery, ChatQuery, QWhereClause> {
  QueryBuilder<ChatQuery, ChatQuery, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<ChatQuery, ChatQuery, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterWhereClause> idBetween(
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
}

extension ChatQueryQueryFilter
    on QueryBuilder<ChatQuery, ChatQuery, QFilterCondition> {
  QueryBuilder<ChatQuery, ChatQuery, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ChatQuery, ChatQuery, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ChatQuery, ChatQuery, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ChatQuery, ChatQuery, QAfterFilterCondition> queryTextEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'queryText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterFilterCondition>
      queryTextGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'queryText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterFilterCondition> queryTextLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'queryText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterFilterCondition> queryTextBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'queryText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterFilterCondition> queryTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'queryText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterFilterCondition> queryTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'queryText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterFilterCondition> queryTextContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'queryText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterFilterCondition> queryTextMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'queryText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterFilterCondition> queryTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'queryText',
        value: '',
      ));
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterFilterCondition>
      queryTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'queryText',
        value: '',
      ));
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterFilterCondition> responseTextEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'responseText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterFilterCondition>
      responseTextGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'responseText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterFilterCondition>
      responseTextLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'responseText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterFilterCondition> responseTextBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'responseText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterFilterCondition>
      responseTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'responseText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterFilterCondition>
      responseTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'responseText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterFilterCondition>
      responseTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'responseText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterFilterCondition> responseTextMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'responseText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterFilterCondition>
      responseTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'responseText',
        value: '',
      ));
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterFilterCondition>
      responseTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'responseText',
        value: '',
      ));
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterFilterCondition> timestampEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterFilterCondition>
      timestampGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterFilterCondition> timestampLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterFilterCondition> timestampBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ChatQueryQueryObject
    on QueryBuilder<ChatQuery, ChatQuery, QFilterCondition> {}

extension ChatQueryQueryLinks
    on QueryBuilder<ChatQuery, ChatQuery, QFilterCondition> {}

extension ChatQueryQuerySortBy on QueryBuilder<ChatQuery, ChatQuery, QSortBy> {
  QueryBuilder<ChatQuery, ChatQuery, QAfterSortBy> sortByQueryText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'queryText', Sort.asc);
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterSortBy> sortByQueryTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'queryText', Sort.desc);
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterSortBy> sortByResponseText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseText', Sort.asc);
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterSortBy> sortByResponseTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseText', Sort.desc);
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterSortBy> sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterSortBy> sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension ChatQueryQuerySortThenBy
    on QueryBuilder<ChatQuery, ChatQuery, QSortThenBy> {
  QueryBuilder<ChatQuery, ChatQuery, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterSortBy> thenByQueryText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'queryText', Sort.asc);
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterSortBy> thenByQueryTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'queryText', Sort.desc);
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterSortBy> thenByResponseText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseText', Sort.asc);
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterSortBy> thenByResponseTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseText', Sort.desc);
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterSortBy> thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QAfterSortBy> thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension ChatQueryQueryWhereDistinct
    on QueryBuilder<ChatQuery, ChatQuery, QDistinct> {
  QueryBuilder<ChatQuery, ChatQuery, QDistinct> distinctByQueryText(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'queryText', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QDistinct> distinctByResponseText(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'responseText', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChatQuery, ChatQuery, QDistinct> distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }
}

extension ChatQueryQueryProperty
    on QueryBuilder<ChatQuery, ChatQuery, QQueryProperty> {
  QueryBuilder<ChatQuery, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ChatQuery, String, QQueryOperations> queryTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'queryText');
    });
  }

  QueryBuilder<ChatQuery, String, QQueryOperations> responseTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'responseText');
    });
  }

  QueryBuilder<ChatQuery, DateTime, QQueryOperations> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }
}
