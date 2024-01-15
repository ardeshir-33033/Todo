abstract class TodoItemEntity {
  String? time;
  String? text;
  String? color;
  bool isSelected = false;

  TodoItemEntity({this.time, this.color, this.text});
}
