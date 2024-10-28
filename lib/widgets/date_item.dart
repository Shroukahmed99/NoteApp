import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jotit_app/helper/constants.dart';
import 'package:jotit_app/widgets/date_container.dart';

class DateItem extends StatefulWidget {
  const DateItem({
    super.key,
    required this.date,
    required this.onDateChanged,
  });

  final String date; // The initial date string
  final ValueChanged<String> onDateChanged; // Callback to notify when the date changes

  @override
  State<DateItem> createState() => _DateItemState();
}

class _DateItemState extends State<DateItem> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    // Initialize the selected date from the widget's initial date
    selectedDate = DateFormat('yyyy-MM-dd').parse(widget.date);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        // Format the selected date to a string
        String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);
        widget.onDateChanged(formattedDate);  // Notify the parent widget
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: DateContainer(selectedDate: selectedDate,),
    );
  }
}
