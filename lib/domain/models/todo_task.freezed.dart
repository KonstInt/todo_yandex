// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TodoTask {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  TaskPriority get importance => throw _privateConstructorUsedError;
  bool get done => throw _privateConstructorUsedError;
  bool get isSynchronized => throw _privateConstructorUsedError;
  DateTime? get deadline => throw _privateConstructorUsedError;
  Color? get color => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get changedAt => throw _privateConstructorUsedError;
  String get lastUpdatedBy => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoTaskCopyWith<TodoTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoTaskCopyWith<$Res> {
  factory $TodoTaskCopyWith(TodoTask value, $Res Function(TodoTask) then) =
      _$TodoTaskCopyWithImpl<$Res, TodoTask>;
  @useResult
  $Res call(
      {String id,
      String text,
      TaskPriority importance,
      bool done,
      bool isSynchronized,
      DateTime? deadline,
      Color? color,
      DateTime createdAt,
      DateTime changedAt,
      String lastUpdatedBy});
}

/// @nodoc
class _$TodoTaskCopyWithImpl<$Res, $Val extends TodoTask>
    implements $TodoTaskCopyWith<$Res> {
  _$TodoTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? importance = null,
    Object? done = null,
    Object? isSynchronized = null,
    Object? deadline = freezed,
    Object? color = freezed,
    Object? createdAt = null,
    Object? changedAt = null,
    Object? lastUpdatedBy = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      importance: null == importance
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as TaskPriority,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      isSynchronized: null == isSynchronized
          ? _value.isSynchronized
          : isSynchronized // ignore: cast_nullable_to_non_nullable
              as bool,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      changedAt: null == changedAt
          ? _value.changedAt
          : changedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastUpdatedBy: null == lastUpdatedBy
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodoTaskCopyWith<$Res> implements $TodoTaskCopyWith<$Res> {
  factory _$$_TodoTaskCopyWith(
          _$_TodoTask value, $Res Function(_$_TodoTask) then) =
      __$$_TodoTaskCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String text,
      TaskPriority importance,
      bool done,
      bool isSynchronized,
      DateTime? deadline,
      Color? color,
      DateTime createdAt,
      DateTime changedAt,
      String lastUpdatedBy});
}

/// @nodoc
class __$$_TodoTaskCopyWithImpl<$Res>
    extends _$TodoTaskCopyWithImpl<$Res, _$_TodoTask>
    implements _$$_TodoTaskCopyWith<$Res> {
  __$$_TodoTaskCopyWithImpl(
      _$_TodoTask _value, $Res Function(_$_TodoTask) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? importance = null,
    Object? done = null,
    Object? isSynchronized = null,
    Object? deadline = freezed,
    Object? color = freezed,
    Object? createdAt = null,
    Object? changedAt = null,
    Object? lastUpdatedBy = null,
  }) {
    return _then(_$_TodoTask(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      importance: null == importance
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as TaskPriority,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      isSynchronized: null == isSynchronized
          ? _value.isSynchronized
          : isSynchronized // ignore: cast_nullable_to_non_nullable
              as bool,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      changedAt: null == changedAt
          ? _value.changedAt
          : changedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastUpdatedBy: null == lastUpdatedBy
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TodoTask implements _TodoTask {
  _$_TodoTask(
      {required this.id,
      required this.text,
      required this.importance,
      required this.done,
      required this.isSynchronized,
      this.deadline,
      this.color,
      required this.createdAt,
      required this.changedAt,
      required this.lastUpdatedBy});

  @override
  final String id;
  @override
  final String text;
  @override
  final TaskPriority importance;
  @override
  final bool done;
  @override
  final bool isSynchronized;
  @override
  final DateTime? deadline;
  @override
  final Color? color;
  @override
  final DateTime createdAt;
  @override
  final DateTime changedAt;
  @override
  final String lastUpdatedBy;

  @override
  String toString() {
    return 'TodoTask(id: $id, text: $text, importance: $importance, done: $done, isSynchronized: $isSynchronized, deadline: $deadline, color: $color, createdAt: $createdAt, changedAt: $changedAt, lastUpdatedBy: $lastUpdatedBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoTask &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.importance, importance) ||
                other.importance == importance) &&
            (identical(other.done, done) || other.done == done) &&
            (identical(other.isSynchronized, isSynchronized) ||
                other.isSynchronized == isSynchronized) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.changedAt, changedAt) ||
                other.changedAt == changedAt) &&
            (identical(other.lastUpdatedBy, lastUpdatedBy) ||
                other.lastUpdatedBy == lastUpdatedBy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, text, importance, done,
      isSynchronized, deadline, color, createdAt, changedAt, lastUpdatedBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoTaskCopyWith<_$_TodoTask> get copyWith =>
      __$$_TodoTaskCopyWithImpl<_$_TodoTask>(this, _$identity);
}

abstract class _TodoTask implements TodoTask {
  factory _TodoTask(
      {required final String id,
      required final String text,
      required final TaskPriority importance,
      required final bool done,
      required final bool isSynchronized,
      final DateTime? deadline,
      final Color? color,
      required final DateTime createdAt,
      required final DateTime changedAt,
      required final String lastUpdatedBy}) = _$_TodoTask;

  @override
  String get id;
  @override
  String get text;
  @override
  TaskPriority get importance;
  @override
  bool get done;
  @override
  bool get isSynchronized;
  @override
  DateTime? get deadline;
  @override
  Color? get color;
  @override
  DateTime get createdAt;
  @override
  DateTime get changedAt;
  @override
  String get lastUpdatedBy;
  @override
  @JsonKey(ignore: true)
  _$$_TodoTaskCopyWith<_$_TodoTask> get copyWith =>
      throw _privateConstructorUsedError;
}
