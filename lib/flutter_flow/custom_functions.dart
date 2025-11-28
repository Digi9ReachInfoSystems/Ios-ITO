import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

Color? color(int value) {
  {
    List<Color> colors = [
      Color(0xFF6610F2), // Equivalent to Color.fromARGB(255, 233, 140, 134)
      Color(0xFFFD7E14), // Equivalent to Color.fromARGB(255, 139, 225, 141)
      Color(0xFFAFBE29), // Equivalent to Color.fromARGB(255, 139, 186, 224)
      Color(0xFF0DCAF0),
      Color(0xFF198754),
      Color(0xFF863DFF),
      // Equivalent to Color.fromARGB(255, 233, 226, 163)
      // Add as many colors as you want
    ];

    return colors[value % colors.length];
  }
}

String images(int names) {
  // to map a string to an image from a set in Flutter?
  Map<int, String> imageMap = {
    1: 'https://cdn-icons-png.flaticon.com/128/2987/2987996.png',

    2: 'https://s3-alpha-sig.figma.com/img/1cc4/ad69/67b2634bd666e8439c57cba647f5b8d3?Expires=1698019200&Signature=BVC5oCWTuWDlvmkEl2DOzB7ckl9EZphch02e2S2JppPszhuDafTGE1N15zj6hm1my1uXS8PjcX1T2jYfQnpFRQO93UbeQ~y~AexktnfI~n9FppCWj54t-yjly65pF9cz80u2KHxhwumnc0huV365J81FWbEh-GOz3Ldc3VJ5WRv0JOh6p4nH8wLoSdPTAEkiAoXXmh1qxBWiAP5ijrx3eJtG6HYdxt05iNvgSpovsX8dPBhlehieODrNmV1vDpV1EyFOaXAmtNfjkMhCbWtm9dafjBj~ds86VZlRzDQvjKMZZThbbEP3gnsASiXFmf364rV~yaVQV9zMyte5PVRX0Q__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    3: 'https://s3-alpha-sig.figma.com/img/c580/c46a/f7ef97ed12da2aec3caaa5f192e1d87c?Expires=1698019200&Signature=UNb-9t8zp~R6~R~uWpO9uMP0TxuIzrTjGFc9pTFtcM~LYGcMWh9Ggwymo7BviF6QXKl5R4bTX2~iG5h0jj-GshkUnnTtBq3pfFryoMgGQFY0xS8ziEKVF4BTW2bwvab~zS3u5endUdFP1pY8kXSB2xwTJ2LH6ruDOcwLMJCCRyWZasZEVe10qc4AJM~eFyNTyThx6gvRKh0x1vh015reA6vYS2i9wsZFD104MDZjakphzNax-UvpAkVOGvn2117r8CSxhylDmdFlVQPI9bDpgYU1fdNv1ztxNVOwXm45ERi57gOrSOBHeED00spZkM9RMFSPJyts1YQIVwuttNTjZw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    4: 'https://s3-alpha-sig.figma.com/img/a274/497e/f2ca4aa2b23df32d2363b0c1776afef8?Expires=1698019200&Signature=H3GMwB2AsS0TF-eB1tKSFCScUpmckDNUbvxWdbzYK6np-8p9R1xLdbPW2RWrWNMvbil40Lg1lsdmhcymGydizpV4AzqI2RrrPNvO77GfC1atnsu2dkQd7tWGMiYNYsFLZd7wB6A6Gtq34yVHmiGUKWGhIMnA2zCt5x54VuxayQdG9N-ZNwW1byvQQpKEwShFNaJtwby3b7FIM95rbsh5oIGNUYbIFPEv090YmEGVs--k-d8GYGo9a1spo8LojHKvHctIlp5w2S7gFDyb6m6JqnqgCKMuCJ5a-jiq4Pl5N47mIJISM1va8NCp-CtrCjLP-pcLEOjph7w6ZrpkgYURdg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    // Add as many names and images as you want
  };

  return imageMap[names] ??
      'https://s3-alpha-sig.figma.com/img/1cc4/ad69/67b2634bd666e8439c57cba647f5b8d3?Expires=1698019200&Signature=BVC5oCWTuWDlvmkEl2DOzB7ckl9EZphch02e2S2JppPszhuDafTGE1N15zj6hm1my1uXS8PjcX1T2jYfQnpFRQO93UbeQ~y~AexktnfI~n9FppCWj54t-yjly65pF9cz80u2KHxhwumnc0huV365J81FWbEh-GOz3Ldc3VJ5WRv0JOh6p4nH8wLoSdPTAEkiAoXXmh1qxBWiAP5ijrx3eJtG6HYdxt05iNvgSpovsX8dPBhlehieODrNmV1vDpV1EyFOaXAmtNfjkMhCbWtm9dafjBj~ds86VZlRzDQvjKMZZThbbEP3gnsASiXFmf364rV~yaVQV9zMyte5PVRX0Q__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4';
}

double powercartamount(List<PowercartStruct>? cartitems) {
  double value = 0.0;
  for (var item in cartitems!) {
    double? parsedValue = double.parse(item.productamount.toString());
    if (parsedValue != null) {
      print(value);
      value = value + parsedValue;
      print(value);
    }
  }
  return value;
}

String? customimages(String names) {
  Map<String, String> imageMap = {
    'Monthly Test':
        'https://firebasestorage.googleapis.com/v0/b/itoproject-ae70d.appspot.com/o/cms_uploads%2FservicesImages%2F1698527931342000%2F20230904123020_%5Bfpdl%201.png?alt=media&token=4a9a565c-9660-4c28-b46c-0788ab865ce5',
    'Olympiad Exams':
        'https://firebasestorage.googleapis.com/v0/b/itoproject-ae70d.appspot.com/o/cms_uploads%2FservicesImages%2F1698528033502000%2F20230904111524_%5Bfpdl%201.png?alt=media&token=793a520c-296b-47f5-abed-5a32f8ceb364',
    'Previous Year Question Paper':
        'https://firebasestorage.googleapis.com/v0/b/itoproject-ae70d.appspot.com/o/cms_uploads%2FservicesImages%2F1698528058588000%2F20230904110740_%5Bfpdl%201.png?alt=media&token=5c398169-250a-4930-99b6-3a0d312ab659',
    // Add as many names and images as you want
  };
  return imageMap[names] ??
      'https://firebasestorage.googleapis.com/v0/b/itoproject-ae70d.appspot.com/o/cms_uploads%2FservicesImages%2F1698528095925000%2F20230904105719_%5Bfpdl%201.png?alt=media&token=106d648a-c36d-46e7-997c-d88db6af98b6';
}

String? returnserviceid(
  String serviceid,
  List<ServicesStruct> listofallservices,
) {
  // return service id from datastruct when a service slug is passed
  for (final service in listofallservices) {
    if (service.serviceSlug == serviceid) {
      return service.serviceId;
    }
  }
  return null;
}

String returnservicetype(
  String servicetype,
  List<ServicesStruct> listofallservices,
) {
  // write a function to return a service type
  for (var service in listofallservices) {
    if (service.serviceSlug == servicetype) {
      return service.serviceType;
    }
  }
  return 'service not found';
}

String returntestid(
  String testid,
  List<TestsStruct> alltest,
) {
  {
    for (var tests in alltest) {
      if (tests.testId == testid) {
        return tests.testId;
      }
    }
    return 'test not found'; // Return a default message if no match is found
  }
}

int index(int indexNo) {
  // write a function to increment a number by 1
  return indexNo + 1;
}

DateTime newCustomFunction(DateTime time) {
  // write a function to return a time after 15 minutes
  return time.add(Duration(minutes: 15));
}

List<dynamic> convertdatatypetopjson(List<AnswersStruct> datatype) {
  return datatype.map((answer) {
    return {
      "question_id": answer.question,
      "user_answer": answer.answer.toString()
    };
  }).toList();
}

String convertjsaontostring(dynamic valuee1) {
  // {"Computer":"11th Dec 2023"} return only "Computer" as string
  String valuee1String = valuee1.toString();
  // int endIndex = valuee1String.indexOf(':');
  // return valuee1String.substring(1, endIndex);
  return valuee1String;
}

List<dynamic> convertjsontorequired(dynamic jsonData) {
  // Assuming jsonData is already a decoded JSON object and not a String.
  var schedule = jsonData['monthlyExamsSchedule']['schedule'] as List<dynamic>;

  List<dynamic> transformedData = [];

  for (var entry in schedule) {
    String month = entry['Month'];
    Map<String, dynamic> tempEntry = Map<String, dynamic>.from(entry);
    tempEntry.remove(
        'Month'); // Remove the 'Month' key as we use it as a new key in our map

    List<Map<String, String>> exams = [];
    tempEntry.forEach((key, value) {
      exams.add({key: value});
    });

    transformedData.add({month: exams});
  }

  return transformedData;
}

int convertminutestomilliseconds(String value) {
  // convert minutes to milliseconds and return ms
  int minutes = int.parse(value);
  int milliseconds = minutes * 60 * 1000;
  return milliseconds + 7000;
}

DateTime? timeup(
  String? timer,
  DateTime? currentTime,
) {
  // write a function to return a time after adding a string which is minutes into a current time
  if (timer == null || currentTime == null) {
    return null;
  }
  final int minutes = int.tryParse(timer) ?? 0;
  final DateTime endTime = currentTime.subtract(Duration(minutes: minutes));
  return endTime;
}

double finalcartamountCopy(List<Round2cartStruct>? cartitems) {
  double value = 0.0;
  for (var item in cartitems!) {
    double? parsedValue = double.tryParse(item.productamount);
    if (parsedValue != null) {
      print(value);
      value = value + parsedValue;
      print(value);
    }
  }
  return value;
}

double powerdeliveryfee(List<PowercartStruct> cartlist) {
  int totalDeliverableItemCount = cartlist.length;
  // for (var item in cartlist) {
  //   // Safely convert deliverablecount to int
  //   int itemDeliverableCount = int.tryParse(item.deliverablecount ?? '') ?? 0;

  //   totalDeliverableItemCount += itemDeliverableCount;
  // }

  // Calculate delivery charge
  if (totalDeliverableItemCount == 0) {
    return 0.0;
  } else if (totalDeliverableItemCount > 0 && totalDeliverableItemCount <= 3) {
    return 70.0;
  } else if (totalDeliverableItemCount > 3 && totalDeliverableItemCount <= 6) {
    return 100.0;
  } else if (totalDeliverableItemCount > 6) {
    return 140.0;
  } else {
    return 0.0;
  }
}

double calculatetotalamount(
  String discountpercent,
  String amount,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // Write a function to get an amount after subtracting discount amount
  double discount = double.parse(discountpercent.toString()) /
      100.0; // Corrected the type to double and division
  double originalAmount =
      double.parse(amount.toString()); // Redundant, could directly use `amount`
  double discountedAmount = (originalAmount * discount);
  return double.parse(discountedAmount
      .round()
      .toString()); // Rounding to nearest integer if you still want to return an int
  /// MODIFY CODE ONLY ABOVE THIS LINE
}

double discountfee(List<Round2cartStruct>? cartitems) {
  double totalDiscount = 0.0;

  // Check for null cart items
  if (cartitems == null) return totalDiscount;

  for (var item in cartitems) {
    // Safely parse discount and product amounts with null checks
    double discountAmount = double.tryParse(item.discountamout ?? '0') ?? 0.0;
    double productAmount = double.tryParse(item.productamount ?? '0') ?? 0.0;

    // Calculate the discount difference
    double discountDifference = discountAmount - productAmount;

    // Accumulate the discount value
    totalDiscount += discountDifference;
  }

  return totalDiscount;
}

String discountedamount(
  String numOfListItems,
  String amount,
) {
  int items = int.parse(numOfListItems);
  double discountPercent = 0;
  switch (items) {
    case 1:
      discountPercent = 5;
      break;
    case 2:
      discountPercent = 10;
      break;
    case 3:
      discountPercent = 15;
      break;
    case 4:
      discountPercent = 20;
      break;
    default:
      discountPercent = 0; // No discount for more than 4 items or unspecified
  }

  // Calculate the discounted amount
  double originalAmount = double.parse(amount);
  double discount = discountPercent / 100;
  double discountedAmount = originalAmount - (originalAmount * discount);
  return discountedAmount.toStringAsFixed(2);
}

String yousaved(
  String discountpercent,
  String amount,
) {
  // write a fucntion to get a amount after subtracting discount amount
  double discount = double.parse(discountpercent) / 100;
  double originalAmount = double.parse(amount);
  double discountedAmount = (originalAmount * discount);
  return discountedAmount.toStringAsFixed(2);
}

int deliverablecount(List<Round2cartStruct>? cartitems) {
  int totalCount = 0;
  for (var item in cartitems!) {
    // Assuming 'deliverablecount' is a string that can be parsed into an int
    int? parsedCount = int.tryParse(item.deliverablecount);
    if (parsedCount != null) {
      totalCount += parsedCount;
    }
  }
  return totalCount;
}

double? addition(List<String> amount) {
  // write a function to add a numbers from list
  double sum = 0;
  for (String num in amount) {
    try {
      sum += double.parse(num);
    } catch (e) {
      return null;
    }
  }
  return sum;
}

double deliveryfee(List<Round2cartStruct> cartlist) {
  int total_deliverable_item_count = 0;
  for (var item in cartlist) {
    int? itemDeliverableCount = int.tryParse(item.deliverablecount);
    if (itemDeliverableCount != null) {
      total_deliverable_item_count += itemDeliverableCount;
    }
  }

  // Calculating delivery charge based on the total count of deliverable items
  double delivery_charge;
  if (total_deliverable_item_count == 0) {
    delivery_charge = 0.0;
  } else if (total_deliverable_item_count <= 3) {
    delivery_charge = 70.0;
  } else if (total_deliverable_item_count <= 6) {
    delivery_charge = 100.0;
  } else {
    delivery_charge = 140.0;
  }

  return delivery_charge;
}

String? serviceIdreturn(
  String serviceSlug,
  List<dynamic> jsonresponse,
) {
  if (jsonresponse.isNotEmpty) {
    var services = jsonresponse[0]['services'];
    for (var service in services.values) {
      if (service["service_slug"] == serviceSlug) {
        return service["service_id"].toString();
      }
    }
  }
  return null;
}

String sessionCode() {
  final math.Random _random = math.Random();
  const int length = 32; // Define the length of the string
  const String _availableChars = 'abcdef0123456789';
  return List.generate(length,
          (index) => _availableChars[_random.nextInt(_availableChars.length)])
      .join();
}

double getdelivery(List<CartitemsStruct> cartlist) {
  bool hasCertificate =
      cartlist.any((item) => item.producttypes == 'Certificate');
  if (hasCertificate) {
    return 70.0;
  }
  // only count item if producttype in cartvalues1 is "book" or else dont count the items
  int value = 0;
  for (var items in cartlist) {
    if (items.producttypes == 'book') {
      value = value + 1;
    }
  }
  if (value == 0) {
    return 0.0;
  } else if (value <= 3) {
    return 70.0;
  } else if (value <= 6) {
    return 100.0;
  } else {
    return 140.0;
  }
}

int getindexplus1(int value) {
  int value1 = value + 1;
  return value1;
}

double finalcartamount(List<CartitemsStruct>? cartitems) {
  double value = 0.0;
  for (var item in cartitems!) {
    double? parsedValue = double.tryParse(item.productamount);
    if (parsedValue != null) {
      value = value + parsedValue;
    }
  }
  return value;
}

double payableamount(
  double cartvalue,
  double deliveryfee,
) {
  double finalamount = cartvalue + deliveryfee;
  return finalamount;
}

List<int> convertint(List<String> values) {
  // convert list of strings to list of ints
  return values.map((value) => int.parse(value.toString())).toList();
}

String convertdoubletostring(double value) {
  return value.toStringAsFixed(2);
}

int convertstringtoint(String value) {
  return int.parse(value);
}

DateTime? dynamicEnd(
  String? timer,
  DateTime? currentTime,
) {
  // write a function to return a time after adding a string which is minutes into a current time
  if (timer == null || currentTime == null) {
    return null;
  }
  final int minutes = int.tryParse(timer) ?? 0;
  final DateTime endTime = currentTime.add(Duration(minutes: minutes));
  return endTime;
}

String removehyphen(String serviceslugspassed) {
  String stringWithoutHyphen = serviceslugspassed.replaceAll('-', ' ');

  // Capitalizing the first letter
  String capitalizedString =
      stringWithoutHyphen[0].toUpperCase() + stringWithoutHyphen.substring(1);

  print(capitalizedString);
  return capitalizedString; // This will print "Monthlytest"
}

DateTime addsec(String time) {
  // write a function to add 5 seconds in a date time format of  15 min time
  DateTime dateTime = DateFormat('mm').parse(time);
  dateTime = dateTime.add(Duration(seconds: 5));
  return dateTime;
}

List<String> mapImage(
  List<String> serviceId,
  List<String> serviceicons,
) {
  Map<String, String> serviceMap = Map.fromIterables(serviceId, serviceicons);
  List<String> images = [];

  for (String id in serviceId) {
    String? icon = serviceMap[id];
    if (icon != null) {
      images.add(icon);
    }
  }

  return images;
}

List<String> returnimage(List<String>? slug) {
  const Map<String, String?> allservices = {
    "monthly-test":
        "https://www.indiantalent.org/uploads/services/95d486f1f60d26684c6c19c7e3a3d61d.png",
    "annual-exam":
        "https://www.indiantalent.org/uploads/services/86d9089c43599e0b9ded62649f912124.png",
    "olympiad-books":
        "https://www.indiantalent.org/uploads/services/239593063d8e934d797cca6ca468f0b2.png",
    "previous-year-question-paper":
        "https://www.indiantalent.org/uploads/services/7efaa627cf8676c075f9249ede927696.png",
    "special-offer":
        "https://www.indiantalent.org/uploads/services/0ee4b103be59cb0421c64cb5253f622d.png",
    "online-study-material":
        "https://www.indiantalent.org/uploads/services/37741fb7b2dfa487aee28106bec4732c.png",
    "ebooks":
        "https://www.indiantalent.org/uploads/services/77f22806f5b5d5d3f6f9ac15b51c758c.png",
    "neet":
        "https://www.indiantalent.org/uploads/services/a4804be3dd77065df89f736b542a1335.png",
    "jee":
        "https://www.indiantalent.org/uploads/services/61d78426160c97e65f250320be0ea499.png",
    "neet-ebooks":
        "https://www.indiantalent.org/uploads/services/4a88e4b8bba8425e63f481cb9e0524ab.png",
    "jee-ebooks":
        "https://www.indiantalent.org/uploads/services/cde8c65eb33565ee69241c452f2954b5.png",
    "certificate": null,
    "summer-quiz-competition":
        "https://www.indiantalent.org/uploads/services/173fd154717c217979620ae461a54aec.png",
  };

  if (slug == null) {
    return [];
  }

  return slug.map((slug) => allservices[slug] ?? "notfound").toList();
}

String jsontostringlist(dynamic value) {
  // write a function to convert json to string
  String name = json.encode(value);
  return name.replaceAll('"', '');

  // return json.encode(value);
}

dynamic createJson(
  String merchantId,
  String merchantTransactionId,
  double amount,
  String merchantUserId,
  String redirectUrl,
  String redirectMode,
  String callbackUrl,
  String mobileNumber,
) {
  // create a json from given arguments and note that paymentinstrument have atype as enum
  return <String, Object>{
    "merchantId": merchantId,
    "merchantTransactionId": merchantTransactionId,
    "amount": amount,
    "merchantUserId": merchantUserId,
    "redirectUrl": redirectUrl,
    "redirectMode": redirectMode,
    "callbackUrl": callbackUrl,
    "mobileNumber": mobileNumber,
    "paymentInstrument": {"type": "PAY_PAGE"}
  };
}

String jsontobase64(dynamic jsonpassed) {
  // write a function to convert json to base64 encoded
  String jsonString = jsonEncode(jsonpassed);

  String base64String = base64.encode(utf8.encode(jsonString));
  return base64String;
}

String transactionid() {
  // generate a random string Starting with ITO with number in middle and end with small letter
  String temp = math.Random().nextInt(1000000000).toString();
  return "ITO" + temp;
}

double rupeestopaisa(double amount) {
  // write a function to convert rupees in paisa
  return amount * 100;
}

List<String> jsontoStringList(List<dynamic> values) {
  // write a function to convert list of json into list of string
  List<String> stringList = [];
  for (var value in values) {
    stringList.add(jsonEncode(value));
  }
  return stringList;
}

String discountamount(
  String discountpercent,
  String amount,
) {
  // write a fucntion to get a amount after subtracting discount amount
  double discount = double.parse(discountpercent) / 100;
  double originalAmount = double.parse(amount);
  double discountedAmount = originalAmount - (originalAmount * discount);
  return discountedAmount.toStringAsFixed(2);
}

String removeqoutation(String value) {
  // to remove quatation
  return value.replaceAll('"', '');
}

String getServiceId(
  String serviceSlug,
  List<dynamic> listOfServices,
) {
  // write a function to get a serviceId from a service slug
  for (var service in listOfServices) {
    if (service['service_slug'] == serviceSlug) {
      return service['service_id'];
    }
  }
  return '';
}

double doubletoString(String values) {
  // string to double
  return double.parse(values);
}

String? addlist(List<String> values) {
  // add numbers in a list
  int sum = 0;
  for (var value in values) {
    try {
      sum += int.parse(value);
    } catch (e) {
      return null;
    }
  }
  return sum.toString();
}

double? minusdiscountamount(
  double totalAmount,
  double savedAmount,
) {
  double finalamount = totalAmount - savedAmount;
  return finalamount;
}

int? stringToInt(String value) {
  // write a fucntion to convert string to int
  try {
    return int.parse(value);
  } catch (e) {
    return null;
  }
}

double subtract(
  double finalcartamount,
  double minimumpurchaseamount,
) {
  // write a function to subtract
  return finalcartamount - minimumpurchaseamount;
}

String? notificationtime(DateTime? createdtime) {
  // write a function to get a time in hours ago by substracting it from current time
  if (createdtime == null) return null;

  final now = DateTime.now();

  final difference = now.difference(createdtime);

  if (difference.inSeconds < 60) {
    return 'just now';
  } else if (difference.inMinutes < 60) {
    final minutes = difference.inMinutes;
    return '$minutes ${minutes == 1 ? 'minute' : 'minutes'} ago';
  } else if (difference.inHours < 24) {
    final hours = difference.inHours;
    return '$hours ${hours == 1 ? 'hour' : 'hours'} ago';
  } else {
    final formatter = DateFormat('MMM d, yyyy');
    return formatter.format(createdtime);
  }
}

DateTime? jsontoTime(String? timevalue) {
  // write a function to convert string to date time
  if (timevalue == null) {
    return null;
  }
  final parsedDate = DateTime.tryParse(timevalue);
  if (parsedDate != null) {
    return parsedDate;
  }
  final parsedTimestamp = int.tryParse(timevalue);
  if (parsedTimestamp != null) {
    return DateTime.fromMillisecondsSinceEpoch(parsedTimestamp);
  }
  return null;
}

int percent(int noofProducts) {
  int discountPercent = 0;
  switch (noofProducts) {
    case 1:
      discountPercent = 5;
      break;
    case 2:
      discountPercent = 10;
      break;
    case 3:
      discountPercent = 15;
      break;
    case 4:
      discountPercent = 20;
      break;
    default:
      discountPercent = 0;
  }
  return discountPercent;
}

double grandtotal(
  String cartValue,
  String saved,
  String deliverycharges,
) {
  print("cart value $cartValue");
  print("Saved $saved");
  print("Delivery cgarde $deliverycharges");
  // If cartValue is null, final amount must be 0
  if (double.parse(cartValue.toString()) == null ||
      double.parse(cartValue.toString()) == 0) return 0;

  // saved and deliveryCharges — treat null as 0
  final double s = double.parse(saved.toString()) ?? 0;
  final double d = double.parse(deliverycharges.toString()) ?? 0;

  double finalAmount = (double.parse(cartValue.toString()) - s) + d;
  return finalAmount;
}

List<String> anualexamdynamicslot(dynamic anualexamdata) {
  List<String> result = [];

  if (anualexamdata == null ||
      anualexamdata['annualExamSchedule'] == null ||
      anualexamdata['annualExamSchedule'] is! Map) {
    return result;
  }

  final schedule = anualexamdata['annualExamSchedule'] as Map;

  final regex = RegExp(r'Slot\s+(\d+)');

  // Extract slots with their number
  final slotList = <int, String>{};

  schedule.keys.forEach((key) {
    final match = regex.firstMatch(key);
    if (match != null) {
      int number = int.parse(match.group(1)!); // extract slot number
      slotList[number] = "Slot $number";
    }
  });

  // Sort by slot number
  final sortedKeys = slotList.keys.toList()..sort();

  // Create final sorted list
  for (var k in sortedKeys) {
    result.add(slotList[k]!);
  }

  return result;
}

List<dynamic> homeservice(
  List<dynamic>? allservice,
  List<String>? requiredservices,
) {
  if (allservice == null || requiredservices == null) {
    return [];
  }

  // Convert to lowercase set
  final requiredSet =
      requiredservices.map((e) => e.toLowerCase().trim()).toSet();

  final filtered = allservice.where((service) {
    final slug = service['service_slug']?.toString().toLowerCase().trim() ?? '';
    final name = service['service_name']?.toString().toLowerCase().trim() ?? '';

    // Skip Certificate
    if (name == 'certificate') return false;

    // Required list contains SLUG but we match using service_name
    return requiredSet.contains(slug) || requiredSet.contains(name);
  }).toList();

  return filtered;
}

bool monthlyexamcheck(String serviceTitle) {
  if (serviceTitle == "Monthly Test" ||
      serviceTitle == "NEET" ||
      serviceTitle == "JEE" ||
      serviceTitle == "Summer Quiz Competition") {
    return true;
  } else {
    return false;
  }
}

bool specialoffercheck(String serviceTitle) {
  if (serviceTitle == "Special Offer") {
    return true;
  } else {
    return false;
  }
}

bool anualexamandspecialstudymaterialcheck(String serviceTitle) {
  if (serviceTitle == "Annual Exam" ||
      serviceTitle == "Online Study Material") {
    return true;
  } else {
    return false;
  }
}

String filterserviceimageurl(
  dynamic allservicedata,
  String servicename,
) {
  if (allservicedata == null ||
      allservicedata["services"] == null ||
      allservicedata["services"].isEmpty) {
    return "";
  }

  final services = allservicedata["services"];

  // Normalize the incoming servicename
  String normalizedInput =
      servicename.toLowerCase().replaceAll(" ", "").replaceAll("-", "");

  for (var item in services.values) {
    if (item is Map) {
      String slug = item["service_slug"]?.toString() ?? "";

      // Normalize slug
      String normalizedSlug =
          slug.toLowerCase().replaceAll(" ", "").replaceAll("-", "");

      if (normalizedSlug == normalizedInput) {
        return item["service_icon"]?.toString() ?? "";
      }
    }
  }

  return "";
}

String totalnotification(
  int importentnotificationlengh,
  int nomarmalnotificationlength,
) {
  return (importentnotificationlengh + nomarmalnotificationlength).toString();
}

bool checkvertion(
  String backendvertion,
  String currentappversion,
) {
  List<int> backendParts = backendvertion.split('.').map(int.parse).toList();
  List<int> currentParts = currentappversion.split('.').map(int.parse).toList();

  int maxLength = backendParts.length > currentParts.length
      ? backendParts.length
      : currentParts.length;

  // Pad shorter list with zeros
  while (backendParts.length < maxLength) backendParts.add(0);
  while (currentParts.length < maxLength) currentParts.add(0);

  for (int i = 0; i < maxLength; i++) {
    if (currentParts[i] > backendParts[i]) {
      return true; // current version is greater
    } else if (currentParts[i] < backendParts[i]) {
      return false; // current version is lower
    }
  }

  return true; // versions are equal
}
