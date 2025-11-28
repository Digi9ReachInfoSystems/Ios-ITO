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

import 'package:widget_zoom/widget_zoom.dart';

class Testwiget extends StatefulWidget {
  const Testwiget({
    super.key,
    this.width,
    this.height,
    required this.questions,
    required this.questionimage,
    required this.answer1,
    required this.answer2,
    required this.answer3,
    required this.answer4,
    required this.questionid,
    required this.answerimage1,
    required this.answerimage2,
    required this.answerimage3,
    required this.answerimage4,
  });

  final double? width;
  final double? height;
  final List<String> questions;
  final List<String> questionimage;
  final List<String> answer1;
  final List<String> answer2;
  final List<String> answer3;
  final List<String> answer4;
  final List<String> questionid;
  final List<String> answerimage1;
  final List<String> answerimage2;
  final List<String> answerimage3;
  final List<String> answerimage4;

  @override
  State<Testwiget> createState() => _TestwigetState();
}

class _TestwigetState extends State<Testwiget> {
  late final DateTime _startTime;
  int _selectedOption = -1;
  final PageController _pageController = PageController(initialPage: 0);
  final ScrollController _indicatorScrollController = ScrollController();
  int _currentPage = 0;
  Map<int, int> _answers = {};

  void submitTest() {
    _handleSubmit();
  }

  @override
  void initState() {
    super.initState();
    _startTime = DateTime.now();
    _pageController.addListener(_scrollIndicatorToCenter);
  }

  @override
  void dispose() {
    _pageController.removeListener(_scrollIndicatorToCenter);
    _pageController.dispose();
    _indicatorScrollController.dispose();
    super.dispose();
  }

  void _scrollIndicatorToCenter() {
    final double itemWidth = 50.0; // assuming each indicator has a width of 50
    final double listViewWidth =
        widget.width ?? MediaQuery.of(context).size.width;
    final double centerPosition = (listViewWidth / 2) - (itemWidth / 2);
    final double scrollPosition = (itemWidth * _currentPage) - centerPosition;

    if (_indicatorScrollController.hasClients) {
      _indicatorScrollController.animateTo(
        scrollPosition,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  // Handles when the "Submit" button is pressed
  Future<void> _handleSubmit() async {
    // Calculate total time taken
    final Duration totalTime = DateTime.now().difference(_startTime);
    final String formattedTime = _formatDuration(totalTime);

    // Count attempted questions
    final int totalAttempted = _answers.length;
    final int totalQuestions = widget.questions.length;

    // Construct the updated answers list
    List<AnswersStruct> updatedAnswers = _answers.entries.map((entry) {
      int questionIndex = entry.key;
      int selectedOption = entry.value + 1;
      return AnswersStruct(
        question: widget.questionid[questionIndex],
        answer: selectedOption.toString(),
      );
    }).toList();

    // Show confirm dialog before submitting
    bool confirmSubmit = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Confirm Submission"),
              content: Text("Are you sure you want to submit your answers?"),
              actions: <Widget>[
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                TextButton(
                  child: Text('Confirm'),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            );
          },
        ) ??
        false;

    // Proceed with submission if confirmed
    if (confirmSubmit) {
      FFAppState().update(() {
        FFAppState().answers = updatedAnswers;
        FFAppState().timetaken = formattedTime;
        FFAppState().attemptedquestions = totalAttempted.toString();
      });

      // Navigate to the after-submit screen
      context.pushReplacementNamed('aftersubmit');
    }
  }

  List<int> _visibleIndicatorRange(
      int currentIndex, int totalCount, int range) {
    int start = currentIndex - range;
    int end = currentIndex + range;

    start = start < 0 ? 0 : start;
    end = end > totalCount - 1 ? totalCount - 1 : end;

    return List.generate(end - start + 1, (index) => start + index);
  }

  @override
  Widget build(BuildContext context) {
    final int visibleRange = 2;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 50, // Indicator container height
            width: widget
                .width, // Make sure this width is set, or it spans the screen width
            child: ListView.builder(
              controller: _indicatorScrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.questions.length,
              itemBuilder: (context, indicatorIndex) {
                return _questionIndicator(indicatorIndex);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage > 0)
                  _navigationButton(
                    context,
                    "Back",
                    () {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    ElevatedButton.styleFrom(
                      foregroundColor: Color(0xFF004696),
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Color(0xFF004696), width: 1),
                    ),
                  ),
                _navigationButton(
                  context,
                  _currentPage == widget.questions.length - 1
                      ? "Submit"
                      : "Next",
                  () async {
                    if (_currentPage == widget.questions.length - 1) {
                      await _handleSubmit();
                    } else {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  _currentPage == widget.questions.length - 1
                      ? ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green,
                          side: BorderSide(color: Color(0xFF004696), width: 1),
                        )
                      : ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xFF004696),
                        ),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.questions.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
                _scrollIndicatorToCenter();
              },
              itemBuilder: (context, index) {
                var options = [
                  widget.answer1[index],
                  widget.answer2[index],
                  widget.answer3[index],
                  widget.answer4[index],
                ];

                var images = [
                  widget.answerimage1[index],
                  widget.answerimage2[index],
                  widget.answerimage3[index],
                  widget.answerimage4[index],
                ];

                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    // Add a SingleChildScrollView here
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Question ${index + 1}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        _buildQuestionContent(widget.questions[index]),
                        _buildQuestionContent1(widget.questionimage[index]),
                        Column(
                          children: List<Widget>.generate(options.length,
                              (optionIndex) {
                            return Container(
                              height: 60,
                              child: ListTile(
                                title: _buildOptionContent(
                                  options[optionIndex],
                                  images[optionIndex],
                                ),
                                leading: Radio(
                                  value: optionIndex,
                                  groupValue: _answers[index],
                                  onChanged: (int? value) {
                                    setState(() {
                                      _answers[index] = value!;
                                    });
                                  },
                                ),
                              ),
                            );
                          }),
                        ),
                        SizedBox(height: 20),
                        questionStatusIndicator(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionContent(String text, String imageUrl) {
    if (imageUrl.startsWith('https:')) {
      return WidgetZoom(
          heroAnimationTag: "Option",
          zoomWidget: Image.network(
            imageUrl,
            width: 150,
            height: 150,
          ));
    } else {
      return Text(
        text,
        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
      );
    }
  }

  Widget _buildQuestionContent(String question) {
    if (question.startsWith('https:')) {
      return WidgetZoom(
          heroAnimationTag: "Option",
          zoomWidget: Image.network(
            question,
            width: 150,
            height: 150,
          ));
    } else {
      return Text(
        question,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      );
    }
  }

  Widget _buildQuestionContent1(String imageUrl) {
    if (imageUrl != null && imageUrl.startsWith('https:')) {
      return WidgetZoom(
          heroAnimationTag: "Option",
          zoomWidget: Image.network(
            imageUrl,
            width: 150,
            height: 150,
          ));
    } else {
      return SizedBox.shrink();
    }
  }

  Widget _navigationButton(BuildContext context, String text,
      VoidCallback onPressed, ButtonStyle style) {
    return SizedBox(
      width: 150,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
        style: style,
      ),
    );
  }

  Widget questionStatusIndicator() {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(radius: 10, backgroundColor: Colors.green),
            SizedBox(width: 10),
            Text("Answered Questions"),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            CircleAvatar(radius: 10, backgroundColor: Colors.grey),
            SizedBox(width: 10),
            Text("Unanswered Questions"),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            CircleAvatar(radius: 10, backgroundColor: Color(0xFF004696)),
            SizedBox(width: 10),
            Text("Active Questions"),
          ],
        ),
      ],
    );
  }

  Widget _questionIndicator(int index) {
    Color color;
    if (index == _currentPage) {
      color = Color(0xFF004696);
    } else if (_answers.containsKey(index)) {
      color = Colors.green;
    } else {
      color = Colors.grey;
    }

    return GestureDetector(
      onTap: () => _pageController.jumpToPage(index),
      child: Container(
        width: 50,
        height: 28.0,
        alignment: Alignment.center,
        margin: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          '${index + 1}',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}
