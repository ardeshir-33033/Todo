import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoListTopDateWidget extends StatelessWidget {
  const TodoListTopDateWidget({
    super.key,
    required this.selectedDate,
  });

  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          DateFormat('EEEE').format(selectedDate),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        Text(
          "${selectedDate.day} ${DateFormat('MMM').format(selectedDate)}, ${selectedDate.year}",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 10.0,
          ),
        ),
      ],
    );
  }
}
