import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:teachers_marks/constants.dart';

class DateSelectionDialog extends StatefulWidget {
  final String initialDate;
  final ValueChanged<String> onDateSelected;
  final ValueChanged<String> onDateSelectedDay;
  final ValueChanged<String> onDateSelectedDate;

  DateSelectionDialog({required this.initialDate, required this.onDateSelected,required this.onDateSelectedDay, required this.onDateSelectedDate});

  @override
  _DateSelectionDialogState createState() => _DateSelectionDialogState();
}

class _DateSelectionDialogState extends State<DateSelectionDialog> {
  late String formattedDate;
 late String day;
  late String date;
  @override
  void initState() {
    super.initState();
    formattedDate = widget.initialDate;
  }

  Future<void> _presentDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        day = intl.DateFormat('EEEE').format(pickedDate);
        date = intl.DateFormat('y/M/d').format(pickedDate);
        formattedDate = intl.DateFormat('EEEE, y/M/d').format(pickedDate);
      });
      widget.onDateSelected(formattedDate);
      widget.onDateSelectedDay(day);
      widget.onDateSelectedDate(date); // Call the callback with the new date
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.035),
      child: Column(
        children: [
          SizedBox(height: 10),
          InkWell(
            onTap: _presentDatePicker,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.add),
                Spacer(),
                Text(formattedDate.isNotEmpty ? formattedDate : 'اختر اليوم',
                    style: TextStyle(
                      fontFamily: Almarai,
                    )),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}