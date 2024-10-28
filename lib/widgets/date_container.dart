import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jotit_app/helper/constants.dart';

class DateContainer extends StatelessWidget {
  const DateContainer({super.key, this.selectedDate});
  final DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kPrimaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            // Display the formatted date
            DateFormat('yyyy-MM-dd').format(selectedDate!),
            style: const TextStyle(fontSize: 16),
          ),
          const Icon(Icons.calendar_today),
        ],
      ),
    );
  }
}
