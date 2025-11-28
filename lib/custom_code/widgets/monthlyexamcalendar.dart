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

import 'dart:collection';
import 'dart:convert';
import 'package:intl/intl.dart';

class Monthlyexamcalendar extends StatefulWidget {
  const Monthlyexamcalendar({
    super.key,
    this.width,
    this.height,
    required this.monthlyexamdata,
  });

  final double? width;
  final double? height;
  final dynamic monthlyexamdata;

  @override
  State<Monthlyexamcalendar> createState() => _MonthlyexamcalendarState();
}

class _MonthlyexamcalendarState extends State<Monthlyexamcalendar> {
  // Pastel palette (cycle through)
  final List<Color> pastelColors = [
    Color(0xFFFFF3E0), // light peach
    Color(0xFFE8F5E9), // light mint
    Color(0xFFE3F2FD), // light blue
    Color(0xFFF3E5F5), // light lavender
    Color(0xFFFFFDE7), // light yellow
    Color(0xFFFFEBEE), // light pink
    Color(0xFFEDE7F6), // soft purple
    Color(0xFFF1F8E9), // soft green
  ];

  // Darker shades for calendar dot (same order)
  final List<Color> pastelDarkDots = [
    Color(0xFFBF7A1A),
    Color(0xFF2E7D32),
    Color(0xFF1976D2),
    Color(0xFF8E24AA),
    Color(0xFFF9A825),
    Color(0xFFD32F2F),
    Color(0xFF5E35B1),
    Color(0xFF7CB342),
  ];

  // Slightly lighter backgrounds for detail container (same order)
  final List<Color> pastelLightBg = [
    Color(0xFFFFF8F0),
    Color(0xFFF1FBF2),
    Color(0xFFF0F7FF),
    Color(0xFFF9F3FB),
    Color(0xFFFFFDF2),
    Color(0xFFFFF5F5),
    Color(0xFFF8F6FB),
    Color(0xFFF6FFF0),
  ];

  Map<DateTime, String> _dateToSubject = {}; // date -> subject
  Map<String, List<DateTime>> _subjectToDates = {}; // subject -> dates
  List<String> _subjects = [];
  DateTime _focusedMonth = DateTime.now();
  DateTime? _selectedDate;
  bool _hasData = false;
  final ScrollController _chipsController = ScrollController();

  @override
  void initState() {
    super.initState();
    _parseMonthlyData();
  }

  @override
  void didUpdateWidget(covariant Monthlyexamcalendar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.monthlyexamdata != widget.monthlyexamdata) {
      _parseMonthlyData();
    }
  }

  @override
  void dispose() {
    _chipsController.dispose();
    super.dispose();
  }

  void _parseMonthlyData() {
    _dateToSubject = {};
    _subjectToDates = {};
    _subjects = [];
    _hasData = false;
    _selectedDate = null;

    final raw = widget.monthlyexamdata;
    Map<String, dynamic>? root;

    if (raw == null) {
      setState(() {
        _focusedMonth = DateTime(DateTime.now().year, DateTime.now().month, 1);
        _hasData = false;
      });
      return;
    }

    try {
      if (raw is String) {
        final decoded = jsonDecode(raw);
        if (decoded is Map<String, dynamic>) {
          root = decoded;
        }
      } else if (raw is Map<String, dynamic>) {
        root = raw;
      } else if (raw is Map) {
        root = Map<String, dynamic>.from(raw);
      }
    } catch (e) {
      root = null;
    }

    final sched = root != null
        ? (root['monthlyExamsSchedule'] ??
            root['monthlyexamsSchedule'] ??
            root['monthly_exams_schedule'])
        : null;

    if (sched == null || sched is! Map) {
      setState(() {
        _focusedMonth = DateTime(DateTime.now().year, DateTime.now().month, 1);
        _hasData = false;
      });
      return;
    }

    final tmp = <DateTime, String>{};

    for (final monthKey in sched.keys) {
      final monthMap = sched[monthKey];
      if (monthMap is Map) {
        for (final subjKey in monthMap.keys) {
          final dateVal = monthMap[subjKey];
          if (dateVal is String) {
            try {
              final dt = DateTime.parse(dateVal);
              final dateOnly = DateTime(dt.year, dt.month, dt.day);
              tmp[dateOnly] = subjKey.toString();
            } catch (e) {
              // ignore invalid formats
            }
          }
        }
      }
    }

    if (tmp.isEmpty) {
      setState(() {
        _focusedMonth = DateTime(DateTime.now().year, DateTime.now().month, 1);
        _hasData = false;
      });
      return;
    }

    final sorted =
        SplayTreeMap<DateTime, String>.from(tmp, (a, b) => a.compareTo(b));
    _dateToSubject = Map<DateTime, String>.from(sorted);

    // build subject->dates and unique subjects list (ordered by earliest occurrence)
    final subjMap = <String, List<DateTime>>{};
    final orderedSubjects = <String>[];
    for (final entry in _dateToSubject.entries) {
      final date = entry.key;
      final subj = entry.value;
      final list = subjMap[subj] ?? <DateTime>[];
      list.add(date);
      subjMap[subj] = list;
      if (!orderedSubjects.contains(subj)) orderedSubjects.add(subj);
    }
    _subjectToDates = subjMap;
    _subjects = orderedSubjects;

    // Find first upcoming exam date (>= today)
    final today = DateTime.now();
    final todayOnly = DateTime(today.year, today.month, today.day);
    DateTime? firstUpcoming;
    for (final d in _dateToSubject.keys) {
      final dOnly = DateTime(d.year, d.month, d.day);
      if (!dOnly.isBefore(todayOnly)) {
        firstUpcoming = dOnly;
        break;
      }
    }

    if (firstUpcoming != null) {
      _focusedMonth = DateTime(firstUpcoming.year, firstUpcoming.month, 1);
      _selectedDate = null; // user taps to view details
    } else {
      // all passed -> current month
      _focusedMonth = DateTime(today.year, today.month, 1);
      _selectedDate = null;
    }

    setState(() {
      _hasData = true;
    });
  }

  // calendar helpers
  List<DateTime> _daysInMonth(DateTime month) {
    final nextMonth = DateTime(month.year, month.month + 1, 1);
    final last = nextMonth.subtract(const Duration(days: 1));
    return List.generate(
        last.day, (i) => DateTime(month.year, month.month, i + 1));
  }

  Color _dotColorForSubject(String subject) {
    final idx = _subjects.indexOf(subject);
    return pastelDarkDots[(idx >= 0 ? idx : 0) % pastelDarkDots.length];
  }

  Color _bgColorForSubject(String subject) {
    final idx = _subjects.indexOf(subject);
    return pastelLightBg[(idx >= 0 ? idx : 0) % pastelLightBg.length];
  }

  void _prevMonth() {
    setState(() {
      _focusedMonth = DateTime(_focusedMonth.year, _focusedMonth.month - 1, 1);
      _selectedDate = null;
    });
  }

  void _nextMonth() {
    setState(() {
      _focusedMonth = DateTime(_focusedMonth.year, _focusedMonth.month + 1, 1);
      _selectedDate = null;
    });
  }

  // when user taps a calendar date
  void _onDateTap(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  Widget _buildSubjectsRow(double maxWidth) {
    if (!_hasData || _subjects.isEmpty) {
      return Container(
        height: 56,
        alignment: Alignment.centerLeft,
        child: const Text('No exams available',
            style: TextStyle(color: Colors.black54)),
      );
    }

    return SizedBox(
      height: 66,
      child: Stack(
        children: [
          ListView.separated(
            controller: _chipsController,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            itemCount: _subjects.length,
            itemBuilder: (context, i) {
              final subj = _subjects[i];
              final bg = _bgColorForSubject(subj);
              final date = _subjectToDates[subj] != null &&
                      _subjectToDates[subj]!.isNotEmpty
                  ? _subjectToDates[subj]!.first
                  : null;
              final isSelected = _selectedDate != null &&
                  date != null &&
                  _selectedDate == date;
              return GestureDetector(
                onTap: () {
                  if (date != null) {
                    setState(() {
                      _focusedMonth = DateTime(date.year, date.month, 1);
                      _selectedDate =
                          date; // show details immediately for that date
                    });
                    final double target = (i * 140).toDouble();
                    if (_chipsController.hasClients) {
                      _chipsController.animateTo(
                        target.clamp(
                            0, _chipsController.position.maxScrollExtent),
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  }
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  decoration: BoxDecoration(
                    color: bg,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2))
                    ],
                    border: isSelected
                        ? Border.all(width: 2, color: Colors.black12)
                        : null,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 140),
                        child: Text(subj,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                            overflow: TextOverflow.ellipsis),
                      ),
                      // const SizedBox(width: 8),
                      // if (date != null)
                      //   Text(DateFormat('d MMM').format(date),
                      //       style: const TextStyle(
                      //           fontSize: 12, color: Colors.black54))
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(width: 8),
          ),
          // left fade
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: IgnorePointer(
              child: Container(
                width: 18,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Theme.of(context).scaffoldBackgroundColor,
                      Theme.of(context).scaffoldBackgroundColor.withOpacity(0.0)
                    ],
                  ),
                ),
              ),
            ),
          ),
          // right fade
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: IgnorePointer(
              child: Container(
                width: 18,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      Theme.of(context).scaffoldBackgroundColor,
                      Theme.of(context).scaffoldBackgroundColor.withOpacity(0.0)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Build the popup widget shown in top-right when a date with exam is selected.
  Widget _buildPopupDetail(double parentWidth) {
    if (_selectedDate == null) return const SizedBox.shrink();
    final subj = _dateToSubject[_selectedDate!];
    if (subj == null) return const SizedBox.shrink();

    final bg = _bgColorForSubject(subj);
    final dot = _dotColorForSubject(subj);

    // future dates for this subject (>= today)
    final today = DateTime.now();
    final todayOnly = DateTime(today.year, today.month, today.day);
    final subjDates = _subjectToDates[subj] ?? <DateTime>[];
    final futureDates = subjDates.where((d) {
      final dOnly = DateTime(d.year, d.month, d.day);
      return !dOnly.isBefore(todayOnly);
    }).toList()
      ..sort((a, b) => a.compareTo(b));

    // determine popup width (clamp to available)
    final double popupWidth =
        (parentWidth * 0.45).clamp(260.0, parentWidth * 0.72);

    return Material(
      // Material so elevation/shadows work
      color: Colors.transparent,
      child: Container(
        width: popupWidth,
        constraints: const BoxConstraints(maxHeight: 360),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black12),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 12,
                offset: const Offset(0, 6)),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // top row: small dot + subject + spacer + close icon
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(color: dot, shape: BoxShape.circle),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(subj,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.black87)),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedDate = null;
                    });
                  },
                  child: const Icon(Icons.close_rounded, color: Colors.black87),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // selected date display
            Text(
              DateFormat('EEEE, d MMM yyyy').format(_selectedDate!),
              style: const TextStyle(fontSize: 13, color: Colors.black87),
            ),
            const SizedBox(height: 12),
            const Divider(color: Colors.black26),
            const SizedBox(height: 8),
            Text('Future exams for $subj',
                style: const TextStyle(
                    fontWeight: FontWeight.w700, color: Colors.black87)),
            const SizedBox(height: 8),
            if (futureDates.isEmpty)
              Text('No upcoming exams',
                  style: const TextStyle(color: Colors.black87))
            else
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: futureDates.map((d) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Text(DateFormat('d MMM').format(d),
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600)),
                  );
                }).toList(),
              ),
            const SizedBox(height: 8),
            Text('Total future: ${futureDates.length}',
                style: const TextStyle(color: Colors.black87, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarHeader() {
    final display = DateFormat.yMMMM().format(_focusedMonth);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: _prevMonth, icon: const Icon(Icons.chevron_left)),
        Text(display,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
        IconButton(
            onPressed: _nextMonth, icon: const Icon(Icons.chevron_right)),
      ],
    );
  }

  Widget _buildWeekdayLabels() {
    final labels = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return Row(
      children: labels
          .map((l) => Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text(l,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Colors.black54)),
                ),
              ))
          .toList(),
    );
  }

  Widget _buildCalendarGrid() {
    final days = _daysInMonth(_focusedMonth);
    final firstWeekday =
        DateTime(_focusedMonth.year, _focusedMonth.month, 1).weekday %
            7; // Sun=0..Sat=6
    final totalCells = firstWeekday + days.length;
    final rows = ((totalCells) / 7).ceil();

    List<Widget> rowWidgets = [];
    int dayIndex = 0;
    for (int r = 0; r < rows; r++) {
      List<Widget> dayCells = [];
      for (int c = 0; c < 7; c++) {
        final cellPos = r * 7 + c;
        if (cellPos < firstWeekday || dayIndex >= days.length) {
          dayCells.add(const Expanded(child: SizedBox(height: 64)));
        } else {
          final day = days[dayIndex];
          dayIndex++;
          final dateOnly = DateTime(day.year, day.month, day.day);
          final hasExam = _dateToSubject.containsKey(dateOnly);
          final examSubj = hasExam ? _dateToSubject[dateOnly] : null;
          final isSelected = _selectedDate != null && _selectedDate == dateOnly;

          Widget dayTile = Container(
            margin: const EdgeInsets.all(4),
            height: 64,
            decoration: BoxDecoration(
                color: isSelected ? Colors.black12 : Colors.transparent,
                borderRadius: BorderRadius.circular(8)),
            child: InkWell(
              onTap: () {
                _onDateTap(dateOnly);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.topRight,
                        child: Text('${day.day}',
                            style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54))),
                    const Spacer(),
                    if (hasExam && examSubj != null)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: _dotColorForSubject(examSubj), // darker dot
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.12),
                                  blurRadius: 4)
                            ],
                          ),
                        ),
                      )
                    else
                      const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          );

          dayCells.add(Expanded(child: dayTile));
        }
      }
      rowWidgets.add(Row(children: dayCells));
    }

    return Column(children: rowWidgets);
  }

  @override
  Widget build(BuildContext context) {
    final parentWidth = widget.width ?? MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          width: widget.width ?? double.infinity,
          height: widget.height ?? 520,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12, blurRadius: 12, offset: Offset(0, 4))
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Monthly Exams',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w800)),
              const SizedBox(height: 6),
              Text('Tap a date to view selected exam + future dates',
                  style: const TextStyle(fontSize: 12, color: Colors.black54)),
              const SizedBox(height: 10),
              _buildSubjectsRow(parentWidth),
              const SizedBox(height: 8),
              _buildCalendarHeader(),
              _buildWeekdayLabels(),
              const SizedBox(height: 8),
              Expanded(
                  child: SingleChildScrollView(child: _buildCalendarGrid())),
            ],
          ),
        ),

        // Popup positioned in top-right inside the widget container.
        if (_selectedDate != null && _dateToSubject.containsKey(_selectedDate!))
          Positioned(
            top: 12,
            right: 12,
            child: _buildPopupDetail(parentWidth),
          ),
      ],
    );
  }
}
