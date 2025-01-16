import 'package:flutter/material.dart';
import 'package:indian_talent_olympiad/backend/schema/structs/powercart_struct.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
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
  set userInfo(StudentStruct _value) {
    _userInfo = _value;
    prefs.setString('ff_userInfo', _value.serialize());
  }

  void updateUserInfoStruct(Function(StudentStruct) updateFn) {
    updateFn(_userInfo);
    prefs.setString('ff_userInfo', _userInfo.serialize());
  }

  String _userDetails = '';
  String get userDetails => _userDetails;
  set userDetails(String _value) {
    _userDetails = _value;
  }

  int _otp = 0;
  int get otp => _otp;
  set otp(int _value) {
    _otp = _value;
  }

  String _otp1 = '';
  String get otp1 => _otp1;
  set otp1(String _value) {
    _otp1 = _value;
    prefs.setString('ff_otp1', _value);
  }
String _appcheck = '';
  String get appcheck => _appcheck;
  set appcheck(String _value) {
    _appcheck = _value;
  }
  SubscriptionsStruct _subs =
      SubscriptionsStruct.fromSerializableMap(jsonDecode('{}'));
  SubscriptionsStruct get subs => _subs;
  set subs(SubscriptionsStruct _value) {
    _subs = _value;
    prefs.setString('ff_subs', _value.serialize());
  }

  void updateSubsStruct(Function(SubscriptionsStruct) updateFn) {
    updateFn(_subs);
    prefs.setString('ff_subs', _subs.serialize());
  }

  SubjectsStruct _subjects = SubjectsStruct.fromSerializableMap(jsonDecode(
      '{\"std\":\"[]\",\"subjectTitle\":\"[]\",\"subjectname\":\"[]\",\"subjectIcon\":\"[]\"}'));
  SubjectsStruct get subjects => _subjects;
  set subjects(SubjectsStruct _value) {
    _subjects = _value;
    prefs.setString('ff_subjects', _value.serialize());
  }

  void updateSubjectsStruct(Function(SubjectsStruct) updateFn) {
    updateFn(_subjects);
    prefs.setString('ff_subjects', _subjects.serialize());
  }

  QuestionsStruct _questions = QuestionsStruct();
  QuestionsStruct get questions => _questions;
  set questions(QuestionsStruct _value) {
    _questions = _value;
    prefs.setString('ff_questions', _value.serialize());
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
  set allservices(List<ServicesStruct> _value) {
    _allservices = _value;
    prefs.setStringList(
        'ff_allservices', _value.map((x) => x.serialize()).toList());
  }

  void addToAllservices(ServicesStruct _value) {
    _allservices.add(_value);
    prefs.setStringList(
        'ff_allservices', _allservices.map((x) => x.serialize()).toList());
  }

  void removeFromAllservices(ServicesStruct _value) {
    _allservices.remove(_value);
    prefs.setStringList(
        'ff_allservices', _allservices.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromAllservices(int _index) {
    _allservices.removeAt(_index);
    prefs.setStringList(
        'ff_allservices', _allservices.map((x) => x.serialize()).toList());
  }

  void updateAllservicesAtIndex(
    int _index,
    ServicesStruct Function(ServicesStruct) updateFn,
  ) {
    _allservices[_index] = updateFn(_allservices[_index]);
    prefs.setStringList(
        'ff_allservices', _allservices.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInAllservices(int _index, ServicesStruct _value) {
    _allservices.insert(_index, _value);
    prefs.setStringList(
        'ff_allservices', _allservices.map((x) => x.serialize()).toList());
  }

  List<AnswersStruct> _answers = [];
  List<AnswersStruct> get answers => _answers;
  set answers(List<AnswersStruct> _value) {
    _answers = _value;
    prefs.setStringList(
        'ff_answers', _value.map((x) => x.serialize()).toList());
  }

  void addToAnswers(AnswersStruct _value) {
    _answers.add(_value);
    prefs.setStringList(
        'ff_answers', _answers.map((x) => x.serialize()).toList());
  }

  void removeFromAnswers(AnswersStruct _value) {
    _answers.remove(_value);
    prefs.setStringList(
        'ff_answers', _answers.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromAnswers(int _index) {
    _answers.removeAt(_index);
    prefs.setStringList(
        'ff_answers', _answers.map((x) => x.serialize()).toList());
  }

  void updateAnswersAtIndex(
    int _index,
    AnswersStruct Function(AnswersStruct) updateFn,
  ) {
    _answers[_index] = updateFn(_answers[_index]);
    prefs.setStringList(
        'ff_answers', _answers.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInAnswers(int _index, AnswersStruct _value) {
    _answers.insert(_index, _value);
    prefs.setStringList(
        'ff_answers', _answers.map((x) => x.serialize()).toList());
  }

  List<TestsStruct> _testAll = [];
  List<TestsStruct> get testAll => _testAll;
  set testAll(List<TestsStruct> _value) {
    _testAll = _value;
    prefs.setStringList(
        'ff_testAll', _value.map((x) => x.serialize()).toList());
  }

  void addToTestAll(TestsStruct _value) {
    _testAll.add(_value);
    prefs.setStringList(
        'ff_testAll', _testAll.map((x) => x.serialize()).toList());
  }

  void removeFromTestAll(TestsStruct _value) {
    _testAll.remove(_value);
    prefs.setStringList(
        'ff_testAll', _testAll.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTestAll(int _index) {
    _testAll.removeAt(_index);
    prefs.setStringList(
        'ff_testAll', _testAll.map((x) => x.serialize()).toList());
  }

  void updateTestAllAtIndex(
    int _index,
    TestsStruct Function(TestsStruct) updateFn,
  ) {
    _testAll[_index] = updateFn(_testAll[_index]);
    prefs.setStringList(
        'ff_testAll', _testAll.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTestAll(int _index, TestsStruct _value) {
    _testAll.insert(_index, _value);
    prefs.setStringList(
        'ff_testAll', _testAll.map((x) => x.serialize()).toList());
  }

  String _timetaken = '';
  String get timetaken => _timetaken;
  set timetaken(String _value) {
    _timetaken = _value;
  }

  String _attemptedquestions = '';
  String get attemptedquestions => _attemptedquestions;
  set attemptedquestions(String _value) {
    _attemptedquestions = _value;
  }

  String _testid = '';
  String get testid => _testid;
  set testid(String _value) {
    _testid = _value;
  }

  PiechartvaluesStruct _piechartvalues = PiechartvaluesStruct();
  PiechartvaluesStruct get piechartvalues => _piechartvalues;
  set piechartvalues(PiechartvaluesStruct _value) {
    _piechartvalues = _value;
  }

  void updatePiechartvaluesStruct(Function(PiechartvaluesStruct) updateFn) {
    updateFn(_piechartvalues);
  }

  String _totaltime = '';
  String get totaltime => _totaltime;
  set totaltime(String _value) {
    _totaltime = _value;
  }

  List<String> _imageslist = [];
  List<String> get imageslist => _imageslist;
  set imageslist(List<String> _value) {
    _imageslist = _value;
    prefs.setStringList('ff_imageslist', _value);
  }

  void addToImageslist(String _value) {
    _imageslist.add(_value);
    prefs.setStringList('ff_imageslist', _imageslist);
  }

  void removeFromImageslist(String _value) {
    _imageslist.remove(_value);
    prefs.setStringList('ff_imageslist', _imageslist);
  }

  void removeAtIndexFromImageslist(int _index) {
    _imageslist.removeAt(_index);
    prefs.setStringList('ff_imageslist', _imageslist);
  }

  void updateImageslistAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _imageslist[_index] = updateFn(_imageslist[_index]);
    prefs.setStringList('ff_imageslist', _imageslist);
  }

  void insertAtIndexInImageslist(int _index, String _value) {
    _imageslist.insert(_index, _value);
    prefs.setStringList('ff_imageslist', _imageslist);
  }

  AmountProductsStruct _addValue = AmountProductsStruct();
  AmountProductsStruct get addValue => _addValue;
  set addValue(AmountProductsStruct _value) {
    _addValue = _value;
    prefs.setString('ff_addValue', _value.serialize());
  }

  void updateAddValueStruct(Function(AmountProductsStruct) updateFn) {
    updateFn(_addValue);
    prefs.setString('ff_addValue', _addValue.serialize());
  }

  int _productSub = 0;
  int get productSub => _productSub;
  set productSub(int _value) {
    _productSub = _value;
    prefs.setInt('ff_productSub', _value);
  }

  TimelinedocumentStruct _timeline = TimelinedocumentStruct();
  TimelinedocumentStruct get timeline => _timeline;
  set timeline(TimelinedocumentStruct _value) {
    _timeline = _value;
    prefs.setString('ff_timeline', _value.serialize());
  }

  void updateTimelineStruct(Function(TimelinedocumentStruct) updateFn) {
    updateFn(_timeline);
    prefs.setString('ff_timeline', _timeline.serialize());
  }

  bool _isChecked = false;
  bool get isChecked => _isChecked;
  set isChecked(bool _value) {
    _isChecked = _value;
    prefs.setBool('ff_isChecked', _value);
  }

  bool _isupdateAvailable = false;
  bool get isupdateAvailable => _isupdateAvailable;
  set isupdateAvailable(bool _value) {
    _isupdateAvailable = _value;
    prefs.setBool('ff_isupdateAvailable', _value);
  }


  List<TimelinedocumentStruct> _slot1 = [];
  List<TimelinedocumentStruct> get slot1 => _slot1;
  set slot1(List<TimelinedocumentStruct> _value) {
    _slot1 = _value;
  }

  void addToSlot1(TimelinedocumentStruct _value) {
    _slot1.add(_value);
  }

  void removeFromSlot1(TimelinedocumentStruct _value) {
    _slot1.remove(_value);
  }

  void removeAtIndexFromSlot1(int _index) {
    _slot1.removeAt(_index);
  }

  void updateSlot1AtIndex(
    int _index,
    TimelinedocumentStruct Function(TimelinedocumentStruct) updateFn,
  ) {
    _slot1[_index] = updateFn(_slot1[_index]);
  }

  void insertAtIndexInSlot1(int _index, TimelinedocumentStruct _value) {
    _slot1.insert(_index, _value);
  }

  List<TimelinedocumentStruct> _slot1annual = [];
  List<TimelinedocumentStruct> get slot1annual => _slot1annual;
  set slot1annual(List<TimelinedocumentStruct> _value) {
    _slot1annual = _value;
  }

  void addToSlot1annual(TimelinedocumentStruct _value) {
    _slot1annual.add(_value);
  }

  void removeFromSlot1annual(TimelinedocumentStruct _value) {
    _slot1annual.remove(_value);
  }

  void removeAtIndexFromSlot1annual(int _index) {
    _slot1annual.removeAt(_index);
  }

  void updateSlot1annualAtIndex(
    int _index,
    TimelinedocumentStruct Function(TimelinedocumentStruct) updateFn,
  ) {
    _slot1annual[_index] = updateFn(_slot1annual[_index]);
  }

  void insertAtIndexInSlot1annual(int _index, TimelinedocumentStruct _value) {
    _slot1annual.insert(_index, _value);
  }

  List<TimelinedocumentStruct> _slot2annual = [];
  List<TimelinedocumentStruct> get slot2annual => _slot2annual;
  set slot2annual(List<TimelinedocumentStruct> _value) {
    _slot2annual = _value;
    prefs.setStringList(
        'ff_slot2annual', _value.map((x) => x.serialize()).toList());
  }

  void addToSlot2annual(TimelinedocumentStruct _value) {
    _slot2annual.add(_value);
    prefs.setStringList(
        'ff_slot2annual', _slot2annual.map((x) => x.serialize()).toList());
  }

  void removeFromSlot2annual(TimelinedocumentStruct _value) {
    _slot2annual.remove(_value);
    prefs.setStringList(
        'ff_slot2annual', _slot2annual.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromSlot2annual(int _index) {
    _slot2annual.removeAt(_index);
    prefs.setStringList(
        'ff_slot2annual', _slot2annual.map((x) => x.serialize()).toList());
  }

  void updateSlot2annualAtIndex(
    int _index,
    TimelinedocumentStruct Function(TimelinedocumentStruct) updateFn,
  ) {
    _slot2annual[_index] = updateFn(_slot2annual[_index]);
    prefs.setStringList(
        'ff_slot2annual', _slot2annual.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInSlot2annual(int _index, TimelinedocumentStruct _value) {
    _slot2annual.insert(_index, _value);
    prefs.setStringList(
        'ff_slot2annual', _slot2annual.map((x) => x.serialize()).toList());
  }

  List<CartitemsStruct> _totalcart = [];
  List<CartitemsStruct> get totalcart => _totalcart;
  set totalcart(List<CartitemsStruct> _value) {
    _totalcart = _value;
    prefs.setStringList(
        'ff_totalcart', _value.map((x) => x.serialize()).toList());
  }

  void addToTotalcart(CartitemsStruct _value) {
    _totalcart.add(_value);
    prefs.setStringList(
        'ff_totalcart', _totalcart.map((x) => x.serialize()).toList());
  }

  void removeFromTotalcart(CartitemsStruct _value) {
    _totalcart.remove(_value);
    prefs.setStringList(
        'ff_totalcart', _totalcart.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTotalcart(int _index) {
    _totalcart.removeAt(_index);
    prefs.setStringList(
        'ff_totalcart', _totalcart.map((x) => x.serialize()).toList());
  }

  void updateTotalcartAtIndex(
    int _index,
    CartitemsStruct Function(CartitemsStruct) updateFn,
  ) {
    _totalcart[_index] = updateFn(_totalcart[_index]);
    prefs.setStringList(
        'ff_totalcart', _totalcart.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTotalcart(int _index, CartitemsStruct _value) {
    _totalcart.insert(_index, _value);
    prefs.setStringList(
        'ff_totalcart', _totalcart.map((x) => x.serialize()).toList());
  }

  List<String> _productids = [];
  List<String> get productids => _productids;
  set productids(List<String> _value) {
    _productids = _value;
    prefs.setStringList('ff_productids', _value);
  }

  void addToProductids(String _value) {
    _productids.add(_value);
    prefs.setStringList('ff_productids', _productids);
  }

  void removeFromProductids(String _value) {
    _productids.remove(_value);
    prefs.setStringList('ff_productids', _productids);
  }

  void removeAtIndexFromProductids(int _index) {
    _productids.removeAt(_index);
    prefs.setStringList('ff_productids', _productids);
  }

  void updateProductidsAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _productids[_index] = updateFn(_productids[_index]);
    prefs.setStringList('ff_productids', _productids);
  }

  void insertAtIndexInProductids(int _index, String _value) {
    _productids.insert(_index, _value);
    prefs.setStringList('ff_productids', _productids);
  }

  double _finalamount = 0.0;
  double get finalamount => _finalamount;
  set finalamount(double _value) {
    _finalamount = _value;
    prefs.setDouble('ff_finalamount', _value);
  }
    double _discountamount = 0.0;
  double get discountamount => _discountamount;
  set discountamount(double _value) {
    _discountamount = _value;
    prefs.setDouble('ff__discountamount', _value);
  }

  double _cartvalue = 0.0;
  double get cartvalue => _cartvalue;
  set cartvalue(double _value) {
    _cartvalue = _value;
  }

  double _deliveryfee = 0.0;
  double get deliveryfee => _deliveryfee;
  set deliveryfee(double _value) {
    _deliveryfee = _value;
  }

  String _subtotal1 = '';
  String get subtotal1 => _subtotal1;
  set subtotal1(String _value) {
    _subtotal1 = _value;
  }

  String _subjectname = '';
  String get subjectname => _subjectname;
  set subjectname(String _value) {
    _subjectname = _value;
  }

  String _alias = '';
  String get alias => _alias;
  set alias(String _value) {
    _alias = _value;
  }

  String _time = '';
  String get time => _time;
  set time(String _value) {
    _time = _value;
  }

  DateTime? _starttime = DateTime.fromMillisecondsSinceEpoch(1703320920000);
  DateTime? get starttime => _starttime;
  set starttime(DateTime? _value) {
    _starttime = _value;
    _value != null
        ? prefs.setInt('ff_starttime', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_starttime');
  }

  bool _isNavigated = false;
  bool get isNavigated => _isNavigated;
  set isNavigated(bool _value) {
    _isNavigated = _value;
  }

  bool _isfinished = false;
  bool get isfinished => _isfinished;
  set isfinished(bool _value) {
    _isfinished = _value;
  }

  List<Round2cartStruct> _totalcombocart = [];
  List<Round2cartStruct> get totalcombocart => _totalcombocart;
  set totalcombocart(List<Round2cartStruct> _value) {
    _totalcombocart = _value;
    prefs.setStringList(
        'ff_totalcombocart', _value.map((x) => x.serialize()).toList());
  }

  void addToTotalcombocart(Round2cartStruct _value) {
    _totalcombocart.add(_value);
    prefs.setStringList('ff_totalcombocart',
        _totalcombocart.map((x) => x.serialize()).toList());
  }

  void removeFromTotalcombocart(Round2cartStruct _value) {
    _totalcombocart.remove(_value);
    prefs.setStringList('ff_totalcombocart',
        _totalcombocart.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTotalcombocart(int _index) {
    _totalcombocart.removeAt(_index);
    prefs.setStringList('ff_totalcombocart',
        _totalcombocart.map((x) => x.serialize()).toList());
  }

  void updateTotalcombocartAtIndex(
    int _index,
    Round2cartStruct Function(Round2cartStruct) updateFn,
  ) {
    _totalcombocart[_index] = updateFn(_totalcombocart[_index]);
    prefs.setStringList('ff_totalcombocart',
        _totalcombocart.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTotalcombocart(int _index, Round2cartStruct _value) {
    _totalcombocart.insert(_index, _value);
    prefs.setStringList('ff_totalcombocart',
        _totalcombocart.map((x) => x.serialize()).toList());
  }

  List<String> _comboid = [];
  List<String> get comboid => _comboid;
  set comboid(List<String> _value) {
    _comboid = _value;
    prefs.setStringList('ff_comboid', _value);
  }

  void addToComboid(String _value) {
    _comboid.add(_value);
    prefs.setStringList('ff_comboid', _comboid);
  }

  void removeFromComboid(String _value) {
    _comboid.remove(_value);
    prefs.setStringList('ff_comboid', _comboid);
  }

  void removeAtIndexFromComboid(int _index) {
    _comboid.removeAt(_index);
    prefs.setStringList('ff_comboid', _comboid);
  }

  void updateComboidAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _comboid[_index] = updateFn(_comboid[_index]);
    prefs.setStringList('ff_comboid', _comboid);
  }

  void insertAtIndexInComboid(int _index, String _value) {
    _comboid.insert(_index, _value);
    prefs.setStringList('ff_comboid', _comboid);
  }

  double _combocart = 0.0;
  double get combocart => _combocart;
  set combocart(double _value) {
    _combocart = _value;
  }

  double _combodedliveryfee = 0.0;
  double get combodedliveryfee => _combodedliveryfee;
  set combodedliveryfee(double _value) {
    _combodedliveryfee = _value;
  }

  double _combofinalamount = 0.0;
  double get combofinalamount => _combofinalamount;
  set combofinalamount(double _value) {
    _combofinalamount = _value;
    prefs.setDouble('ff_combofinalamount', _value);
  }

  List<String> _certificateId = [];
  List<String> get certificateId => _certificateId;
  set certificateId(List<String> _value) {
    _certificateId = _value;
    prefs.setStringList('ff_certificateId', _value);
  }

  void addToCertificateId(String _value) {
    _certificateId.add(_value);
    prefs.setStringList('ff_certificateId', _certificateId);
  }

  void removeFromCertificateId(String _value) {
    _certificateId.remove(_value);
    prefs.setStringList('ff_certificateId', _certificateId);
  }

  void removeAtIndexFromCertificateId(int _index) {
    _certificateId.removeAt(_index);
    prefs.setStringList('ff_certificateId', _certificateId);
  }

  void updateCertificateIdAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _certificateId[_index] = updateFn(_certificateId[_index]);
    prefs.setStringList('ff_certificateId', _certificateId);
  }

  void insertAtIndexInCertificateId(int _index, String _value) {
    _certificateId.insert(_index, _value);
    prefs.setStringList('ff_certificateId', _certificateId);
  }



  int _deliverablecount = 0;
  int get deliverablecount => _deliverablecount;
  set deliverablecount(int _value) {
    _deliverablecount = _value;
  }

  String _payurl = '';
  String get payurl => _payurl;
  set payurl(String _value) {
    _payurl = _value;
  }

  String _transactionId = '';
  String get transactionId => _transactionId;
  set transactionId(String _value) {
    _transactionId = _value;
  }

  String _statuscode = '';
  String get statuscode => _statuscode;
  set statuscode(String _value) {
    _statuscode = _value;
  }

  String _merchantTranId = '';
  String get merchantTranId => _merchantTranId;
  set merchantTranId(String _value) {
    _merchantTranId = _value;
  }

  int _showResult = 0;
  int get showResult => _showResult;
  set showResult(int _value) {
    _showResult = _value;
    prefs.setInt('ff_showResult', _value);
  }

  String _dosAnddont =
      'https://firebasestorage.googleapis.com/v0/b/hydooz-421cb.appspot.com/o/Online_Exam_-_Dos_and_Donts.docx_00001.jpg?alt=media&token=20ec69ac-c507-4f82-a60e-48f0b748d9b2';
  String get dosAnddont => _dosAnddont;
  set dosAnddont(String _value) {
    _dosAnddont = _value;
    prefs.setString('ff_dosAnddont', _value);
  }

  List<String> _applied = [];
  List<String> get applied => _applied;
  set applied(List<String> _value) {
    _applied = _value;
    prefs.setStringList('ff_applied', _value);
  }

  void addToApplied(String _value) {
    _applied.add(_value);
    prefs.setStringList('ff_applied', _applied);
  }

  void removeFromApplied(String _value) {
    _applied.remove(_value);
    prefs.setStringList('ff_applied', _applied);
  }

  void removeAtIndexFromApplied(int _index) {
    _applied.removeAt(_index);
    prefs.setStringList('ff_applied', _applied);
  }

  void updateAppliedAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _applied[_index] = updateFn(_applied[_index]);
    prefs.setStringList('ff_applied', _applied);
  }

  void insertAtIndexInApplied(int _index, String _value) {
    _applied.insert(_index, _value);
    prefs.setStringList('ff_applied', _applied);
  }

  CouponStruct _couponscode = CouponStruct();
  CouponStruct get couponscode => _couponscode;
  set couponscode(CouponStruct _value) {
    _couponscode = _value;
    prefs.setString('ff_couponscode', _value.serialize());
  }

  void updateCouponscodeStruct(Function(CouponStruct) updateFn) {
    updateFn(_couponscode);
    prefs.setString('ff_couponscode', _couponscode.serialize());
  }

  List<String> _noofselected = [];
  List<String> get noofselected => _noofselected;
  set noofselected(List<String> _value) {
    _noofselected = _value;
    prefs.setStringList('ff_noofselected', _value);
  }

  void addToNoofselected(String _value) {
    _noofselected.add(_value);
    prefs.setStringList('ff_noofselected', _noofselected);
  }

  void removeFromNoofselected(String _value) {
    _noofselected.remove(_value);
    prefs.setStringList('ff_noofselected', _noofselected);
  }

  void removeAtIndexFromNoofselected(int _index) {
    _noofselected.removeAt(_index);
    prefs.setStringList('ff_noofselected', _noofselected);
  }

  void updateNoofselectedAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _noofselected[_index] = updateFn(_noofselected[_index]);
    prefs.setStringList('ff_noofselected', _noofselected);
  }

  void insertAtIndexInNoofselected(int _index, String _value) {
    _noofselected.insert(_index, _value);
    prefs.setStringList('ff_noofselected', _noofselected);
  }
  List<PowercartStruct> _powercart = [];
  List<PowercartStruct> get powercart => _powercart;
  set powercart(List<PowercartStruct> _value) {
    _powercart = _value;
    prefs.setStringList(
        'ff_powercart', _value.map((x) => x.serialize()).toList());
  }

  void addToPowercart(PowercartStruct _value) {
    _powercart.add(_value);
    prefs.setStringList(
        'ff_powercart', _powercart.map((x) => x.serialize()).toList());
  }

  void removeFromPowercart(PowercartStruct _value) {
    _powercart.remove(_value);
    prefs.setStringList(
        'ff_powercart', _powercart.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromPowercart(int _index) {
    _powercart.removeAt(_index);
    prefs.setStringList(
        'ff_powercart', _powercart.map((x) => x.serialize()).toList());
  }

  void updatePowercartAtIndex(
    int _index,
    PowercartStruct Function(PowercartStruct) updateFn,
  ) {
    _powercart[_index] = updateFn(_powercart[_index]);
    prefs.setStringList(
        'ff_powercart', _powercart.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInPowercart(int _index, PowercartStruct _value) {
    _powercart.insert(_index, _value);
    prefs.setStringList(
        'ff_powercart', _powercart.map((x) => x.serialize()).toList());
  }

  List<String> _powercomboid = [];
  List<String> get powercomboid => _powercomboid;
  set powercomboid(List<String> _value) {
    _powercomboid = _value;
    prefs.setStringList('ff_powercomboid', _value);
  }

  void addToPowercomboid(String _value) {
    _powercomboid.add(_value);
    prefs.setStringList('ff_powercomboid', _powercomboid);
  }

  void removeFromPowercomboid(String _value) {
    _powercomboid.remove(_value);
    prefs.setStringList('ff_powercomboid', _powercomboid);
  }

  void removeAtIndexFromPowercomboid(int _index) {
    _powercomboid.removeAt(_index);
    prefs.setStringList('ff_powercomboid', _powercomboid);
  }

  void updatePowercomboidAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _powercomboid[_index] = updateFn(_powercomboid[_index]);
    prefs.setStringList('ff_powercomboid', _powercomboid);
  }

  void insertAtIndexInPowercomboid(int _index, String _value) {
    _powercomboid.insert(_index, _value);
    prefs.setStringList('ff_powercomboid', _powercomboid);
  }

  double _powerdiscount = 0.0;
  double get powerdiscount => _powerdiscount;
  set powerdiscount(double _value) {
    _powerdiscount = _value;
    prefs.setDouble('ff_powerdiscount', _value);
  }

  double _powerfinalamount = 0.0;
  double get powerfinalamount => _powerfinalamount;
  set powerfinalamount(double _value) {
    _powerfinalamount = _value;
    prefs.setDouble('ff_powerfinalamount', _value);
  }

  double _powercartvalue = 0.0;
  double get powercartvalue => _powercartvalue;
  set powercartvalue(double _value) {
    _powercartvalue = _value;
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
