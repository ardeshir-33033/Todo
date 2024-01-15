import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/features/todo/domain/entities/todo_item_entity.dart';

class TodoItemWidget extends StatefulWidget {
  const TodoItemWidget({
    super.key,
    required this.todoItem,
  });

  final TodoItemEntity todoItem;

  @override
  State<TodoItemWidget> createState() => _TodoItemWidgetState();
}

class _TodoItemWidgetState extends State<TodoItemWidget> {
  ValueNotifier<bool> isSelected = ValueNotifier(false);

  @override
  void dispose() {
    isSelected.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapItem();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
            color: Color(int.parse("0xFF${widget.todoItem.color}"))
                .withOpacity(0.7),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('h:mm a')
                      .format(DateTime.parse(widget.todoItem.time!)),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.todoItem.text!,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
            ValueListenableBuilder(
                valueListenable: isSelected,
                builder: (context, _, child) {
                  return Checkbox(
                      value: widget.todoItem.isSelected,
                      shape: const CircleBorder(),
                      activeColor: Colors.transparent,
                      checkColor: Colors.white,
                      side: MaterialStateBorderSide.resolveWith(
                        (states) =>
                            const BorderSide(width: 1.5, color: Colors.white),
                      ),
                      onChanged: (val) {
                        onTapItem();
                      });
                })
          ],
        ),
      ),
    );
  }

  onTapItem() {
    widget.todoItem.isSelected = !(widget.todoItem.isSelected);
    isSelected.value = !(isSelected.value);
  }
}
