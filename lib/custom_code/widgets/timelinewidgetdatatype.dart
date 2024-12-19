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
import '/backend/schema/structs/index.dart'; // Import the struct definition

class Timelinewidgetdatatype extends StatefulWidget {
  const Timelinewidgetdatatype({
    Key? key,
    this.width,
    this.height,
    required this.timrlinewidget,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<TimelinedocumentStruct> timrlinewidget;

  @override
  _TimelinewidgetdatatypeState createState() => _TimelinewidgetdatatypeState();
}

class _TimelinewidgetdatatypeState extends State<Timelinewidgetdatatype> {
  CalendarController _controller = CalendarController();

  @override
  void initState() {
    super.initState();
    _controller.displayDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.chevron_left),
                onPressed: () {
                  setState(() {
                    _controller.displayDate = DateTime(
                        _controller.displayDate!.year,
                        _controller.displayDate!.month - 1,
                        _controller.displayDate!.day);
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.chevron_right),
                onPressed: () {
                  setState(() {
                    _controller.displayDate = DateTime(
                        _controller.displayDate!.year,
                        _controller.displayDate!.month + 1,
                        _controller.displayDate!.day);
                  });
                },
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

    for (var item in widget.timrlinewidget) {
      final DateTime day = item.date ?? DateTime.now();
      final String subject = item.subject ?? "Subject not specified";
      final Color color = colors[meetings.length % colors.length];
      meetings.add(Meeting(
        subject,
        day, // Using a single DateTime field
        color,
        true, // Assuming it's not an all-day event
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
  DateTime getStartTime(int index) {
    // Return the start of the day for all events
    final eventDate = _getMeetingData(index).eventDate;
    return DateTime(eventDate.year, eventDate.month, eventDate.day);
  }

  @override
  DateTime getEndTime(int index) {
    // Return the end of the day for all events
    final eventDate = _getMeetingData(index).eventDate;
    return DateTime(eventDate.year, eventDate.month, eventDate.day, 23, 59);
  }

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
  DateTime eventDate; // Single DateTime field
  Color background;
  bool isAllDay;

  Meeting(this.eventName, this.eventDate, this.background, this.isAllDay);
}
