import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/features/todo/domain/entities/todo_item_entity.dart';

part 'todo_item_model.freezed.dart';
part 'todo_item_model.g.dart';

@freezed
class TodoItemModel extends TodoItemEntity with _$TodoItemModel {
  factory TodoItemModel({
    String? time,
    String? text,
    String? color,
  }) = _TodoItemModel;

  factory TodoItemModel.fromJson(Map<String, dynamic> json) =>
      _$TodoItemModelFromJson(json);
}
