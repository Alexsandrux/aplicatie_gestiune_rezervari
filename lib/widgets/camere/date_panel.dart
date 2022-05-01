import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePanel extends StatefulWidget {
  final Function dataPicker;
  final String title;
  final String missingMesssage;
  final DateTime? choosedDate;

  const DatePanel(
      {required this.choosedDate,
      required this.title,
      required this.missingMesssage,
      required this.dataPicker,
      Key? key})
      : super(key: key);

  @override
  State<DatePanel> createState() => _DatePanelState();
}

class _DatePanelState extends State<DatePanel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.title),
        Text(widget.choosedDate != null
            ? DateFormat.yMMMd().format(widget.choosedDate!).toString()
            : widget.missingMesssage),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: IconButton(
            color: Colors.deepPurple,
            onPressed: () {
              widget.dataPicker();
            },
            icon: const Icon(Icons.more_time_outlined),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
