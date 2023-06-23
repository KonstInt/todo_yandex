// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_local_todo_task.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetApiLocalTodoTaskCollection on Isar {
  IsarCollection<ApiLocalTodoTask> get apiLocalTodoTasks => this.collection();
}

const ApiLocalTodoTaskSchema = CollectionSchema(
  name: r'ApiLocalTodoTask',
  id: 197562289866225457,
  properties: {
    r'changed_at': PropertySchema(
      id: 0,
      name: r'changed_at',
      type: IsarType.dateTime,
    ),
    r'color': PropertySchema(
      id: 1,
      name: r'color',
      type: IsarType.string,
    ),
    r'created_at': PropertySchema(
      id: 2,
      name: r'created_at',
      type: IsarType.dateTime,
    ),
    r'deadline': PropertySchema(
      id: 3,
      name: r'deadline',
      type: IsarType.dateTime,
    ),
    r'done': PropertySchema(
      id: 4,
      name: r'done',
      type: IsarType.bool,
    ),
    r'id': PropertySchema(
      id: 5,
      name: r'id',
      type: IsarType.string,
    ),
    r'importance': PropertySchema(
      id: 6,
      name: r'importance',
      type: IsarType.byte,
      enumMap: _ApiLocalTodoTaskimportanceEnumValueMap,
    ),
    r'last_updated_by': PropertySchema(
      id: 7,
      name: r'last_updated_by',
      type: IsarType.string,
    ),
    r'text': PropertySchema(
      id: 8,
      name: r'text',
      type: IsarType.string,
    )
  },
  estimateSize: _apiLocalTodoTaskEstimateSize,
  serialize: _apiLocalTodoTaskSerialize,
  deserialize: _apiLocalTodoTaskDeserialize,
  deserializeProp: _apiLocalTodoTaskDeserializeProp,
  idName: r'isar_id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _apiLocalTodoTaskGetId,
  getLinks: _apiLocalTodoTaskGetLinks,
  attach: _apiLocalTodoTaskAttach,
  version: '3.1.0+1',
);

int _apiLocalTodoTaskEstimateSize(
  ApiLocalTodoTask object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.color;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.id;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lastUpdatedBy;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.text;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _apiLocalTodoTaskSerialize(
  ApiLocalTodoTask object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.changedAt);
  writer.writeString(offsets[1], object.color);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeDateTime(offsets[3], object.deadline);
  writer.writeBool(offsets[4], object.done);
  writer.writeString(offsets[5], object.id);
  writer.writeByte(offsets[6], object.importance.index);
  writer.writeString(offsets[7], object.lastUpdatedBy);
  writer.writeString(offsets[8], object.text);
}

ApiLocalTodoTask _apiLocalTodoTaskDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ApiLocalTodoTask();
  object.changedAt = reader.readDateTimeOrNull(offsets[0]);
  object.color = reader.readStringOrNull(offsets[1]);
  object.createdAt = reader.readDateTimeOrNull(offsets[2]);
  object.deadline = reader.readDateTimeOrNull(offsets[3]);
  object.done = reader.readBoolOrNull(offsets[4]);
  object.id = reader.readStringOrNull(offsets[5]);
  object.importance = _ApiLocalTodoTaskimportanceValueEnumMap[
          reader.readByteOrNull(offsets[6])] ??
      ApiLocalTaskPriority.basic;
  object.lastUpdatedBy = reader.readStringOrNull(offsets[7]);
  object.text = reader.readStringOrNull(offsets[8]);
  return object;
}

P _apiLocalTodoTaskDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (_ApiLocalTodoTaskimportanceValueEnumMap[
              reader.readByteOrNull(offset)] ??
          ApiLocalTaskPriority.basic) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ApiLocalTodoTaskimportanceEnumValueMap = {
  'basic': 0,
  'important': 1,
  'low': 2,
};
const _ApiLocalTodoTaskimportanceValueEnumMap = {
  0: ApiLocalTaskPriority.basic,
  1: ApiLocalTaskPriority.important,
  2: ApiLocalTaskPriority.low,
};

Id _apiLocalTodoTaskGetId(ApiLocalTodoTask object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _apiLocalTodoTaskGetLinks(ApiLocalTodoTask object) {
  return [];
}

void _apiLocalTodoTaskAttach(
    IsarCollection<dynamic> col, Id id, ApiLocalTodoTask object) {}

extension ApiLocalTodoTaskQueryWhereSort
    on QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QWhere> {
  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ApiLocalTodoTaskQueryWhere
    on QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QWhereClause> {
  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterWhereClause>
      isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterWhereClause>
      isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ApiLocalTodoTaskQueryFilter
    on QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QFilterCondition> {
  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      changedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'changed_at',
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      changedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'changed_at',
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      changedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'changed_at',
        value: value,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      changedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'changed_at',
        value: value,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      changedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'changed_at',
        value: value,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      changedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'changed_at',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      colorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'color',
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      colorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'color',
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      colorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'color',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      colorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'color',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      colorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'color',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      colorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'color',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      colorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'color',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      colorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'color',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      colorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'color',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      colorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'color',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      colorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'color',
        value: '',
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      colorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'color',
        value: '',
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'created_at',
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'created_at',
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'created_at',
        value: value,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'created_at',
        value: value,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      createdAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'created_at',
        value: value,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      createdAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'created_at',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      deadlineIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deadline',
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      deadlineIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deadline',
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      deadlineEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deadline',
        value: value,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      deadlineGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deadline',
        value: value,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      deadlineLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deadline',
        value: value,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      deadlineBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deadline',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      doneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'done',
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      doneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'done',
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      doneEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'done',
        value: value,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      idEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      idGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      idLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      idBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      idContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      idMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      importanceEqualTo(ApiLocalTaskPriority value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'importance',
        value: value,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      importanceGreaterThan(
    ApiLocalTaskPriority value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'importance',
        value: value,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      importanceLessThan(
    ApiLocalTaskPriority value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'importance',
        value: value,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      importanceBetween(
    ApiLocalTaskPriority lower,
    ApiLocalTaskPriority upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'importance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isar_id',
        value: value,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isar_id',
        value: value,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isar_id',
        value: value,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isar_id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      lastUpdatedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'last_updated_by',
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      lastUpdatedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'last_updated_by',
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      lastUpdatedByEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'last_updated_by',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      lastUpdatedByGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'last_updated_by',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      lastUpdatedByLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'last_updated_by',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      lastUpdatedByBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'last_updated_by',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      lastUpdatedByStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'last_updated_by',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      lastUpdatedByEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'last_updated_by',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      lastUpdatedByContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'last_updated_by',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      lastUpdatedByMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'last_updated_by',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      lastUpdatedByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'last_updated_by',
        value: '',
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      lastUpdatedByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'last_updated_by',
        value: '',
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      textIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'text',
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      textIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'text',
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      textEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      textGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      textLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      textBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'text',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      textStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      textEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      textContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      textMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'text',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      textIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: '',
      ));
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterFilterCondition>
      textIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'text',
        value: '',
      ));
    });
  }
}

extension ApiLocalTodoTaskQueryObject
    on QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QFilterCondition> {}

extension ApiLocalTodoTaskQueryLinks
    on QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QFilterCondition> {}

extension ApiLocalTodoTaskQuerySortBy
    on QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QSortBy> {
  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy>
      sortByChangedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'changed_at', Sort.asc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy>
      sortByChangedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'changed_at', Sort.desc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy> sortByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.asc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy>
      sortByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.desc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created_at', Sort.asc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created_at', Sort.desc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy>
      sortByDeadline() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deadline', Sort.asc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy>
      sortByDeadlineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deadline', Sort.desc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy> sortByDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'done', Sort.asc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy>
      sortByDoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'done', Sort.desc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy>
      sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy>
      sortByImportance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importance', Sort.asc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy>
      sortByImportanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importance', Sort.desc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy>
      sortByLastUpdatedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_updated_by', Sort.asc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy>
      sortByLastUpdatedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_updated_by', Sort.desc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy> sortByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy>
      sortByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }
}

extension ApiLocalTodoTaskQuerySortThenBy
    on QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QSortThenBy> {
  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy>
      thenByChangedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'changed_at', Sort.asc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy>
      thenByChangedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'changed_at', Sort.desc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy> thenByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.asc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy>
      thenByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.desc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created_at', Sort.asc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created_at', Sort.desc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy>
      thenByDeadline() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deadline', Sort.asc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy>
      thenByDeadlineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deadline', Sort.desc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy> thenByDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'done', Sort.asc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy>
      thenByDoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'done', Sort.desc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy>
      thenByImportance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importance', Sort.asc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy>
      thenByImportanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importance', Sort.desc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isar_id', Sort.asc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isar_id', Sort.desc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy>
      thenByLastUpdatedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_updated_by', Sort.asc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy>
      thenByLastUpdatedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_updated_by', Sort.desc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy> thenByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QAfterSortBy>
      thenByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }
}

extension ApiLocalTodoTaskQueryWhereDistinct
    on QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QDistinct> {
  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QDistinct>
      distinctByChangedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'changed_at');
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QDistinct> distinctByColor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'color', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'created_at');
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QDistinct>
      distinctByDeadline() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deadline');
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QDistinct> distinctByDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'done');
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QDistinct>
      distinctByImportance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'importance');
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QDistinct>
      distinctByLastUpdatedBy({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'last_updated_by',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QDistinct> distinctByText(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'text', caseSensitive: caseSensitive);
    });
  }
}

extension ApiLocalTodoTaskQueryProperty
    on QueryBuilder<ApiLocalTodoTask, ApiLocalTodoTask, QQueryProperty> {
  QueryBuilder<ApiLocalTodoTask, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isar_id');
    });
  }

  QueryBuilder<ApiLocalTodoTask, DateTime?, QQueryOperations>
      changedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'changed_at');
    });
  }

  QueryBuilder<ApiLocalTodoTask, String?, QQueryOperations> colorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'color');
    });
  }

  QueryBuilder<ApiLocalTodoTask, DateTime?, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'created_at');
    });
  }

  QueryBuilder<ApiLocalTodoTask, DateTime?, QQueryOperations>
      deadlineProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deadline');
    });
  }

  QueryBuilder<ApiLocalTodoTask, bool?, QQueryOperations> doneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'done');
    });
  }

  QueryBuilder<ApiLocalTodoTask, String?, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ApiLocalTodoTask, ApiLocalTaskPriority, QQueryOperations>
      importanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'importance');
    });
  }

  QueryBuilder<ApiLocalTodoTask, String?, QQueryOperations>
      lastUpdatedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'last_updated_by');
    });
  }

  QueryBuilder<ApiLocalTodoTask, String?, QQueryOperations> textProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'text');
    });
  }
}
