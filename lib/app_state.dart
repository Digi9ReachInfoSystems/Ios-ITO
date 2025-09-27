import 'package:flutter/material.dart';
import 'package:indian_talent_olympiad/backend/schema/structs/powercart_struct.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'backend/schema/structs/coupon_struct.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_userInfo')) {
        try {
          final serializedData = prefs.getString('ff_userInfo') ?? '{}';
          _userInfo =
              StudentStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _otp1 = prefs.getString('ff_otp1') ?? _otp1;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_subs')) {
        try {
          final serializedData = prefs.getString('ff_subs') ?? '{}';
          _subs = SubscriptionsStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_subjects')) {
        try {
          final serializedData = prefs.getString('ff_subjects') ?? '{}';
          _subjects =
              SubjectsStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_questions')) {
        try {
          final serializedData = prefs.getString('ff_questions') ?? '{}';
          _questions =
              QuestionsStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _allservices = prefs
              .getStringList('ff_allservices')
              ?.map((x) {
                try {
                  return ServicesStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _allservices;
    });
    _safeInit(() {
      _answers = prefs
              .getStringList('ff_answers')
              ?.map((x) {
                try {
                  return AnswersStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _answers;
    });
    _safeInit(() {
      _testAll = prefs
              .getStringList('ff_testAll')
              ?.map((x) {
                try {
                  return TestsStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _testAll;
    });
    _safeInit(() {
      _imageslist = prefs.getStringList('ff_imageslist') ?? _imageslist;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_addValue')) {
        try {
          final serializedData = prefs.getString('ff_addValue') ?? '{}';
          _addValue = AmountProductsStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _productSub = prefs.getInt('ff_productSub') ?? _productSub;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_timeline')) {
        try {
          final serializedData = prefs.getString('ff_timeline') ?? '{}';
          _timeline = TimelinedocumentStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _isChecked = prefs.getBool('ff_isChecked') ?? _isChecked;
    });
    _safeInit(() {
      _slot2annual = prefs
              .getStringList('ff_slot2annual')
              ?.map((x) {
                try {
                  return TimelinedocumentStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _slot2annual;
    });
    _safeInit(() {
      _totalcart = prefs
              .getStringList('ff_totalcart')
              ?.map((x) {
                try {
                  return CartitemsStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _totalcart;
    });
    _safeInit(() {
      _productids = prefs.getStringList('ff_productids') ?? _productids;
    });
    _safeInit(() {
      _finalamount = prefs.getDouble('ff_finalamount') ?? _finalamount;
    });
    _safeInit(() {
      _starttime = prefs.containsKey('ff_starttime')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_starttime')!)
          : _starttime;
    });
    _safeInit(() {
      _totalcombocart = prefs
              .getStringList('ff_totalcombocart')
              ?.map((x) {
                try {
                  return Round2cartStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _totalcombocart;
    });
    _safeInit(() {
      _comboid = prefs.getStringList('ff_comboid') ?? _comboid;
    });
    _safeInit(() {
      _combofinalamount =
          prefs.getDouble('ff_combofinalamount') ?? _combofinalamount;
    });
    _safeInit(() {
      _certificateId =
          prefs.getStringList('ff_certificateId') ?? _certificateId;
    });
    _safeInit(() {
      _showResult = prefs.getInt('ff_showResult') ?? _showResult;
    });
    _safeInit(() {
      _dosAnddont = prefs.getString('ff_dosAnddont') ?? _dosAnddont;
    });
    _safeInit(() {
      _applied = prefs.getStringList('ff_applied') ?? _applied;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_couponscode')) {
        try {
          final serializedData = prefs.getString('ff_couponscode') ?? '{}';
          _couponscode =
              CouponStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _noofselected = prefs.getStringList('ff_noofselected') ?? _noofselected;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  StudentStruct _userInfo = StudentStruct.fromSerializableMap(jsonDecode(
      '{\"student_name\":\"sharan\",\"user_Id\":\"23423\",\"mobileNo\":\"7249435774\",\"password\":\"pass@123\",\"allowedServices\":\"[]\",\"parentName\":\"Parent Name\",\"parentEmail\":\"parent@gmail.com\",\"address\":\"Bangalore\",\"district\":\"Bangalore\",\"state\":\"Karnataka\",\"city\":\"Bangalore\",\"pincode\":\"560055\",\"school_name\":\"Carmel\",\"school_state\":\"Karnataka\",\"school_address\":\"Karnataka\",\"school_city\":\"Bangalore\",\"school_pincode\":\"560055\",\"std_id\":\"1\",\"old_id\":\"1\",\"updated_id\":\"1\",\"username\":\"1\"}'));
  StudentStruct get userInfo => _userInfo;
  set userInfo(StudentStruct value) {
    _userInfo = value;
    prefs.setString('ff_userInfo', value.serialize());
  }

  void updateUserInfoStruct(Function(StudentStruct) updateFn) {
    updateFn(_userInfo);
    prefs.setString('ff_userInfo', _userInfo.serialize());
  }

  String _userDetails = '';
  String get userDetails => _userDetails;
  set userDetails(String value) {
    _userDetails = value;
  }

  int _otp = 0;
  int get otp => _otp;
  set otp(int value) {
    _otp = value;
  }

  String _otp1 = '';
  String get otp1 => _otp1;
  set otp1(String value) {
    _otp1 = value;
    prefs.setString('ff_otp1', value);
  }
String _appcheck = '';
  String get appcheck => _appcheck;
  set appcheck(String value) {
    _appcheck = value;
  }
  SubscriptionsStruct _subs =
      SubscriptionsStruct.fromSerializableMap(jsonDecode('{}'));
  SubscriptionsStruct get subs => _subs;
  set subs(SubscriptionsStruct value) {
    _subs = value;
    prefs.setString('ff_subs', value.serialize());
  }

  void updateSubsStruct(Function(SubscriptionsStruct) updateFn) {
    updateFn(_subs);
    prefs.setString('ff_subs', _subs.serialize());
  }

  SubjectsStruct _subjects = SubjectsStruct.fromSerializableMap(jsonDecode(
      '{\"std\":\"[]\",\"subjectTitle\":\"[]\",\"subjectname\":\"[]\",\"subjectIcon\":\"[]\"}'));
  SubjectsStruct get subjects => _subjects;
  set subjects(SubjectsStruct value) {
    _subjects = value;
    prefs.setString('ff_subjects', value.serialize());
  }

  void updateSubjectsStruct(Function(SubjectsStruct) updateFn) {
    updateFn(_subjects);
    prefs.setString('ff_subjects', _subjects.serialize());
  }

  QuestionsStruct _questions = QuestionsStruct();
  QuestionsStruct get questions => _questions;
  set questions(QuestionsStruct value) {
    _questions = value;
    prefs.setString('ff_questions', value.serialize());
  }

  void updateQuestionsStruct(Function(QuestionsStruct) updateFn) {
    updateFn(_questions);
    prefs.setString('ff_questions', _questions.serialize());
  }

  List<ServicesStruct> _allservices = [
    ServicesStruct.fromSerializableMap(jsonDecode(
        '{\"service_id\":\"1\",\"service_name\":\"Hello World\",\"service_slug\":\"Hello World\",\"service_type\":\"test\"}'))
  ];
  List<ServicesStruct> get allservices => _allservices;
  set allservices(List<ServicesStruct> value) {
    _allservices = value;
    prefs.setStringList(
        'ff_allservices', value.map((x) => x.serialize()).toList());
  }

  void addToAllservices(ServicesStruct value) {
    _allservices.add(value);
    prefs.setStringList(
        'ff_allservices', _allservices.map((x) => x.serialize()).toList());
  }

  void removeFromAllservices(ServicesStruct value) {
    _allservices.remove(value);
    prefs.setStringList(
        'ff_allservices', _allservices.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromAllservices(int index) {
    _allservices.removeAt(index);
    prefs.setStringList(
        'ff_allservices', _allservices.map((x) => x.serialize()).toList());
  }

  void updateAllservicesAtIndex(
    int index,
    ServicesStruct Function(ServicesStruct) updateFn,
  ) {
    _allservices[index] = updateFn(_allservices[index]);
    prefs.setStringList(
        'ff_allservices', _allservices.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInAllservices(int index, ServicesStruct value) {
    _allservices.insert(index, value);
    prefs.setStringList(
        'ff_allservices', _allservices.map((x) => x.serialize()).toList());
  }

  List<AnswersStruct> _answers = [];
  List<AnswersStruct> get answers => _answers;
  set answers(List<AnswersStruct> value) {
    _answers = value;
    prefs.setStringList(
        'ff_answers', value.map((x) => x.serialize()).toList());
  }

  void addToAnswers(AnswersStruct value) {
    _answers.add(value);
    prefs.setStringList(
        'ff_answers', _answers.map((x) => x.serialize()).toList());
  }

  void removeFromAnswers(AnswersStruct value) {
    _answers.remove(value);
    prefs.setStringList(
        'ff_answers', _answers.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromAnswers(int index) {
    _answers.removeAt(index);
    prefs.setStringList(
        'ff_answers', _answers.map((x) => x.serialize()).toList());
  }

  void updateAnswersAtIndex(
    int index,
    AnswersStruct Function(AnswersStruct) updateFn,
  ) {
    _answers[index] = updateFn(_answers[index]);
    prefs.setStringList(
        'ff_answers', _answers.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInAnswers(int index, AnswersStruct value) {
    _answers.insert(index, value);
    prefs.setStringList(
        'ff_answers', _answers.map((x) => x.serialize()).toList());
  }

  List<TestsStruct> _testAll = [];
  List<TestsStruct> get testAll => _testAll;
  set testAll(List<TestsStruct> value) {
    _testAll = value;
    prefs.setStringList(
        'ff_testAll', value.map((x) => x.serialize()).toList());
  }

  void addToTestAll(TestsStruct value) {
    _testAll.add(value);
    prefs.setStringList(
        'ff_testAll', _testAll.map((x) => x.serialize()).toList());
  }

  void removeFromTestAll(TestsStruct value) {
    _testAll.remove(value);
    prefs.setStringList(
        'ff_testAll', _testAll.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTestAll(int index) {
    _testAll.removeAt(index);
    prefs.setStringList(
        'ff_testAll', _testAll.map((x) => x.serialize()).toList());
  }

  void updateTestAllAtIndex(
    int index,
    TestsStruct Function(TestsStruct) updateFn,
  ) {
    _testAll[index] = updateFn(_testAll[index]);
    prefs.setStringList(
        'ff_testAll', _testAll.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTestAll(int index, TestsStruct value) {
    _testAll.insert(index, value);
    prefs.setStringList(
        'ff_testAll', _testAll.map((x) => x.serialize()).toList());
  }

  String _timetaken = '';
  String get timetaken => _timetaken;
  set timetaken(String value) {
    _timetaken = value;
  }

  String _attemptedquestions = '';
  String get attemptedquestions => _attemptedquestions;
  set attemptedquestions(String value) {
    _attemptedquestions = value;
  }

  String _testid = '';
  String get testid => _testid;
  set testid(String value) {
    _testid = value;
  }

  PiechartvaluesStruct _piechartvalues = PiechartvaluesStruct();
  PiechartvaluesStruct get piechartvalues => _piechartvalues;
  set piechartvalues(PiechartvaluesStruct value) {
    _piechartvalues = value;
  }

  void updatePiechartvaluesStruct(Function(PiechartvaluesStruct) updateFn) {
    updateFn(_piechartvalues);
  }

  String _totaltime = '';
  String get totaltime => _totaltime;
  set totaltime(String value) {
    _totaltime = value;
  }

  List<String> _imageslist = [];
  List<String> get imageslist => _imageslist;
  set imageslist(List<String> value) {
    _imageslist = value;
    prefs.setStringList('ff_imageslist', value);
  }

  void addToImageslist(String value) {
    _imageslist.add(value);
    prefs.setStringList('ff_imageslist', _imageslist);
  }

  void removeFromImageslist(String value) {
    _imageslist.remove(value);
    prefs.setStringList('ff_imageslist', _imageslist);
  }

  void removeAtIndexFromImageslist(int index) {
    _imageslist.removeAt(index);
    prefs.setStringList('ff_imageslist', _imageslist);
  }

  void updateImageslistAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _imageslist[index] = updateFn(_imageslist[index]);
    prefs.setStringList('ff_imageslist', _imageslist);
  }

  void insertAtIndexInImageslist(int index, String value) {
    _imageslist.insert(index, value);
    prefs.setStringList('ff_imageslist', _imageslist);
  }

  AmountProductsStruct _addValue = AmountProductsStruct();
  AmountProductsStruct get addValue => _addValue;
  set addValue(AmountProductsStruct value) {
    _addValue = value;
    prefs.setString('ff_addValue', value.serialize());
  }

  void updateAddValueStruct(Function(AmountProductsStruct) updateFn) {
    updateFn(_addValue);
    prefs.setString('ff_addValue', _addValue.serialize());
  }

  int _productSub = 0;
  int get productSub => _productSub;
  set productSub(int value) {
    _productSub = value;
    prefs.setInt('ff_productSub', value);
  }

  TimelinedocumentStruct _timeline = TimelinedocumentStruct();
  TimelinedocumentStruct get timeline => _timeline;
  set timeline(TimelinedocumentStruct value) {
    _timeline = value;
    prefs.setString('ff_timeline', value.serialize());
  }

  void updateTimelineStruct(Function(TimelinedocumentStruct) updateFn) {
    updateFn(_timeline);
    prefs.setString('ff_timeline', _timeline.serialize());
  }

  bool _isChecked = false;
  bool get isChecked => _isChecked;
  set isChecked(bool value) {
    _isChecked = value;
    prefs.setBool('ff_isChecked', value);
  }

  bool _isupdateAvailable = false;
  bool get isupdateAvailable => _isupdateAvailable;
  set isupdateAvailable(bool value) {
    _isupdateAvailable = value;
    prefs.setBool('ff_isupdateAvailable', value);
  }


  List<TimelinedocumentStruct> _slot1 = [];
  List<TimelinedocumentStruct> get slot1 => _slot1;
  set slot1(List<TimelinedocumentStruct> value) {
    _slot1 = value;
  }

  void addToSlot1(TimelinedocumentStruct value) {
    _slot1.add(value);
  }

  void removeFromSlot1(TimelinedocumentStruct value) {
    _slot1.remove(value);
  }

  void removeAtIndexFromSlot1(int index) {
    _slot1.removeAt(index);
  }

  void updateSlot1AtIndex(
    int index,
    TimelinedocumentStruct Function(TimelinedocumentStruct) updateFn,
  ) {
    _slot1[index] = updateFn(_slot1[index]);
  }

  void insertAtIndexInSlot1(int index, TimelinedocumentStruct value) {
    _slot1.insert(index, value);
  }

  List<TimelinedocumentStruct> _slot1annual = [];
  List<TimelinedocumentStruct> get slot1annual => _slot1annual;
  set slot1annual(List<TimelinedocumentStruct> value) {
    _slot1annual = value;
  }

  void addToSlot1annual(TimelinedocumentStruct value) {
    _slot1annual.add(value);
  }

  void removeFromSlot1annual(TimelinedocumentStruct value) {
    _slot1annual.remove(value);
  }

  void removeAtIndexFromSlot1annual(int index) {
    _slot1annual.removeAt(index);
  }

  void updateSlot1annualAtIndex(
    int index,
    TimelinedocumentStruct Function(TimelinedocumentStruct) updateFn,
  ) {
    _slot1annual[index] = updateFn(_slot1annual[index]);
  }

  void insertAtIndexInSlot1annual(int index, TimelinedocumentStruct value) {
    _slot1annual.insert(index, value);
  }

  List<TimelinedocumentStruct> _slot2annual = [];
  List<TimelinedocumentStruct> get slot2annual => _slot2annual;
  set slot2annual(List<TimelinedocumentStruct> value) {
    _slot2annual = value;
    prefs.setStringList(
        'ff_slot2annual', value.map((x) => x.serialize()).toList());
  }

  void addToSlot2annual(TimelinedocumentStruct value) {
    _slot2annual.add(value);
    prefs.setStringList(
        'ff_slot2annual', _slot2annual.map((x) => x.serialize()).toList());
  }

  void removeFromSlot2annual(TimelinedocumentStruct value) {
    _slot2annual.remove(value);
    prefs.setStringList(
        'ff_slot2annual', _slot2annual.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromSlot2annual(int index) {
    _slot2annual.removeAt(index);
    prefs.setStringList(
        'ff_slot2annual', _slot2annual.map((x) => x.serialize()).toList());
  }

  void updateSlot2annualAtIndex(
    int index,
    TimelinedocumentStruct Function(TimelinedocumentStruct) updateFn,
  ) {
    _slot2annual[index] = updateFn(_slot2annual[index]);
    prefs.setStringList(
        'ff_slot2annual', _slot2annual.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInSlot2annual(int index, TimelinedocumentStruct value) {
    _slot2annual.insert(index, value);
    prefs.setStringList(
        'ff_slot2annual', _slot2annual.map((x) => x.serialize()).toList());
  }

  List<CartitemsStruct> _totalcart = [];
  List<CartitemsStruct> get totalcart => _totalcart;
  set totalcart(List<CartitemsStruct> value) {
    _totalcart = value;
    prefs.setStringList(
        'ff_totalcart', value.map((x) => x.serialize()).toList());
  }

  void addToTotalcart(CartitemsStruct value) {
    _totalcart.add(value);
    prefs.setStringList(
        'ff_totalcart', _totalcart.map((x) => x.serialize()).toList());
  }

  void removeFromTotalcart(CartitemsStruct value) {
    _totalcart.remove(value);
    prefs.setStringList(
        'ff_totalcart', _totalcart.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTotalcart(int index) {
    _totalcart.removeAt(index);
    prefs.setStringList(
        'ff_totalcart', _totalcart.map((x) => x.serialize()).toList());
  }

  void updateTotalcartAtIndex(
    int index,
    CartitemsStruct Function(CartitemsStruct) updateFn,
  ) {
    _totalcart[index] = updateFn(_totalcart[index]);
    prefs.setStringList(
        'ff_totalcart', _totalcart.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTotalcart(int index, CartitemsStruct value) {
    _totalcart.insert(index, value);
    prefs.setStringList(
        'ff_totalcart', _totalcart.map((x) => x.serialize()).toList());
  }

  List<String> _productids = [];
  List<String> get productids => _productids;
  set productids(List<String> value) {
    _productids = value;
    prefs.setStringList('ff_productids', value);
  }

  void addToProductids(String value) {
    _productids.add(value);
    prefs.setStringList('ff_productids', _productids);
  }

  void removeFromProductids(String value) {
    _productids.remove(value);
    prefs.setStringList('ff_productids', _productids);
  }

  void removeAtIndexFromProductids(int index) {
    _productids.removeAt(index);
    prefs.setStringList('ff_productids', _productids);
  }

  void updateProductidsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _productids[index] = updateFn(_productids[index]);
    prefs.setStringList('ff_productids', _productids);
  }

  void insertAtIndexInProductids(int index, String value) {
    _productids.insert(index, value);
    prefs.setStringList('ff_productids', _productids);
  }

  double _finalamount = 0.0;
  double get finalamount => _finalamount;
  set finalamount(double value) {
    _finalamount = value;
    prefs.setDouble('ff_finalamount', value);
  }
    double _discountamount = 0.0;
  double get discountamount => _discountamount;
  set discountamount(double value) {
    _discountamount = value;
    prefs.setDouble('ff__discountamount', value);
  }

  double _cartvalue = 0.0;
  double get cartvalue => _cartvalue;
  set cartvalue(double value) {
    _cartvalue = value;
  }

  double _deliveryfee = 0.0;
  double get deliveryfee => _deliveryfee;
  set deliveryfee(double value) {
    _deliveryfee = value;
  }

  String _subtotal1 = '';
  String get subtotal1 => _subtotal1;
  set subtotal1(String value) {
    _subtotal1 = value;
  }

  String _subjectname = '';
  String get subjectname => _subjectname;
  set subjectname(String value) {
    _subjectname = value;
  }

  String _alias = '';
  String get alias => _alias;
  set alias(String value) {
    _alias = value;
  }

  String _time = '';
  String get time => _time;
  set time(String value) {
    _time = value;
  }

  DateTime? _starttime = DateTime.fromMillisecondsSinceEpoch(1703320920000);
  DateTime? get starttime => _starttime;
  set starttime(DateTime? value) {
    _starttime = value;
    value != null
        ? prefs.setInt('ff_starttime', value.millisecondsSinceEpoch)
        : prefs.remove('ff_starttime');
  }

  bool _isNavigated = false;
  bool get isNavigated => _isNavigated;
  set isNavigated(bool value) {
    _isNavigated = value;
  }

  bool _isfinished = false;
  bool get isfinished => _isfinished;
  set isfinished(bool value) {
    _isfinished = value;
  }

  List<Round2cartStruct> _totalcombocart = [];
  List<Round2cartStruct> get totalcombocart => _totalcombocart;
  set totalcombocart(List<Round2cartStruct> value) {
    _totalcombocart = value;
    prefs.setStringList(
        'ff_totalcombocart', value.map((x) => x.serialize()).toList());
  }

  void addToTotalcombocart(Round2cartStruct value) {
    _totalcombocart.add(value);
    prefs.setStringList('ff_totalcombocart',
        _totalcombocart.map((x) => x.serialize()).toList());
  }

  void removeFromTotalcombocart(Round2cartStruct value) {
    _totalcombocart.remove(value);
    prefs.setStringList('ff_totalcombocart',
        _totalcombocart.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTotalcombocart(int index) {
    _totalcombocart.removeAt(index);
    prefs.setStringList('ff_totalcombocart',
        _totalcombocart.map((x) => x.serialize()).toList());
  }

  void updateTotalcombocartAtIndex(
    int index,
    Round2cartStruct Function(Round2cartStruct) updateFn,
  ) {
    _totalcombocart[index] = updateFn(_totalcombocart[index]);
    prefs.setStringList('ff_totalcombocart',
        _totalcombocart.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTotalcombocart(int index, Round2cartStruct value) {
    _totalcombocart.insert(index, value);
    prefs.setStringList('ff_totalcombocart',
        _totalcombocart.map((x) => x.serialize()).toList());
  }

  List<String> _comboid = [];
  List<String> get comboid => _comboid;
  set comboid(List<String> value) {
    _comboid = value;
    prefs.setStringList('ff_comboid', value);
  }

  void addToComboid(String value) {
    _comboid.add(value);
    prefs.setStringList('ff_comboid', _comboid);
  }

  void removeFromComboid(String value) {
    _comboid.remove(value);
    prefs.setStringList('ff_comboid', _comboid);
  }

  void removeAtIndexFromComboid(int index) {
    _comboid.removeAt(index);
    prefs.setStringList('ff_comboid', _comboid);
  }

  void updateComboidAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _comboid[index] = updateFn(_comboid[index]);
    prefs.setStringList('ff_comboid', _comboid);
  }

  void insertAtIndexInComboid(int index, String value) {
    _comboid.insert(index, value);
    prefs.setStringList('ff_comboid', _comboid);
  }

  double _combocart = 0.0;
  double get combocart => _combocart;
  set combocart(double value) {
    _combocart = value;
  }

  double _combodedliveryfee = 0.0;
  double get combodedliveryfee => _combodedliveryfee;
  set combodedliveryfee(double value) {
    _combodedliveryfee = value;
  }

  double _combofinalamount = 0.0;
  double get combofinalamount => _combofinalamount;
  set combofinalamount(double value) {
    _combofinalamount = value;
    prefs.setDouble('ff_combofinalamount', value);
  }

  List<String> _certificateId = [];
  List<String> get certificateId => _certificateId;
  set certificateId(List<String> value) {
    _certificateId = value;
    prefs.setStringList('ff_certificateId', value);
  }

  void addToCertificateId(String value) {
    _certificateId.add(value);
    prefs.setStringList('ff_certificateId', _certificateId);
  }

  void removeFromCertificateId(String value) {
    _certificateId.remove(value);
    prefs.setStringList('ff_certificateId', _certificateId);
  }

  void removeAtIndexFromCertificateId(int index) {
    _certificateId.removeAt(index);
    prefs.setStringList('ff_certificateId', _certificateId);
  }

  void updateCertificateIdAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _certificateId[index] = updateFn(_certificateId[index]);
    prefs.setStringList('ff_certificateId', _certificateId);
  }

  void insertAtIndexInCertificateId(int index, String value) {
    _certificateId.insert(index, value);
    prefs.setStringList('ff_certificateId', _certificateId);
  }



  int _deliverablecount = 0;
  int get deliverablecount => _deliverablecount;
  set deliverablecount(int value) {
    _deliverablecount = value;
  }

  String _payurl = '';
  String get payurl => _payurl;
  set payurl(String value) {
    _payurl = value;
  }

  String _transactionId = '';
  String get transactionId => _transactionId;
  set transactionId(String value) {
    _transactionId = value;
  }

  String _statuscode = '';
  String get statuscode => _statuscode;
  set statuscode(String value) {
    _statuscode = value;
  }

  String _merchantTranId = '';
  String get merchantTranId => _merchantTranId;
  set merchantTranId(String value) {
    _merchantTranId = value;
  }

  int _showResult = 0;
  int get showResult => _showResult;
  set showResult(int value) {
    _showResult = value;
    prefs.setInt('ff_showResult', value);
  }

  String _dosAnddont =
      'https://firebasestorage.googleapis.com/v0/b/hydooz-421cb.appspot.com/o/Online_Exam_-_Dos_and_Donts.docx_00001.jpg?alt=media&token=20ec69ac-c507-4f82-a60e-48f0b748d9b2';
  String get dosAnddont => _dosAnddont;
  set dosAnddont(String value) {
    _dosAnddont = value;
    prefs.setString('ff_dosAnddont', value);
  }

  List<String> _applied = [];
  List<String> get applied => _applied;
  set applied(List<String> value) {
    _applied = value;
    prefs.setStringList('ff_applied', value);
  }

  void addToApplied(String value) {
    _applied.add(value);
    prefs.setStringList('ff_applied', _applied);
  }

  void removeFromApplied(String value) {
    _applied.remove(value);
    prefs.setStringList('ff_applied', _applied);
  }

  void removeAtIndexFromApplied(int index) {
    _applied.removeAt(index);
    prefs.setStringList('ff_applied', _applied);
  }

  void updateAppliedAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _applied[index] = updateFn(_applied[index]);
    prefs.setStringList('ff_applied', _applied);
  }

  void insertAtIndexInApplied(int index, String value) {
    _applied.insert(index, value);
    prefs.setStringList('ff_applied', _applied);
  }

  CouponStruct _couponscode = CouponStruct();
  CouponStruct get couponscode => _couponscode;
  set couponscode(CouponStruct value) {
    _couponscode = value;
    prefs.setString('ff_couponscode', value.serialize());
  }

  void updateCouponscodeStruct(Function(CouponStruct) updateFn) {
    updateFn(_couponscode);
    prefs.setString('ff_couponscode', _couponscode.serialize());
  }

  List<String> _noofselected = [];
  List<String> get noofselected => _noofselected;
  set noofselected(List<String> value) {
    _noofselected = value;
    prefs.setStringList('ff_noofselected', value);
  }

  void addToNoofselected(String value) {
    _noofselected.add(value);
    prefs.setStringList('ff_noofselected', _noofselected);
  }

  void removeFromNoofselected(String value) {
    _noofselected.remove(value);
    prefs.setStringList('ff_noofselected', _noofselected);
  }

  void removeAtIndexFromNoofselected(int index) {
    _noofselected.removeAt(index);
    prefs.setStringList('ff_noofselected', _noofselected);
  }

  void updateNoofselectedAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _noofselected[index] = updateFn(_noofselected[index]);
    prefs.setStringList('ff_noofselected', _noofselected);
  }

  void insertAtIndexInNoofselected(int index, String value) {
    _noofselected.insert(index, value);
    prefs.setStringList('ff_noofselected', _noofselected);
  }
  List<PowercartStruct> _powercart = [];
  List<PowercartStruct> get powercart => _powercart;
  set powercart(List<PowercartStruct> value) {
    _powercart = value;
    prefs.setStringList(
        'ff_powercart', value.map((x) => x.serialize()).toList());
  }

  void addToPowercart(PowercartStruct value) {
    _powercart.add(value);
    prefs.setStringList(
        'ff_powercart', _powercart.map((x) => x.serialize()).toList());
  }

  void removeFromPowercart(PowercartStruct value) {
    _powercart.remove(value);
    prefs.setStringList(
        'ff_powercart', _powercart.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromPowercart(int index) {
    _powercart.removeAt(index);
    prefs.setStringList(
        'ff_powercart', _powercart.map((x) => x.serialize()).toList());
  }

  void updatePowercartAtIndex(
    int index,
    PowercartStruct Function(PowercartStruct) updateFn,
  ) {
    _powercart[index] = updateFn(_powercart[index]);
    prefs.setStringList(
        'ff_powercart', _powercart.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInPowercart(int index, PowercartStruct value) {
    _powercart.insert(index, value);
    prefs.setStringList(
        'ff_powercart', _powercart.map((x) => x.serialize()).toList());
  }

  List<String> _powercomboid = [];
  List<String> get powercomboid => _powercomboid;
  set powercomboid(List<String> value) {
    _powercomboid = value;
    prefs.setStringList('ff_powercomboid', value);
  }

  void addToPowercomboid(String value) {
    _powercomboid.add(value);
    prefs.setStringList('ff_powercomboid', _powercomboid);
  }

  void removeFromPowercomboid(String value) {
    _powercomboid.remove(value);
    prefs.setStringList('ff_powercomboid', _powercomboid);
  }

  void removeAtIndexFromPowercomboid(int index) {
    _powercomboid.removeAt(index);
    prefs.setStringList('ff_powercomboid', _powercomboid);
  }

  void updatePowercomboidAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _powercomboid[index] = updateFn(_powercomboid[index]);
    prefs.setStringList('ff_powercomboid', _powercomboid);
  }

  void insertAtIndexInPowercomboid(int index, String value) {
    _powercomboid.insert(index, value);
    prefs.setStringList('ff_powercomboid', _powercomboid);
  }

  double _powerdiscount = 0.0;
  double get powerdiscount => _powerdiscount;
  set powerdiscount(double value) {
    _powerdiscount = value;
    prefs.setDouble('ff_powerdiscount', value);
  }

  double _powerfinalamount = 0.0;
  double get powerfinalamount => _powerfinalamount;
  set powerfinalamount(double value) {
    _powerfinalamount = value;
    prefs.setDouble('ff_powerfinalamount', value);
  }

  double _powercartvalue = 0.0;
  double get powercartvalue => _powercartvalue;
  set powercartvalue(double value) {
    _powercartvalue = value;
  }
  List<String> _powerId = [];
  List<String> get powerId => _powerId;
  set powerId(List<String> value) {
    _powerId = value;
    prefs.setStringList('ff_powerId', value);
  }

  void addToPowerId(String value) {
    _powerId.add(value);
    prefs.setStringList('ff_powerId', _powerId);
  }

  void removeFromPowerId(String value) {
    _powerId.remove(value);
    prefs.setStringList('ff_powerId', _powerId);
  }

  void removeAtIndexFromPowerId(int index) {
    _powerId.removeAt(index);
    prefs.setStringList('ff_powerId', _powerId);
  }

  void updatePowerIdAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _powerId[index] = updateFn(_powerId[index]);
    prefs.setStringList('ff_powerId', _powerId);
  }

  void insertAtIndexInPowerId(int index, String value) {
    _powerId.insert(index, value);
    prefs.setStringList('ff_powerId', _powerId);
  }

}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
