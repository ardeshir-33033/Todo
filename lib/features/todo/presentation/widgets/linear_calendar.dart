import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/core/extenstions/date_time_extensions.dart';
import 'package:todo_list/features/todo/presentation/manager/todo_list_bloc.dart';
import 'package:todo_list/locator.dart';

class LinearCalendar extends StatelessWidget {
  const LinearCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child:
            BlocBuilder<TodoListBloc, TodoListState>(builder: (context, state) {
          return PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 14 ~/ 7,
            itemBuilder: (context, index) {
              DateTime currentDate =
                  DateTime.now().add(Duration(days: index * 7));
              DateTime selectedDate = state.selectedDate;

              return WeekPage(
                startDate: currentDate,
                selectedDate: selectedDate,
              );
            },
          );
        }));
  }
}

class WeekPage extends StatelessWidget {
  final DateTime startDate;
  final DateTime selectedDate;

  const WeekPage(
      {super.key, required this.startDate, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(7, (dayIndex) {
        DateTime currentDate = startDate.add(Duration(days: dayIndex));

        return Expanded(
          child: DateCard(
            date: currentDate,
            isSelected: selectedDate.isSameDate(currentDate),
          ),
        );
      }),
    );
  }
}

class DateCard extends StatelessWidget {
  final DateTime date;
  final bool isSelected;

  const DateCard({super.key, required this.date, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        locator<TodoListBloc>().selectDate(date);
      },
      child: Container(
        height: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.green.withOpacity(0.7) : Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat('EEE').format(date),
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 10.0,
              ),
            ),
            Text(
              '${date.day}',
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black54,
                fontSize: 10.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
