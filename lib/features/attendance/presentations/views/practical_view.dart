import 'package:flutter/material.dart';
import 'package:teachers_marks/features/attendance/presentations/views/date_detail_view.dart';
import 'package:intl/intl.dart'; // Import intl package

class PracticalView extends StatefulWidget {
  final List<DateTime> selectedDates;
  PracticalView({required this.selectedDates});
  @override
  State<PracticalView> createState() => _PracticalViewState();
}

class _PracticalViewState extends State<PracticalView> {
  double h = 1;
  double w = 1;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Expanded(
      child: ListView.builder(
        itemCount: widget.selectedDates.length,
        itemBuilder: (context, index) {
          // Format the date
          String formattedDate =
              DateFormat('E d/M/y').format(widget.selectedDates[index]);
          return Card(
            elevation: 3,
            color: Colors.white,
            child: ListTile(
              title: Text(
                textAlign: TextAlign.center,
                formattedDate, // Display the formatted date
                style: const TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DateDetailView(date: widget.selectedDates[index]),
                  ),
                );
              },
            ),
            // Divider(),
          );
        },
      ),
    );
  }
}
