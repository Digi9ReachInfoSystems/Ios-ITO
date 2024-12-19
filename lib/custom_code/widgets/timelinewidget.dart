// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:syncfusion_flutter_calendar/calendar.dart';

class Timelinewidget extends StatefulWidget {
  const Timelinewidget({
    Key? key,
    this.width,
    this.height,
    required this.dates,
    required this.subjects,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<String> dates;
  final List<String> subjects;

  @override
  _TimelinewidgetState createState() => _TimelinewidgetState();
}

class _TimelinewidgetState extends State<Timelinewidget> {
  DateTime _currentMonth = DateTime.now();
  CalendarController _controller = CalendarController();

  @override
  void initState() {
    super.initState();
    _controller.displayDate = _currentMonth;
  }

  void _changeMonth(bool isNext) {
    setState(() {
      _currentMonth = DateTime(
        _currentMonth.year,
        _currentMonth.month + (isNext ? 1 : -1),
      );
      _controller.displayDate = _currentMonth;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => _changeMonth(false),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () => _changeMonth(true),
              ),
            ],
          ),
          Expanded(
            child: SfCalendar(
              controller: _controller,
              view: CalendarView.month,
              dataSource: MeetingDataSource(_getDataSource()),
              monthViewSettings: const MonthViewSettings(
                appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
                showAgenda: true,
                appointmentDisplayCount: 2,
                agendaItemHeight: 70,
                monthCellStyle: MonthCellStyle(
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final List<Color> colors = [
      Color(0xFF6610F2), // Equivalent to Color.fromARGB(255, 233, 140, 134)
      Color(0xFFFD7E14), // Equivalent to Color.fromARGB(255, 139, 225, 141)
      Color(0xFFAFBE29), // Equivalent to Color.fromARGB(255, 139, 186, 224)
      Color(0xFF0DCAF0),
      Color(0xFF198754),
      Color(0xFF863DFF),
      // ... add other colors as needed
    ];

    for (int i = 0; i < widget.dates.length; i++) {
      final DateTime day = DateTime.parse(widget.dates[i]); // Parsing the date
      final Color color = colors[i % colors.length];

      meetings.add(Meeting(
        widget.subjects[i],
        day,
        color,
        true, // Assuming it's always an all-day event
      ));
    }
    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) => _getMeetingData(index).day;

  @override
  DateTime getEndTime(int index) => _getMeetingData(index).day;

  @override
  String getSubject(int index) => _getMeetingData(index).eventName;

  @override
  Color getColor(int index) => _getMeetingData(index).background;

  @override
  bool isAllDay(int index) => _getMeetingData(index).isAllDay;

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    if (meeting is Meeting) {
      return meeting;
    }
    throw ArgumentError('Invalid argument for meeting at index $index');
  }
}

class Meeting {
  String eventName;
  DateTime day; // Using just one day for start and end
  Color background;
  bool isAllDay;

  Meeting(this.eventName, this.day, this.background, this.isAllDay);
}
