import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LinearCalendar extends StatelessWidget {
  const LinearCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 14 ~/ 7,
          itemBuilder: (context, index) {
            DateTime currentDate = DateTime.now().add(Duration(days: index));

            return WeekPage(startDate: currentDate);
          },
        ));
  }
}

class WeekPage extends StatelessWidget {
  final DateTime startDate;

  const WeekPage({super.key, required this.startDate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(7, (dayIndex) {
        DateTime currentDate = startDate.add(Duration(days: dayIndex));

        return Expanded(
          child: DateCard(
            date: currentDate,
            isSelected: true,
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
    return Container(
      height: 70,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green : Colors.white,
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
    );
  }
}
