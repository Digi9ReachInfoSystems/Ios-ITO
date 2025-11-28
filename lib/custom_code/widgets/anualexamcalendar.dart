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

import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';
import 'dart:collection';
import 'dart:convert';
import 'package:intl/intl.dart';

class Anualexamcalendar extends StatefulWidget {
  const Anualexamcalendar({
    super.key,
    this.width,
    this.height,
    this.examdata,
    required this.slot,
  });

  final double? width;
  final double? height;
  final dynamic examdata;
  final int slot;

  @override
  State<Anualexamcalendar> createState() => _AnualexamcalendarState();
}

class _AnualexamcalendarState extends State<Anualexamcalendar> {
  // Pastel palette light
  final List<Color> pastelColors = [
    Color(0xFFFFF3E0),
    Color(0xFFE8F5E9),
    Color(0xFFE3F2FD),
    Color(0xFFF3E5F5),
    Color(0xFFFFFDE7),
    Color(0xFFFFEBEE),
    Color(0xFFEDE7F6),
    Color(0xFFF1F8E9),
  ];

  // Darker colors
  final List<Color> pastelDarker = [
    Color(0xFFFFE0B2),
    Color(0xFFC8E6C9),
    Color(0xFFBBDEFB),
    Color(0xFFE1BEE7),
    Color(0xFFFFF59D),
    Color(0xFFFFCDD2),
    Color(0xFFD1C4E9),
    Color(0xFFC5E1A5),
  ];

  late Map<DateTime, String> _dateToSubject;
  late Map<String, List<DateTime>> _subjectToDates;
  List<String> _subjects = [];
  String? _slotName;
  DateTime _focusedMonth = DateTime.now();
  DateTime? _selectedDate;
  bool _hasData = false;
  final ScrollController _chipsController = ScrollController();

  @override
  void initState() {
    super.initState();
    _dateToSubject = {};
    _subjectToDates = {};
    _subjects = [];
    _parseExamData();
  }

  @override
  void didUpdateWidget(covariant Anualexamcalendar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.examdata != widget.examdata ||
        oldWidget.slot != widget.slot) {
      _parseExamData();
    }
  }

  @override
  void dispose() {
    _chipsController.dispose();
    super.dispose();
  }

  void _parseExamData() {
    _dateToSubject = {};
    _subjectToDates = {};
    _subjects = [];
    _slotName = null;
    _selectedDate = null;
    _hasData = false;

    final raw = widget.examdata;
    Map<String, dynamic>? root;

    if (raw == null) {
      setState(() => _hasData = false);
      return;
    }

    try {
      if (raw is String) {
        root = jsonDecode(raw);
      } else if (raw is Map<String, dynamic>) {
        root = raw;
      } else if (raw is Map) {
        root = Map<String, dynamic>.from(raw);
      }
    } catch (e) {
      root = null;
    }

    final sched = root != null
        ? (root['annualExamSchedule'] ??
            root['annualexamSchedule'] ??
            root['annual_exam_schedule'])
        : null;

    if (sched == null || sched is! Map) {
      setState(() => _hasData = false);
      return;
    }

    final slotKeys = sched.keys.map((e) => e.toString()).toList();
    if (slotKeys.isEmpty) {
      setState(() => _hasData = false);
      return;
    }

    String chosenSlot = '';
    final slotLower = 'slot ${widget.slot}';

    for (final k in slotKeys) {
      if (k.toLowerCase().contains(slotLower)) {
        chosenSlot = k;
        break;
      }
    }

    if (chosenSlot.isEmpty) {
      final idx = widget.slot - 1;
      chosenSlot =
          (idx >= 0 && idx < slotKeys.length) ? slotKeys[idx] : slotKeys.first;
    }

    _slotName = chosenSlot;
    final rawSlotMap = sched[chosenSlot];

    if (rawSlotMap == null || rawSlotMap is! Map) {
      setState(() => _hasData = false);
      return;
    }

    final tmpMap = <DateTime, String>{};
    for (final monthKey in rawSlotMap.keys) {
      final monthMap = rawSlotMap[monthKey];
      if (monthMap is Map) {
        for (final subj in monthMap.keys) {
          final dateString = monthMap[subj];
          if (dateString is String) {
            try {
              final dt = DateTime.parse(dateString);
              final d = DateTime(dt.year, dt.month, dt.day);
              tmpMap[d] = subj.toString();
            } catch (_) {}
          }
        }
      }
    }

    if (tmpMap.isEmpty) {
      setState(() => _hasData = false);
      return;
    }

    final sorted =
        SplayTreeMap<DateTime, String>.from(tmpMap, (a, b) => a.compareTo(b));
    _dateToSubject = Map.from(sorted);

    final subjMap = <String, List<DateTime>>{};
    for (final e in _dateToSubject.entries) {
      subjMap.putIfAbsent(e.value, () => []).add(e.key);
    }

    _subjectToDates = subjMap;
    _subjects = _subjectToDates.keys.toList();

    final today = DateTime.now();
    final todayOnly = DateTime(today.year, today.month, today.day);

    DateTime? firstUpcoming;
    for (final d in _dateToSubject.keys) {
      if (!d.isBefore(todayOnly)) {
        firstUpcoming = d;
        break;
      }
    }

    if (firstUpcoming != null) {
      _focusedMonth = DateTime(firstUpcoming.year, firstUpcoming.month, 1);
      _selectedDate = firstUpcoming;
    } else {
      _focusedMonth = DateTime(today.year, today.month, 1);
    }

    setState(() => _hasData = true);
  }

  Color _light(String subject) {
    final i = _subjects.indexOf(subject);
    return pastelColors[(i >= 0 ? i : 0) % pastelColors.length];
  }

  Color _dark(String subject) {
    final i = _subjects.indexOf(subject);
    return pastelDarker[(i >= 0 ? i : 0) % pastelDarker.length];
  }

  void _showExamDialog(DateTime date, String subject) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          backgroundColor: _light(subject),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(subject,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800)),
                    SizedBox(height: 8),
                    Text(DateFormat('EEEE, d MMMM yyyy').format(date)),
                    SizedBox(height: 12),
                    Divider(),
                    SizedBox(height: 6),
                    Text('Slot: ${_slotName ?? '-'}'),
                    SizedBox(height: 10),
                    if (_subjectToDates[subject] != null &&
                        _subjectToDates[subject]!.length > 1)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _subjectToDates[subject]!
                            .map(
                                (d) => Text(DateFormat('d MMM yyyy').format(d)))
                            .toList(),
                      ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                  icon: Icon(Icons.close_rounded),
                  onPressed: () => Navigator.pop(ctx),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  List<DateTime> _daysInMonth(DateTime m) {
    final first = DateTime(m.year, m.month, 1);
    final next = DateTime(m.year, m.month + 1, 1);
    final last = next.subtract(Duration(days: 1));
    return List.generate(last.day, (i) => DateTime(m.year, m.month, i + 1));
  }

  void _prevMonth() => setState(() =>
      _focusedMonth = DateTime(_focusedMonth.year, _focusedMonth.month - 1, 1));
  void _nextMonth() => setState(() =>
      _focusedMonth = DateTime(_focusedMonth.year, _focusedMonth.month + 1, 1));

  Widget _chips() {
    if (!_hasData || _subjects.isEmpty) {
      return Container(
          height: 56,
          alignment: Alignment.centerLeft,
          child: Text('No exams available'));
    }

    return SizedBox(
      height: 66,
      child: ListView.separated(
        controller: _chipsController,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        itemCount: _subjects.length,
        separatorBuilder: (_, __) => SizedBox(width: 8),
        itemBuilder: (context, i) {
          final subj = _subjects[i];
          final firstDate = _subjectToDates[subj]!.first;
          final isSelected = _selectedDate == firstDate;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDate = firstDate;
                _focusedMonth = DateTime(firstDate.year, firstDate.month, 1);
              });
              _chipsController.animateTo((i * 140).toDouble(),
                  duration: Duration(milliseconds: 300), curve: Curves.ease);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: _light(subj),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 140),
                    child: Text(subj,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.w700)),
                  ),
                  // SizedBox(width: 6),
                  // Text(DateFormat('d MMM').format(firstDate))
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _calendarGrid() {
    final days = _daysInMonth(_focusedMonth);
    final firstWeekday =
        DateTime(_focusedMonth.year, _focusedMonth.month, 1).weekday % 7;

    final totalCells = firstWeekday + days.length;
    final rows = (totalCells / 7).ceil();

    List<Widget> rowWidgets = [];
    int index = 0;

    for (int r = 0; r < rows; r++) {
      List<Widget> cells = [];

      for (int c = 0; c < 7; c++) {
        final pos = r * 7 + c;

        if (pos < firstWeekday || index >= days.length) {
          cells.add(Expanded(child: SizedBox(height: 64)));
        } else {
          final day = days[index++];
          final dOnly = DateTime(day.year, day.month, day.day);
          final hasExam = _dateToSubject.containsKey(dOnly);
          final subj = hasExam ? _dateToSubject[dOnly]! : null;

          cells.add(
            Expanded(
              child: InkWell(
                onTap: () {
                  if (hasExam && subj != null) _showExamDialog(dOnly, subj);
                  setState(() => _selectedDate = dOnly);
                },
                child: Container(
                  margin: EdgeInsets.all(4),
                  padding: EdgeInsets.all(6),
                  height: 64,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Text('${day.day}',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                      ),
                      Spacer(),
                      if (hasExam)
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: _dark(subj!),
                            shape: BoxShape.circle,
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      }

      rowWidgets.add(Row(children: cells));
    }

    return Column(children: rowWidgets);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 520,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_slotName ?? 'Exam Schedule',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
          SizedBox(height: 6),
          _chips(),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: _prevMonth, icon: Icon(Icons.chevron_left)),
              Text(DateFormat.yMMMM().format(_focusedMonth),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
              IconButton(
                  onPressed: _nextMonth, icon: Icon(Icons.chevron_right)),
            ],
          ),
          Row(
            children: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
                .map((e) => Expanded(
                    child: Center(
                        child: Text(e,
                            style: TextStyle(fontWeight: FontWeight.w600)))))
                .toList(),
          ),
          SizedBox(height: 6),
          Expanded(child: SingleChildScrollView(child: _calendarGrid())),
        ],
      ),
    );
  }
}
