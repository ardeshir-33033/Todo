import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/features/todo/domain/entities/todo_item_entity.dart';

part 'todo_item_model.freezed.dart';
part 'todo_item_model.g.dart';

@freezed
class TodoItemModel extends TodoItemEntity with _$TodoItemModel {
  const factory TodoItemModel({
     String? time,
     String? text,
     String? color,
  }) = _TodoItemModel;

  factory TodoItemModel.fromJson(Map<String, dynamic> json) =>
      _$TodoItemModelFromJson(json);




  List<TodoItemModel> listFromJson2(dynamic json) {
    if (json != null) {
      return json.map<TodoItemModel>((j) {
        return TodoItemModel.fromJson(j);
      }).toList();
    }
    return [];
  }
}
