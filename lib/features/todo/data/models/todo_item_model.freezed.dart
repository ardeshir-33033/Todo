// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TodoItemModel _$TodoItemModelFromJson(Map<String, dynamic> json) {
  return _TodoItemModel.fromJson(json);
}

/// @nodoc
mixin _$TodoItemModel {
  String? get time => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoItemModelCopyWith<TodoItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoItemModelCopyWith<$Res> {
  factory $TodoItemModelCopyWith(
          TodoItemModel value, $Res Function(TodoItemModel) then) =
      _$TodoItemModelCopyWithImpl<$Res, TodoItemModel>;
  @useResult
  $Res call({String? time, String? text, String? color});
}

/// @nodoc
class _$TodoItemModelCopyWithImpl<$Res, $Val extends TodoItemModel>
    implements $TodoItemModelCopyWith<$Res> {
  _$TodoItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = freezed,
    Object? text = freezed,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoItemModelImplCopyWith<$Res>
    implements $TodoItemModelCopyWith<$Res> {
  factory _$$TodoItemModelImplCopyWith(
          _$TodoItemModelImpl value, $Res Function(_$TodoItemModelImpl) then) =
      __$$TodoItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? time, String? text, String? color});
}

/// @nodoc
class __$$TodoItemModelImplCopyWithImpl<$Res>
    extends _$TodoItemModelCopyWithImpl<$Res, _$TodoItemModelImpl>
    implements _$$TodoItemModelImplCopyWith<$Res> {
  __$$TodoItemModelImplCopyWithImpl(
      _$TodoItemModelImpl _value, $Res Function(_$TodoItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = freezed,
    Object? text = freezed,
    Object? color = freezed,
  }) {
    return _then(_$TodoItemModelImpl(
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodoItemModelImpl implements _TodoItemModel {
  const _$TodoItemModelImpl({this.time, this.text, this.color});

  factory _$TodoItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoItemModelImplFromJson(json);

  @override
  final String? time;
  @override
  final String? text;
  @override
  final String? color;

  @override
  String toString() {
    return 'TodoItemModel(time: $time, text: $text, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoItemModelImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, time, text, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoItemModelImplCopyWith<_$TodoItemModelImpl> get copyWith =>
      __$$TodoItemModelImplCopyWithImpl<_$TodoItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoItemModelImplToJson(
      this,
    );
  }

  @override
  set color(String? _color) {
    // TODO: implement color
  }

  @override
  List<TodoItemModel> listFromJson2(json) {
    // TODO: implement listFromJson2
    throw UnimplementedError();
  }

  @override
  set text(String? _text) {
    // TODO: implement text
  }

  @override
  set time(String? _time) {
    // TODO: implement time
  }
}

abstract class _TodoItemModel implements TodoItemModel {
  const factory _TodoItemModel(
      {final String? time,
      final String? text,
      final String? color}) = _$TodoItemModelImpl;

  factory _TodoItemModel.fromJson(Map<String, dynamic> json) =
      _$TodoItemModelImpl.fromJson;

  @override
  String? get time;
  @override
  String? get text;
  @override
  String? get color;
  @override
  @JsonKey(ignore: true)
  _$$TodoItemModelImplCopyWith<_$TodoItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
