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

final GlobalKey<_TestWidgetNewState> testWidgetKey = GlobalKey();

class TestWidgetNew extends StatefulWidget {
  const TestWidgetNew({
    Key? key,
    this.width,
    this.height,
    // Section 1 parameters
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

    // Section 2 parameters (Optional)
    this.questions2,
    this.question2image,
    this.sectionbanswer1,
    this.sectionbanswer2,
    this.sectionbanswer3,
    this.sectionbanswer4,
    this.question2Id,
    this.sectionbanswerimage1,
    this.sectionbanswerimage2,
    this.sectionbanswerimage3,
    this.sectionbanswerimage4,

    // Section 3 parameters (Optional)
    this.question3Id,
    this.questions3,
    this.questionimage3,
    this.sectionCanswer1,
    this.sectionCanswer2,
    this.sectionCanswer3,
    this.sectionCanswer4,
    this.sectionCanswerimage1,
    this.sectionCanswerimage2,
    this.sectionCanswerimage3,
    this.sectionCanswerimage4,

    // testformat
    this.testformat1,
    this.testformat2,
    this.testformat3,
    required this.submit, // Submit function
  }) : super(key: key);

  final double? width;
  final double? height;

  // Section 1 parameters
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

  // Section 2 parameters (Optional)
  final List<String>? questions2;
  final List<String>? question2image;
  final List<String>? sectionbanswer1;
  final List<String>? sectionbanswer2;
  final List<String>? sectionbanswer3;
  final List<String>? sectionbanswer4;
  final List<String>? question2Id;
  final List<String>? sectionbanswerimage1;
  final List<String>? sectionbanswerimage2;
  final List<String>? sectionbanswerimage3;
  final List<String>? sectionbanswerimage4;

  // Section 3 parameters (Optional)
  final List<String>? question3Id;
  final List<String>? questions3;
  final List<String>? questionimage3;
  final List<String>? sectionCanswer1;
  final List<String>? sectionCanswer2;
  final List<String>? sectionCanswer3;
  final List<String>? sectionCanswer4;
  final List<String>? sectionCanswerimage1;
  final List<String>? sectionCanswerimage2;
  final List<String>? sectionCanswerimage3;
  final List<String>? sectionCanswerimage4;

// testformat/
  final String? testformat1;
  final String? testformat2;
  final String? testformat3;

  final Future<dynamic> Function() submit;

  @override
  _TestWidgetNewState createState() => _TestWidgetNewState();
}

class QuestionAnswer {
  final int? selectedOptionIndex;
  bool isSkipped;

  QuestionAnswer({this.selectedOptionIndex, this.isSkipped = false});
}

class _TestWidgetNewState extends State<TestWidgetNew>
    with SingleTickerProviderStateMixin {
  late final DateTime _startTime;

  // List to hold current page index for each section
  late List<int> _currentPages;

  // List to hold PageControllers for each section
  late List<PageController> _pageControllers;

  // List to hold ScrollControllers for indicators
  late List<ScrollController> _indicatorScrollControllers;

  // List to hold user answers for each section
  late List<Map<int, QuestionAnswer>> _sectionAnswers;

  late TabController _tabController;

  void submitTest() {
    _handleSubmit();
  }

  List<String> _adjustListLength(List<String> list, int desiredLength) {
    if (list.length < desiredLength) {
      return List<String>.from(list)
        ..addAll(List<String>.filled(desiredLength - list.length, ''));
    } else if (list.length > desiredLength) {
      return list.sublist(0, desiredLength);
    } else {
      return list;
    }
  }

  @override
  void initState() {
    super.initState();
    _startTime = DateTime.now();

    // Determine the number of sections
    int sectionCount = 1;
    if (widget.questions2 != null && widget.questions2!.isNotEmpty) {
      sectionCount++;
    }
    if (widget.questions3 != null && widget.questions3!.isNotEmpty) {
      sectionCount++;
    }

    // Initialize lists based on the number of sections
    _currentPages = List<int>.filled(sectionCount, 0);
    _pageControllers = List<PageController>.generate(
        sectionCount, (_) => PageController(initialPage: 0));
    _indicatorScrollControllers = List<ScrollController>.generate(
        sectionCount, (_) => ScrollController());
    _sectionAnswers =
        List<Map<int, QuestionAnswer>>.generate(sectionCount, (_) => {});

    _tabController = TabController(
      length: sectionCount,
      vsync: this,
    );

    _tabController.addListener(() {
      setState(() {}); // Rebuilds the UI when the tab index changes
    });

    // Add listeners for scrolling indicators
    for (int i = 0; i < sectionCount; i++) {
      _pageControllers[i].addListener(() => _scrollIndicatorToCenter(
            _pageControllers[i],
            _indicatorScrollControllers[i],
            _currentPages[i],
          ));
    }
  }

  @override
  void dispose() {
    // Dispose controllers and remove listeners
    for (int i = 0; i < _pageControllers.length; i++) {
      _pageControllers[i].dispose();
      _indicatorScrollControllers[i].dispose();
    }
    _tabController.dispose();
    super.dispose();
  }

  void _scrollIndicatorToCenter(
    PageController controller,
    ScrollController indicatorController,
    int currentPage,
  ) {
    final double itemWidth = 50.0;
    final double listViewWidth =
        widget.width ?? MediaQuery.of(context).size.width;
    final double centerPosition = (listViewWidth / 2) - (itemWidth / 2);

    final double scrollPosition = (itemWidth * currentPage) - centerPosition;

    if (indicatorController.hasClients) {
      final maxScrollExtent = indicatorController.position.maxScrollExtent;
      final clampedScrollPosition = scrollPosition.clamp(0.0, maxScrollExtent);

      indicatorController.animateTo(
        clampedScrollPosition,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _handleSubmit() async {
    final Duration totalTime = DateTime.now().difference(_startTime);
    final String formattedTime = _formatDuration(totalTime);

    // Calculate total attempted (answered) questions
    final int totalAttempted = _sectionAnswers.fold(0, (prev, sectionMap) {
      int count = 0;
      sectionMap.forEach((index, answer) {
        if (!answer.isSkipped && answer.selectedOptionIndex != null) {
          count++;
        }
      });
      return prev + count;
    });

    final int totalQuestions = widget.questions.length +
        (widget.questions2?.length ?? 0) +
        (widget.questions3?.length ?? 0);

    List<AnswersStruct> updatedAnswers = [];

    // Collect answers from each section, excluding skipped questions
    for (int sectionIndex = 0;
        sectionIndex < _sectionAnswers.length;
        sectionIndex++) {
      Map<int, QuestionAnswer> sectionMap = _sectionAnswers[sectionIndex];

      List<String> questionIds;
      if (sectionIndex == 0) {
        questionIds = widget.questionid;
      } else if (sectionIndex == 1) {
        questionIds = widget.question2Id ?? [];
      } else if (sectionIndex == 2) {
        questionIds = widget.question3Id ?? [];
      } else {
        questionIds = [];
      }

      updatedAnswers.addAll(
        sectionMap.entries
            .where((entry) =>
                !entry.value.isSkipped &&
                entry.value.selectedOptionIndex != null)
            .map((entry) {
          int questionIndex = entry.key;
          QuestionAnswer answer = entry.value;
          int selectedOption = answer.selectedOptionIndex! + 1;
          String answerValue = selectedOption.toString();

          String questionId = questionIds.length > questionIndex
              ? questionIds[questionIndex]
              : '';

          return AnswersStruct(
            question: questionId,
            answer: answerValue,
          );
        }),
      );
    }

    bool confirmSubmit = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Confirm Submission"),
              content:
                  const Text("Are you sure you want to submit your answers?"),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                TextButton(
                  child: const Text('Confirm'),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            );
          },
        ) ??
        false;

    if (confirmSubmit) {
      FFAppState().update(() {
        FFAppState().answers = updatedAnswers;
        FFAppState().timetaken = formattedTime;
        FFAppState().attemptedquestions = totalAttempted.toString();
        // Skipped questions are not stored
      });

      context.pushReplacementNamed('aftersubmit');
    }
  }

  Widget _buildCustomTab(String text, bool isSelected) {
    return GestureDetector(
      onTap: () {
        int tabIndex = _getSectionIndex(text);
        setState(() {
          _tabController.animateTo(tabIndex);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Color.fromARGB(255, 201, 11, 11) : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  int _getSectionIndex(String sectionTitle) {
    switch (sectionTitle) {
      case 'Subjective':
        return 0;
      case 'Logical':
        return 1;
      case "HOT's":
        return 2;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> sectionTitles = ['Subjective'];
    if (widget.questions2 != null && widget.questions2!.isNotEmpty) {
      sectionTitles.add('Logical');
    }
    if (widget.questions3 != null && widget.questions3!.isNotEmpty) {
      sectionTitles.add("HOT's");
    }

    // Adjust lists for Section 1
    int questionsLength = widget.questions.length;

    List<String> adjustedQuestionImage =
        _adjustListLength(widget.questionimage, questionsLength);
    List<String> adjustedAnswer1 =
        _adjustListLength(widget.answer1, questionsLength);
    List<String> adjustedAnswer2 =
        _adjustListLength(widget.answer2, questionsLength);
    List<String> adjustedAnswer3 =
        _adjustListLength(widget.answer3, questionsLength);
    List<String> adjustedAnswer4 =
        _adjustListLength(widget.answer4, questionsLength);
    List<String> adjustedAnswerImage1 =
        _adjustListLength(widget.answerimage1, questionsLength);
    List<String> adjustedAnswerImage2 =
        _adjustListLength(widget.answerimage2, questionsLength);
    List<String> adjustedAnswerImage3 =
        _adjustListLength(widget.answerimage3, questionsLength);
    List<String> adjustedAnswerImage4 =
        _adjustListLength(widget.answerimage4, questionsLength);
    List<String> adjustedQuestionId =
        _adjustListLength(widget.questionid, questionsLength);

    // Adjust lists for Section 2
    int? questions2Length = widget.questions2?.length;
    List<String>? adjustedQuestions2 = widget.questions2;
    List<String>? adjustedQuestion2Image;
    List<String>? adjustedSectionBAnswer1;
    List<String>? adjustedSectionBAnswer2;
    List<String>? adjustedSectionBAnswer3;
    List<String>? adjustedSectionBAnswer4;
    List<String>? adjustedSectionBAnswerImage1;
    List<String>? adjustedSectionBAnswerImage2;
    List<String>? adjustedSectionBAnswerImage3;
    List<String>? adjustedSectionBAnswerImage4;
    List<String>? adjustedQuestion2Id;

    if (questions2Length != null) {
      adjustedQuestion2Image =
          _adjustListLength(widget.question2image ?? [], questions2Length);
      adjustedSectionBAnswer1 =
          _adjustListLength(widget.sectionbanswer1 ?? [], questions2Length);
      adjustedSectionBAnswer2 =
          _adjustListLength(widget.sectionbanswer2 ?? [], questions2Length);
      adjustedSectionBAnswer3 =
          _adjustListLength(widget.sectionbanswer3 ?? [], questions2Length);
      adjustedSectionBAnswer4 =
          _adjustListLength(widget.sectionbanswer4 ?? [], questions2Length);
      adjustedSectionBAnswerImage1 = _adjustListLength(
          widget.sectionbanswerimage1 ?? [], questions2Length);
      adjustedSectionBAnswerImage2 = _adjustListLength(
          widget.sectionbanswerimage2 ?? [], questions2Length);
      adjustedSectionBAnswerImage3 = _adjustListLength(
          widget.sectionbanswerimage3 ?? [], questions2Length);
      adjustedSectionBAnswerImage4 = _adjustListLength(
          widget.sectionbanswerimage4 ?? [], questions2Length);
      adjustedQuestion2Id =
          _adjustListLength(widget.question2Id ?? [], questions2Length);
    }

    // Adjust lists for Section 3
    int? questions3Length = widget.questions3?.length;
    List<String>? adjustedQuestions3 = widget.questions3;
    List<String>? adjustedQuestion3Image;
    List<String>? adjustedSectionCAnswer1;
    List<String>? adjustedSectionCAnswer2;
    List<String>? adjustedSectionCAnswer3;
    List<String>? adjustedSectionCAnswer4;
    List<String>? adjustedSectionCAnswerImage1;
    List<String>? adjustedSectionCAnswerImage2;
    List<String>? adjustedSectionCAnswerImage3;
    List<String>? adjustedSectionCAnswerImage4;
    List<String>? adjustedQuestion3Id;

    if (questions3Length != null) {
      adjustedQuestion3Image =
          _adjustListLength(widget.questionimage3 ?? [], questions3Length);
      adjustedSectionCAnswer1 =
          _adjustListLength(widget.sectionCanswer1 ?? [], questions3Length);
      adjustedSectionCAnswer2 =
          _adjustListLength(widget.sectionCanswer2 ?? [], questions3Length);
      adjustedSectionCAnswer3 =
          _adjustListLength(widget.sectionCanswer3 ?? [], questions3Length);
      adjustedSectionCAnswer4 =
          _adjustListLength(widget.sectionCanswer4 ?? [], questions3Length);
      adjustedSectionCAnswerImage1 = _adjustListLength(
          widget.sectionCanswerimage1 ?? [], questions3Length);
      adjustedSectionCAnswerImage2 = _adjustListLength(
          widget.sectionCanswerimage2 ?? [], questions3Length);
      adjustedSectionCAnswerImage3 = _adjustListLength(
          widget.sectionCanswerimage3 ?? [], questions3Length);
      adjustedSectionCAnswerImage4 = _adjustListLength(
          widget.sectionCanswerimage4 ?? [], questions3Length);
      adjustedQuestion3Id =
          _adjustListLength(widget.question3Id ?? [], questions3Length);
    }

    return Scaffold(
      body: Column(
        children: [
          if (sectionTitles.length > 1)
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.transparent,
                labelPadding: EdgeInsets.only(left: 1.0),
                tabs: sectionTitles
                    .map((title) => _buildCustomTab(
                          title,
                          _tabController.index == _getSectionIndex(title),
                        ))
                    .toList(),
              ),
            ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildSection(
                  0,
                  'Subjective',
                  widget.questions,
                  adjustedQuestionImage,
                  adjustedAnswer1,
                  adjustedAnswer2,
                  adjustedAnswer3,
                  adjustedAnswer4,
                  adjustedAnswerImage1,
                  adjustedAnswerImage2,
                  adjustedAnswerImage3,
                  adjustedAnswerImage4,
                  adjustedQuestionId,
                ),
                if (adjustedQuestions2 != null && adjustedQuestions2.isNotEmpty)
                  _buildSection(
                    1,
                    'Logical',
                    adjustedQuestions2,
                    adjustedQuestion2Image!,
                    adjustedSectionBAnswer1!,
                    adjustedSectionBAnswer2!,
                    adjustedSectionBAnswer3!,
                    adjustedSectionBAnswer4!,
                    adjustedSectionBAnswerImage1!,
                    adjustedSectionBAnswerImage2!,
                    adjustedSectionBAnswerImage3!,
                    adjustedSectionBAnswerImage4!,
                    adjustedQuestion2Id!,
                  ),
                if (adjustedQuestions3 != null && adjustedQuestions3.isNotEmpty)
                  _buildSection(
                    2,
                    "HOT's",
                    adjustedQuestions3,
                    adjustedQuestion3Image!,
                    adjustedSectionCAnswer1!,
                    adjustedSectionCAnswer2!,
                    adjustedSectionCAnswer3!,
                    adjustedSectionCAnswer4!,
                    adjustedSectionCAnswerImage1!,
                    adjustedSectionCAnswerImage2!,
                    adjustedSectionCAnswerImage3!,
                    adjustedSectionCAnswerImage4!,
                    adjustedQuestion3Id!,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    int sectionIndex,
    String sectionTitle,
    List<String> questions,
    List<String> questionImages,
    List<String> answers1,
    List<String> answers2,
    List<String> answers3,
    List<String> answers4,
    List<String> answerImages1,
    List<String> answerImages2,
    List<String> answerImages3,
    List<String> answerImages4,
    List<String> questionIds,
  ) {
    final int totalQuestions = questions.length;
    int questionOffset = 0;
    if (sectionIndex == 1) {
      questionOffset = widget.questions.length;
    } else if (sectionIndex == 2) {
      questionOffset =
          widget.questions.length + (widget.questions2?.length ?? 0);
    }
    return Column(
      children: [
        Container(
          height: 50,
          child: ListView.builder(
            controller: _indicatorScrollControllers[sectionIndex],
            scrollDirection: Axis.horizontal,
            itemCount: totalQuestions,
            itemBuilder: (context, indicatorIndex) {
              return _questionIndicator(
                indicatorIndex + 1 + questionOffset,
                _sectionAnswers[sectionIndex],
                _currentPages[sectionIndex],
                _pageControllers[sectionIndex],
                questionOffset,
                _indicatorScrollControllers[sectionIndex],
                sectionIndex,
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: PageView.builder(
            controller: _pageControllers[sectionIndex],
            physics: const NeverScrollableScrollPhysics(),
            itemCount: totalQuestions,
            onPageChanged: (int page) {
              setState(() {
                _currentPages[sectionIndex] = page;
              });
              _scrollIndicatorToCenter(
                _pageControllers[sectionIndex],
                _indicatorScrollControllers[sectionIndex],
                page,
              );
            },
            itemBuilder: (context, index) {
              var options = [
                answers1[index],
                answers2[index],
                answers3[index],
                answers4[index],
              ];

              var images = [
                answerImages1[index],
                answerImages2[index],
                answerImages3[index],
                answerImages4[index],
              ];

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildNavigationButtons(
                        sectionIndex,
                        sectionTitle,
                        index,
                        _pageControllers[sectionIndex],
                        totalQuestions,
                        _indicatorScrollControllers[sectionIndex],
                        questionOffset,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Question ${index + 1 + questionOffset}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildQuestionContent(questions[index]),
                      _buildQuestionContent1(questionImages[index]),
                      Column(
                        children: List<Widget>.generate(options.length,
                            (optionIndex) {
                          return Container(
                            height: 60,
                            child: ListTile(
                              title: _buildOptionContent(
                                  options[optionIndex], images[optionIndex]),
                              leading: Radio(
                                value: optionIndex,
                                groupValue: _sectionAnswers[sectionIndex][index]
                                    ?.selectedOptionIndex,
                                onChanged: (int? value) {
                                  setState(() {
                                    _sectionAnswers[sectionIndex][index] =
                                        QuestionAnswer(
                                            selectedOptionIndex: value,
                                            isSkipped: false);
                                  });
                                },
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 20),
                      questionStatusIndicator(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  bool _isLastQuestion(
      int sectionIndex, String sectionTitle, int index, int totalQuestions) {
    // Determine if it's the last question across all sections
    if (sectionIndex == _sectionAnswers.length - 1 &&
        index == totalQuestions - 1) {
      return true;
    }
    return false;
  }

  Widget _buildNavigationButtons(
    int sectionIndex,
    String sectionTitle,
    int index,
    PageController controller,
    int totalQuestions,
    ScrollController indicatorController,
    int questionOffset,
  ) {
    // Determine the labels for the buttons
    String previousLabel = index == 0 ? '<< Previous Section' : 'Previous';
    String nextLabel;
    bool isLastQuestion =
        _isLastQuestion(sectionIndex, sectionTitle, index, totalQuestions);

    if (isLastQuestion) {
      nextLabel = 'Submit';
    } else if (index == totalQuestions - 1) {
      nextLabel = 'Next Section >>';
    } else {
      nextLabel = 'Next';
    }

    // Build Previous Control
    Widget previousWidget;
    if (index > 0) {
      // "Previous" button
      previousWidget = ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Color(0xFF004696),
          backgroundColor: Colors.white,
          side: BorderSide(color: Color(0xFF004696), width: 1),
        ),
        onPressed: () {
          // Before moving to previous section, check if the current question is unanswered
          if (_sectionAnswers[sectionIndex][index]?.selectedOptionIndex ==
                  null &&
              !(_sectionAnswers[sectionIndex][index]?.isSkipped ?? false)) {
            // Mark it as skipped
            setState(() {
              _sectionAnswers[sectionIndex][index] =
                  QuestionAnswer(isSkipped: true);
            });
          }
          // Move to previous question
          int newPageIndex = index - 1;
          setState(() {
            _currentPages[sectionIndex] = newPageIndex;
          });
          controller.jumpToPage(newPageIndex);
          _scrollIndicatorToCenter(
            controller,
            indicatorController,
            newPageIndex,
          );
        },
        child: Row(
          children: [
            Icon(Icons.chevron_left, color: Color(0xFF004696)),
            SizedBox(width: 4),
            Text('Previous'),
          ],
        ),
      );
    } else if (sectionIndex > 0) {
      previousWidget = Text('<< Previous Section');
    } else {
      previousWidget = SizedBox.shrink();
    }

    // Build Next Control
    Widget nextWidget;
    if (isLastQuestion) {
      nextWidget = ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.green,
        ),
        onPressed: () {
          // Before submitting, check if the current question is unanswered
          if (_sectionAnswers[sectionIndex][index]?.selectedOptionIndex ==
                  null &&
              !(_sectionAnswers[sectionIndex][index]?.isSkipped ?? false)) {
            setState(() {
              _sectionAnswers[sectionIndex][index] =
                  QuestionAnswer(isSkipped: true);
            });
          }
          _handleSubmit(); // Submit action
        },
        child: Row(
          children: [
            Text('Submit'),
            SizedBox(width: 4),
            Icon(Icons.check, color: Colors.white),
          ],
        ),
      );
    } else if (index < totalQuestions - 1) {
      nextWidget = ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Color(0xFF004696),
        ),
        onPressed: () {
          // Check if the current question is unanswered
          if (_sectionAnswers[sectionIndex][index]?.selectedOptionIndex ==
                  null &&
              !(_sectionAnswers[sectionIndex][index]?.isSkipped ?? false)) {
            // Mark it as skipped
            setState(() {
              _sectionAnswers[sectionIndex][index] =
                  QuestionAnswer(isSkipped: true);
            });
          }
          // Move to next question
          int newPageIndex = index + 1;
          setState(() {
            _currentPages[sectionIndex] = newPageIndex;
          });
          controller.jumpToPage(newPageIndex);
          _scrollIndicatorToCenter(
            controller,
            indicatorController,
            newPageIndex,
          );
        },
        child: Row(
          children: [
            Text('Next'),
            SizedBox(width: 4),
            Icon(Icons.chevron_right, color: Colors.white),
          ],
        ),
      );
    } else {
      nextWidget = Text('Next Section >>');
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        previousWidget,
        nextWidget,
      ],
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
        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
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
        style: const TextStyle(
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
      return const SizedBox.shrink();
    }
  }

  Widget _questionIndicator(
    int questionNumber,
    Map<int, QuestionAnswer> sectionAnswers,
    int currentPage,
    PageController controller,
    int questionOffset,
    ScrollController indicatorController,
    int sectionIndex,
  ) {
    Color color;

    int questionIndex = questionNumber - 1 - questionOffset;
    QuestionAnswer? answer = sectionAnswers[questionIndex];

    if (currentPage + 1 + questionOffset == questionNumber) {
      color = const Color(0xFF004696); // Active question color
    } else if (answer != null) {
      if (answer.isSkipped) {
        color = Colors.yellow; // Skipped question color
      } else {
        color = Colors.green; // Answered question color
      }
    } else {
      color = Colors.grey; // Unanswered question color
    }

    return GestureDetector(
      onTap: () {
        int pageToJump = questionNumber - 1 - questionOffset;

        setState(() {
          _currentPages[sectionIndex] = pageToJump;
        });

        controller.jumpToPage(pageToJump);

        _scrollIndicatorToCenter(
          controller,
          indicatorController,
          pageToJump,
        );
      },
      child: Container(
        width: 50,
        height: 28.0,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          '$questionNumber',
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget questionStatusIndicator() {
    return Column(
      children: const [
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
            CircleAvatar(radius: 10, backgroundColor: Colors.yellow),
            SizedBox(width: 10),
            Text("Skipped Questions"),
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

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}
