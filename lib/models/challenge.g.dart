// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetChallengeCollection on Isar {
  IsarCollection<Challenge> get challenges => this.collection();
}

const ChallengeSchema = CollectionSchema(
  name: r'Challenge',
  id: 784059437258421421,
  properties: {
    r'completedAt': PropertySchema(
      id: 0,
      name: r'completedAt',
      type: IsarType.dateTime,
    ),
    r'completedReps': PropertySchema(
      id: 1,
      name: r'completedReps',
      type: IsarType.long,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'exerciseType': PropertySchema(
      id: 3,
      name: r'exerciseType',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 4,
      name: r'status',
      type: IsarType.string,
    ),
    r'targetReps': PropertySchema(
      id: 5,
      name: r'targetReps',
      type: IsarType.long,
    ),
    r'timeLimitSeconds': PropertySchema(
      id: 6,
      name: r'timeLimitSeconds',
      type: IsarType.long,
    )
  },
  estimateSize: _challengeEstimateSize,
  serialize: _challengeSerialize,
  deserialize: _challengeDeserialize,
  deserializeProp: _challengeDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _challengeGetId,
  getLinks: _challengeGetLinks,
  attach: _challengeAttach,
  version: '3.1.0+1',
);

int _challengeEstimateSize(
  Challenge object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.exerciseType.length * 3;
  bytesCount += 3 + object.status.length * 3;
  return bytesCount;
}

void _challengeSerialize(
  Challenge object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.completedAt);
  writer.writeLong(offsets[1], object.completedReps);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.exerciseType);
  writer.writeString(offsets[4], object.status);
  writer.writeLong(offsets[5], object.targetReps);
  writer.writeLong(offsets[6], object.timeLimitSeconds);
}

Challenge _challengeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Challenge();
  object.completedAt = reader.readDateTimeOrNull(offsets[0]);
  object.completedReps = reader.readLong(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.exerciseType = reader.readString(offsets[3]);
  object.id = id;
  object.status = reader.readString(offsets[4]);
  object.targetReps = reader.readLong(offsets[5]);
  object.timeLimitSeconds = reader.readLongOrNull(offsets[6]);
  return object;
}

P _challengeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _challengeGetId(Challenge object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _challengeGetLinks(Challenge object) {
  return [];
}

void _challengeAttach(IsarCollection<dynamic> col, Id id, Challenge object) {
  object.id = id;
}

extension ChallengeQueryWhereSort
    on QueryBuilder<Challenge, Challenge, QWhere> {
  QueryBuilder<Challenge, Challenge, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ChallengeQueryWhere
    on QueryBuilder<Challenge, Challenge, QWhereClause> {
  QueryBuilder<Challenge, Challenge, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Challenge, Challenge, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterWhereClause> idBetween(
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

extension ChallengeQueryFilter
    on QueryBuilder<Challenge, Challenge, QFilterCondition> {
  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      completedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      completedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> completedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      completedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> completedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> completedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      completedRepsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedReps',
        value: value,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      completedRepsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completedReps',
        value: value,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      completedRepsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completedReps',
        value: value,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      completedRepsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completedReps',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> exerciseTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exerciseType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      exerciseTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exerciseType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      exerciseTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exerciseType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> exerciseTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exerciseType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      exerciseTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'exerciseType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      exerciseTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'exerciseType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      exerciseTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'exerciseType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> exerciseTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'exerciseType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      exerciseTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exerciseType',
        value: '',
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      exerciseTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'exerciseType',
        value: '',
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> statusEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> statusGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> statusLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> statusBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> statusContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> statusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> targetRepsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetReps',
        value: value,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      targetRepsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetReps',
        value: value,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> targetRepsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetReps',
        value: value,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition> targetRepsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetReps',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      timeLimitSecondsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timeLimitSeconds',
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      timeLimitSecondsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timeLimitSeconds',
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      timeLimitSecondsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeLimitSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      timeLimitSecondsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeLimitSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      timeLimitSecondsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeLimitSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterFilterCondition>
      timeLimitSecondsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeLimitSeconds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ChallengeQueryObject
    on QueryBuilder<Challenge, Challenge, QFilterCondition> {}

extension ChallengeQueryLinks
    on QueryBuilder<Challenge, Challenge, QFilterCondition> {}

extension ChallengeQuerySortBy on QueryBuilder<Challenge, Challenge, QSortBy> {
  QueryBuilder<Challenge, Challenge, QAfterSortBy> sortByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterSortBy> sortByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterSortBy> sortByCompletedReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedReps', Sort.asc);
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterSortBy> sortByCompletedRepsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedReps', Sort.desc);
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterSortBy> sortByExerciseType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseType', Sort.asc);
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterSortBy> sortByExerciseTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseType', Sort.desc);
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterSortBy> sortByTargetReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetReps', Sort.asc);
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterSortBy> sortByTargetRepsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetReps', Sort.desc);
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterSortBy> sortByTimeLimitSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeLimitSeconds', Sort.asc);
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterSortBy>
      sortByTimeLimitSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeLimitSeconds', Sort.desc);
    });
  }
}

extension ChallengeQuerySortThenBy
    on QueryBuilder<Challenge, Challenge, QSortThenBy> {
  QueryBuilder<Challenge, Challenge, QAfterSortBy> thenByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterSortBy> thenByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterSortBy> thenByCompletedReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedReps', Sort.asc);
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterSortBy> thenByCompletedRepsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedReps', Sort.desc);
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterSortBy> thenByExerciseType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseType', Sort.asc);
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterSortBy> thenByExerciseTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseType', Sort.desc);
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterSortBy> thenByTargetReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetReps', Sort.asc);
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterSortBy> thenByTargetRepsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetReps', Sort.desc);
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterSortBy> thenByTimeLimitSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeLimitSeconds', Sort.asc);
    });
  }

  QueryBuilder<Challenge, Challenge, QAfterSortBy>
      thenByTimeLimitSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeLimitSeconds', Sort.desc);
    });
  }
}

extension ChallengeQueryWhereDistinct
    on QueryBuilder<Challenge, Challenge, QDistinct> {
  QueryBuilder<Challenge, Challenge, QDistinct> distinctByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedAt');
    });
  }

  QueryBuilder<Challenge, Challenge, QDistinct> distinctByCompletedReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedReps');
    });
  }

  QueryBuilder<Challenge, Challenge, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Challenge, Challenge, QDistinct> distinctByExerciseType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exerciseType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Challenge, Challenge, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Challenge, Challenge, QDistinct> distinctByTargetReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetReps');
    });
  }

  QueryBuilder<Challenge, Challenge, QDistinct> distinctByTimeLimitSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeLimitSeconds');
    });
  }
}

extension ChallengeQueryProperty
    on QueryBuilder<Challenge, Challenge, QQueryProperty> {
  QueryBuilder<Challenge, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Challenge, DateTime?, QQueryOperations> completedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedAt');
    });
  }

  QueryBuilder<Challenge, int, QQueryOperations> completedRepsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedReps');
    });
  }

  QueryBuilder<Challenge, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Challenge, String, QQueryOperations> exerciseTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exerciseType');
    });
  }

  QueryBuilder<Challenge, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<Challenge, int, QQueryOperations> targetRepsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetReps');
    });
  }

  QueryBuilder<Challenge, int?, QQueryOperations> timeLimitSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeLimitSeconds');
    });
  }
}
