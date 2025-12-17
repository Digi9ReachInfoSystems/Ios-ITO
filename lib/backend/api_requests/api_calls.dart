import 'dart:convert';
import '../cloud_functions/cloud_functions.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCallNew';

/// Start OlympiadX Group Code

class OlympiadXGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
      'https://www.olympiadx.com';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static ViewprofilexCall viewprofilexCall = ViewprofilexCall();
  static GetallproductsxCall getallproductsxCall = GetallproductsxCall();
  static EditProfilexCall editProfilexCall = EditProfilexCall();
  static SubscriptionsxCall subscriptionsxCall = SubscriptionsxCall();
  static OrderprrxCall orderprrxCall = OrderprrxCall();
  static SubjectxCall subjectxCall = SubjectxCall();
  static TestsxCall testsxCall = TestsxCall();
  static GetQuestionxCall getQuestionxCall = GetQuestionxCall();
  static SlotsxCall slotsxCall = SlotsxCall();
  static OrdersssxCall ordersssxCall = OrdersssxCall();
  static SchedulexCall schedulexCall = SchedulexCall();
  static GetUsersxCall getUsersxCall = GetUsersxCall();
  static SubmitanswerstobackendxCall submitanswerstobackendxCall =
      SubmitanswerstobackendxCall();
  static NoticesxCall noticesxCall = NoticesxCall();
  static ProductsxCall productsxCall = ProductsxCall();
  static ProductsSubscriptionxCall productsSubscriptionxCall =
      ProductsSubscriptionxCall();
  static TestingexamxCall testingexamxCall = TestingexamxCall();
  static ResultsxCall resultsxCall = ResultsxCall();
  static RoundregistrationxCall roundregistrationxCall =
      RoundregistrationxCall();
  static SubmitregistrationxCall submitregistrationxCall =
      SubmitregistrationxCall();
  static PhonecallbackxCall phonecallbackxCall = PhonecallbackxCall();
  static StatusCheckxCall statusCheckxCall = StatusCheckxCall();
  static SummerQuizxCall summerQuizxCall = SummerQuizxCall();
  static MonthlyResultsxCall monthlyResultsxCall = MonthlyResultsxCall();
  static RoundresultsxCall roundresultsxCall = RoundresultsxCall();
  static ViewCertificatesxCall viewCertificatesxCall = ViewCertificatesxCall();
  static PowerPackagesxCall powerPackagesxCall = PowerPackagesxCall();
  static BannersxCall bannersxCall = BannersxCall();
  static NotificationsxCall notificationsxCall = NotificationsxCall();
  static GetquestionsoxxCall getquestionsoxxCall = GetquestionsoxxCall();
  static SubmissionxCall submissionxCall = SubmissionxCall();
}

class ViewprofilexCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = OlympiadXGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'viewprofilex',
      apiUrl: '${baseUrl}/RESTapi/student/profile/index',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetallproductsxCall {
  Future<ApiCallResponse> call({
    String? stdId = '',
    String? token = '',
  }) async {
    final baseUrl = OlympiadXGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "std_id": "${escapeStringForJson(stdId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getallproductsx',
      apiUrl: '${baseUrl}/RESTapi/student/products/fetch_products_and_coupons',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EditProfilexCall {
  Future<ApiCallResponse> call({
    String? studentName = '',
    String? parentName = '',
    String? address = '',
    String? district = '',
    String? state = '',
    String? city = '',
    String? pinCode = '',
    String? schoolName = '',
    String? schoolState = '',
    String? schoolAddress = '',
    String? schoolCity = '',
    String? schoolPincode = '',
    String? userName = '',
    String? token = '',
  }) async {
    final baseUrl = OlympiadXGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "student_name": "${escapeStringForJson(studentName)}",
  "parent_name": "${escapeStringForJson(parentName)}",
  "address": "${escapeStringForJson(address)}",
  "district": "${escapeStringForJson(district)}",
  "state": "${escapeStringForJson(state)}",
  "city": "${escapeStringForJson(city)}",
  "pin_code": "${escapeStringForJson(pinCode)}",
  "school_name": "${escapeStringForJson(schoolName)}",
  "school_state": "${escapeStringForJson(schoolState)}",
  "school_address": "${escapeStringForJson(schoolAddress)}",
  "school_city": "${escapeStringForJson(schoolCity)}",
  "school_pin_code": "${escapeStringForJson(schoolPincode)}",
  "username": "${escapeStringForJson(userName)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'editProfilex',
      apiUrl: '${baseUrl}/RESTapi/student/profile/index',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SubscriptionsxCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = OlympiadXGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'subscriptionsx',
      apiUrl: '${baseUrl}/RESTapi/student/profile/subscriptions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class OrderprrxCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = OlympiadXGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'orderprrx',
      apiUrl: '${baseUrl}/RESTapi/student/profile/orders',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SubjectxCall {
  Future<ApiCallResponse> call({
    String? stdId = '',
    String? userId = '',
    String? serviceId = '',
    String? token = '',
  }) async {
    final baseUrl = OlympiadXGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "std_id": "${escapeStringForJson(stdId)}",
  "user_id": "${escapeStringForJson(userId)}",
  "service_id": "${escapeStringForJson(serviceId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'subjectx',
      apiUrl: '${baseUrl}/RESTapi/student/exam/index',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TestsxCall {
  Future<ApiCallResponse> call({
    String? subjectId = '',
    String? round = '',
    String? stdId = '',
    String? userId = '',
    String? serviceId = '',
    String? token = '',
  }) async {
    final baseUrl = OlympiadXGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
"subject_id": "${escapeStringForJson(subjectId)}",
  "round": "${escapeStringForJson(round)}",
  "std_id": "${escapeStringForJson(stdId)}",
  "user_id": "${escapeStringForJson(userId)}",
  "service_id": "${escapeStringForJson(serviceId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'testsx',
      apiUrl: '${baseUrl}/RESTapi/student/exam/get_tests',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetQuestionxCall {
  Future<ApiCallResponse> call({
    String? testId = '',
    String? userId = '',
    String? token = '',
  }) async {
    final baseUrl = OlympiadXGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
"test_id": "${escapeStringForJson(testId)}",
  "user_id": "${escapeStringForJson(userId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getQuestionx',
      apiUrl: '${baseUrl}/RESTapi/student/exam/get_questions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SlotsxCall {
  Future<ApiCallResponse> call({
    String? slot = '',
    String? userId = '',
    String? token = '',
  }) async {
    final baseUrl = OlympiadXGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
"slot": "${escapeStringForJson(slot)}",
  "user_id": "${escapeStringForJson(userId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'slotsx',
      apiUrl: '${baseUrl}/RESTapi/student/exam/set_annual_slot',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class OrdersssxCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = OlympiadXGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'ordersssx',
      apiUrl: '${baseUrl}/RESTapi/student/profile/orders',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SchedulexCall {
  Future<ApiCallResponse> call({
    String? stdId = '',
    String? serviceId = '',
    String? token = '',
  }) async {
    final baseUrl = OlympiadXGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
"std_id": "${escapeStringForJson(stdId)}",
  "service_id": "${escapeStringForJson(serviceId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'schedulex',
      apiUrl: '${baseUrl}/RESTapi/student/profile/schedule',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUsersxCall {
  Future<ApiCallResponse> call({
    String? testId = '',
    String? attempted = '',
    String? userId = '',
    String? takenTime = '',
    String? sessionId = '',
    String? questionId = '',
    String? userAnswer = '',
    dynamic userAnswersJson,
    String? token = '',
  }) async {
    final baseUrl = OlympiadXGroup.getBaseUrl(
      token: token,
    );

    final userAnswers = _serializeJson(userAnswersJson, true);
    final ffApiRequestBody = '''
{
  "test_id": "${escapeStringForJson(testId)}",
  "attempted_questions": "${escapeStringForJson(attempted)}",
  "user_id": "${escapeStringForJson(userId)}",
  "taken_time": "${escapeStringForJson(takenTime)}",
  "session_id": "${escapeStringForJson(sessionId)}",
  "user_answers": [    {
      "question_id": "${escapeStringForJson(questionId)}",
      "user_answer": "${escapeStringForJson(userAnswer)}"
    },
    {
      "question_id": "${escapeStringForJson(questionId)}",
      "user_answer": "${escapeStringForJson(userAnswer)}"
    },
    {
      "question_id": "${escapeStringForJson(questionId)}",
      "user_answer": "${escapeStringForJson(userAnswer)}"
    },
    {
      "question_id": "${escapeStringForJson(questionId)}",
      "user_answer": "${escapeStringForJson(userAnswer)}"
    },
    {
      "question_id": "${escapeStringForJson(questionId)}",
      "user_answer": "${escapeStringForJson(userAnswer)}"
    },
    {
      "question_id": "${escapeStringForJson(questionId)}",
      "user_answer": "${escapeStringForJson(userAnswer)}"
    },
    {
      "question_id": "${escapeStringForJson(questionId)}",
      "user_answer": "${escapeStringForJson(userAnswer)}"
    },
    {
      "question_id": "${escapeStringForJson(questionId)}",
      "user_answer": "${escapeStringForJson(userAnswer)}"
    },
    {
      "question_id": "${escapeStringForJson(questionId)}",
      "user_answer": "${escapeStringForJson(userAnswer)}"
    },
    {
      "question_id": "${escapeStringForJson(questionId)}",
      "user_answer": "${escapeStringForJson(userAnswer)}"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getUsersx',
      apiUrl: '${baseUrl}/RESTapi/student/exam/exam_response',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SubmitanswerstobackendxCall {
  Future<ApiCallResponse> call({
    String? testId = '',
    String? attemptedQuestions = '',
    String? userId = '',
    String? takenTime = '',
    String? sessionId = '',
    dynamic userAnswersJson,
    String? token = '',
  }) async {
    final baseUrl = OlympiadXGroup.getBaseUrl(
      token: token,
    );

    final userAnswers = _serializeJson(userAnswersJson, true);
    final ffApiRequestBody = '''

{
  "test_id": "${escapeStringForJson(testId)}",
  "attempted_questions": "${escapeStringForJson(attemptedQuestions)}",
  "user_id": "${escapeStringForJson(userId)}",
  "taken_time": "${escapeStringForJson(takenTime)}",
  "session_id": "${escapeStringForJson(sessionId)}",
  "user_answers": ${userAnswers}
}
''';
    return ApiManager.instance.makeApiCall(
      callName: 'Submitanswerstobackendx',
      apiUrl: '${baseUrl}/RESTapi/student/exam/exam_response',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class NoticesxCall {
  Future<ApiCallResponse> call({
    String? stdId = '',
    String? token = '',
  }) async {
    final baseUrl = OlympiadXGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
 "std_id": "${escapeStringForJson(stdId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'noticesx',
      apiUrl: '${baseUrl}/RESTapi/student/profile/notices',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ProductsxCall {
  Future<ApiCallResponse> call({
    String? stdId = '',
    String? token = '',
  }) async {
    final baseUrl = OlympiadXGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
"std_id": "${escapeStringForJson(stdId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'productsx',
      apiUrl: '${baseUrl}/RESTapi/student/products/fetch_products',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ProductsSubscriptionxCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    List<String>? productsList,
    String? payableAmount = '',
    String? deliveryCharge = '',
    String? powerpackid = '',
    String? purchaseType = '',
    List<int>? comboIdList,
    String? token = '',
  }) async {
    final baseUrl = OlympiadXGroup.getBaseUrl(
      token: token,
    );
    final products = _serializeList(productsList);
    final comboId = _serializeList(comboIdList);

    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userId)}",
"products":${products},
"payment_data":{
  "payment_gateway": "ccavenue",
        "currency": "INR",
 "delivery_charge": "${escapeStringForJson(deliveryCharge)}",
        "payable_amount": "${escapeStringForJson(payableAmount)}", 
        "discount_amount": "0",
        "coupon_code": "NULL",
        "purchase_type" : "individual" ,
"power_pack_id":"${escapeStringForJson(powerpackid)}",
 "purchase_type" :"${escapeStringForJson(purchaseType)}",
 
 "combo_id":"${comboId}"
}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'products Subscriptionx',
      apiUrl: '${baseUrl}/RESTapi/student/register/get_selected_products',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TestingexamxCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? token = '',
  }) async {
    final baseUrl = OlympiadXGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'testingexamx',
      apiUrl: '${baseUrl}/RESTapi/student/exam/resultData',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'user_id': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ResultsxCall {
  Future<ApiCallResponse> call({
    String? mobile = '',
    String? token = '',
  }) async {
    final baseUrl = OlympiadXGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
"mobile": "${escapeStringForJson(mobile)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'resultsx',
      apiUrl: '${baseUrl}/RESTapi/student/Result',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RoundregistrationxCall {
  Future<ApiCallResponse> call({
    String? mobileNo = '',
    String? userId = '',
    String? stdId = '',
    String? token = '',
  }) async {
    final baseUrl = OlympiadXGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "mobile": "${escapeStringForJson(mobileNo)}",
  "user_id": "${escapeStringForJson(userId)}",
 
  "standard": "${escapeStringForJson(stdId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'roundregistrationx',
      apiUrl: '${baseUrl}/RESTapi/student/products/fetch_round_two_combos',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SubmitregistrationxCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    List<String>? comboIdList,
    List<String>? certificatesList,
    String? payment = '',
    String? slug = '',
    String? totaldiscount = '',
    String? finalamount = '',
    String? deliverycharges = '',
    int? isUpdated,
    String? token = '',
  }) async {
    final baseUrl = OlympiadXGroup.getBaseUrl(
      token: token,
    );
    final comboId = _serializeList(comboIdList);
    final certificates = _serializeList(certificatesList);

    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userid)}",
  "selected_combo_ids": ${comboId},
  "selected_certificates": ${certificates},
  "payment_gateway": "${escapeStringForJson(payment)}",
  "slug": "${escapeStringForJson(slug)}",
  "total_discount": "${escapeStringForJson(totaldiscount)}",
  "final_total_amount": "${escapeStringForJson(finalamount)}",
"isUpdated":${isUpdated},
  "delivery_charges_applied": "${escapeStringForJson(deliverycharges)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'submitregistrationx',
      apiUrl: '${baseUrl}/RESTapi/student/Register/round_two',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PhonecallbackxCall {
  Future<ApiCallResponse> call({
    bool? success,
    String? code = '',
    String? message = '',
    dynamic dataJson,
    String? orderId = '',
    String? token = '',
  }) async {
    final baseUrl = OlympiadXGroup.getBaseUrl(
      token: token,
    );

    final data = _serializeJson(dataJson);

    return ApiManager.instance.makeApiCall(
      callName: 'phonecallbackx',
      apiUrl: '${baseUrl}/RESTapi/student/payment/Phonepe_callback',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'success': success,
        'code': code,
        'message': message,
        'data': data,
        'order_id': orderId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class StatusCheckxCall {
  Future<ApiCallResponse> call({
    String? trancastionid = '',
    String? token = '',
  }) async {
    final baseUrl = OlympiadXGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
"merchantTransactionId": "${escapeStringForJson(trancastionid)}"

}''';
    return ApiManager.instance.makeApiCall(
      callName: 'statusCheckx',
      apiUrl: '${baseUrl}/RESTapi/student/payment/check_payment_status',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SummerQuizxCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? token = '',
  }) async {
    final baseUrl = OlympiadXGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
 "user_id": "${escapeStringForJson(userId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'summerQuizx',
      apiUrl:
          '${baseUrl}/RESTapi/student/Products/summer_quiz_product_and_coupons',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class MonthlyResultsxCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? subjectId = '',
    String? stdId = '',
    String? token = '',
  }) async {
    final baseUrl = OlympiadXGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
 "user_id": "${escapeStringForJson(userId)}",
  "subject_id": "${escapeStringForJson(subjectId)}",
  "std_id": "${escapeStringForJson(stdId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'monthlyResultsx',
      apiUrl: '${baseUrl}/RESTapi/student/exam/test_attempts',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RoundresultsxCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? token = '',
  }) async {
    final baseUrl = OlympiadXGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
"user_id": "${escapeStringForJson(userId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'roundresultsx',
      apiUrl: '${baseUrl}/RESTapi/student/result/get_round_2_results',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ViewCertificatesxCall {
  Future<ApiCallResponse> call({
    String? resultId = '',
    String? userId = '',
    String? token = '',
  }) async {
    final baseUrl = OlympiadXGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
 "result_id": "${escapeStringForJson(resultId)}",
  "user_id": "${escapeStringForJson(userId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'viewCertificatesx',
      apiUrl: '${baseUrl}/RESTapi/student/exam/view_certificate',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PowerPackagesxCall {
  Future<ApiCallResponse> call({
    String? stdId = '',
    String? token = '',
  }) async {
    final baseUrl = OlympiadXGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
"std_id": "${escapeStringForJson(stdId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'powerPackagesx',
      apiUrl: '${baseUrl}/RESTapi/student/products/fetch_packages',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BannersxCall {
  Future<ApiCallResponse> call({
    String? stdId = '',
    String? displayFor = '',
    String? token = '',
  }) async {
    final baseUrl = OlympiadXGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
 "std_id": "${escapeStringForJson(stdId)}",
  "display_for": "${escapeStringForJson(displayFor)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'bannersx',
      apiUrl: '${baseUrl}/RESTapi/student/profile/banners',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class NotificationsxCall {
  Future<ApiCallResponse> call({
    String? stdId = '',
    String? displayFor = '',
    String? token = '',
  }) async {
    final baseUrl = OlympiadXGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "std_id": "${escapeStringForJson(stdId)}",
  "display_for": "${escapeStringForJson(displayFor)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'notificationsx',
      apiUrl: '${baseUrl}/RESTapi/student/profile/announcements',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetquestionsoxxCall {
  Future<ApiCallResponse> call({
    String? testId = '',
    String? userId = '',
    String? token = '',
  }) async {
    final baseUrl = OlympiadXGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "test_id": "${escapeStringForJson(testId)}",
  "user_id": "${escapeStringForJson(userId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getquestionsoxx',
      apiUrl: '${baseUrl}/RESTapi/student/exam/get_questions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SubmissionxCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? token = '',
  }) async {
    final baseUrl = OlympiadXGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'submissionx',
      apiUrl: '${baseUrl}/RESTapi/student/exam/check_submission',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End OlympiadX Group Code

class LoginOutsideCall {
  static Future<ApiCallResponse> call({
    String? mobile = '',
    String? password = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'LoginOutsideCall',
        'variables': {
          'mobile': mobile,
          'password': password,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? studentName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.session_data.student_name''',
      ));
  static String? parentName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.session_data.parent_name''',
      ));
  static String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.session_data.user_id''',
      ));
  static String? parentEmail(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.session_data.parent_email''',
      ));
  static String? stdId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.session_data.std_id''',
      ));
  static int? oldId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.session_data.old_std_id''',
      ));
  static int? updatedStd(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.session_data.std_updated''',
      ));
  static String? mobileNo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.session_data.mobile''',
      ));
  static String? academicyear(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.session_data.academic_year''',
      ));
  static List<String>? allowedServices(dynamic response) => (getJsonField(
        response,
        r'''$.session_data.allowed_services''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? schoolName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.session_data.school_name''',
      ));
  static bool? result(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.session_data.authenticated_result''',
      ));
  static int? showResult(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.session_data.show_results_of_round''',
      ));
  static String? username(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.session_data.username''',
      ));
  static String? address(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.session_data.address''',
      ));
  static String? district(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.session_data.district''',
      ));
  static String? state(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.session_data.state''',
      ));
  static String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.session_data.city''',
      ));
  static String? pincode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.session_data.pin_code''',
      ));
  static String? schooladdres(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.session_data.school_address''',
      ));
  static String? schoolCity(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.session_data.school_city''',
      ));
  static String? schoolpincode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.session_data.school_pin_code''',
      ));
  static String? schoolstate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.session_data.school_state''',
      ));
  static String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token.firebase_token''',
      ));
}

class ForgetPasswordCall {
  static Future<ApiCallResponse> call({
    String? mobile = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ForgetPasswordCall',
        'variables': {
          'mobile': mobile,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic mobile(dynamic response) => getJsonField(
        response,
        r'''$.mobile''',
      );
}

class VerifyOtpPhoneCall {
  static Future<ApiCallResponse> call({
    String? otp = '',
    String? token = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'VerifyOtpPhoneCall',
        'variables': {
          'otp': otp,
          'token': token,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class RegiterCall {
  static Future<ApiCallResponse> call({
    String? studentName = '',
    String? parentName = '',
    String? parentEmail = '',
    String? mobile = '',
    String? address = '',
    String? schoolName = '',
    String? state = '',
    String? city = '',
    String? password = '',
    String? confirmPassword = '',
    int? stdId,
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'RegiterCall',
        'variables': {
          'studentName': studentName,
          'parentName': parentName,
          'parentEmail': parentEmail,
          'mobile': mobile,
          'address': address,
          'schoolName': schoolName,
          'state': state,
          'city': city,
          'password': password,
          'confirmPassword': confirmPassword,
          'stdId': stdId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static dynamic userId(dynamic response) => getJsonField(
        response,
        r'''$.user_id''',
      );
  static String? error(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error''',
      ));
}

class ResetpasswordCall {
  static Future<ApiCallResponse> call({
    String? password = '',
    String? confirmPassword = '',
    String? mobile = '',
    String? otp = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ResetpasswordCall',
        'variables': {
          'password': password,
          'confirmPassword': confirmPassword,
          'mobile': mobile,
          'otp': otp,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GetAllProductsCall {
  static Future<ApiCallResponse> call({
    String? std = '',
    String? token = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetAllProductsCall',
        'variables': {
          'std': std,
          'token': token,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static List? products(dynamic response) => getJsonField(
        response,
        r'''$.data.allProducts''',
        true,
      ) as List?;
  static List? monthsThree(dynamic response) => getJsonField(
        response,
        r'''$.data.allProducts[?(@.duration == '90')].products[*]''',
        true,
      ) as List?;
  static List? sixMonths(dynamic response) => getJsonField(
        response,
        r'''$.data.allProducts[?(@.duration == '182')].products[*]''',
        true,
      ) as List?;
  static List? oneYear(dynamic response) => getJsonField(
        response,
        r'''$.data.allProducts[?(@.serviceName == 'Monthly Test' && @.duration == '365')].products[*]''',
        true,
      ) as List?;
  static List? productsExcept(dynamic response) => getJsonField(
        response,
        r'''$.data.allProducts[?(@.serviceName != 'Monthly Test')]''',
        true,
      ) as List?;
  static List? coupons(dynamic response) => getJsonField(
        response,
        r'''$.data.coupons.*.*''',
        true,
      ) as List?;
}

class EditprofileCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? studentName = '',
    String? parentName = '',
    String? address = '',
    String? district = '',
    String? state = '',
    String? city = '',
    String? pinCode = '',
    String? schoolName = '',
    String? schoolState = '',
    String? schoolAddress = '',
    String? schoolCity = '',
    String? schoolPincode = '',
    String? userName = '',
    String? tokennew = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'EditprofileCall',
        'variables': {
          'token': token,
          'studentName': studentName,
          'parentName': parentName,
          'address': address,
          'district': district,
          'state': state,
          'city': city,
          'pinCode': pinCode,
          'schoolName': schoolName,
          'schoolState': schoolState,
          'schoolAddress': schoolAddress,
          'schoolCity': schoolCity,
          'schoolPincode': schoolPincode,
          'userName': userName,
          'tokennew': tokennew,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class SubcsriptionsCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? stdId = '',
    String? token = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SubcsriptionsCall',
        'variables': {
          'userId': userId,
          'stdId': stdId,
          'token': token,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static List? subscriptions(dynamic response) => getJsonField(
        response,
        r'''$.subscriptions.*''',
        true,
      ) as List?;
  static List? monthlyOlypiad(dynamic response) => getJsonField(
        response,
        r'''$.subscriptions["Monthly Olympiad"][*]''',
        true,
      ) as List?;
  static List? annualOlympiad(dynamic response) => getJsonField(
        response,
        r'''$.subscriptions["Annual Olympiad"][*]''',
        true,
      ) as List?;
  static List? ecopy(dynamic response) => getJsonField(
        response,
        r'''$.subscriptions["E-copy"].*''',
        true,
      ) as List?;
  static List<String>? purchase(dynamic response) => (getJsonField(
        response,
        r'''$.subscriptions["Monthly Olympiad"][*].purchase''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? expiry(dynamic response) => (getJsonField(
        response,
        r'''$.subscriptions["Monthly Olympiad"][*].expiry''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? onlysubs(dynamic response) => getJsonField(
        response,
        r'''$.subscriptions''',
        true,
      ) as List?;
  static List<String>? servicename(dynamic response) => (getJsonField(
        response,
        r'''$.subscriptions[:].serviceName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? products(dynamic response) => getJsonField(
        response,
        r'''$.subscriptions[:].products.*''',
        true,
      ) as List?;
}

class OrderprCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? token = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'OrderprCall',
        'variables': {
          'userId': userId,
          'token': token,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GetServicesCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetServicesCall',
        'variables': {
          'token': token,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static List? services(dynamic response) => getJsonField(
        response,
        r'''$.services.*''',
        true,
      ) as List?;
  static List? serviceName(dynamic response) => getJsonField(
        response,
        r'''$.services.*''',
        true,
      ) as List?;
  static List<String>? serviceType(dynamic response) => (getJsonField(
        response,
        r'''$.services.*.service_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? serviceId(dynamic response) => (getJsonField(
        response,
        r'''$.services.*.service_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? serviceSlug(dynamic response) => (getJsonField(
        response,
        r'''$.services.*.service_slug''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? icons(dynamic response) => (getJsonField(
        response,
        r'''$.services.*.service_icon''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class SubjectsCall {
  static Future<ApiCallResponse> call({
    String? stdId = '',
    String? userId = '',
    String? serviceId = '',
    String? token = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SubjectsCall',
        'variables': {
          'stdId': stdId,
          'userId': userId,
          'serviceId': serviceId,
          'token': token,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? stdId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.std_id''',
      ));
  static String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_id''',
      ));
  static String? serviceId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.service_id''',
      ));
  static List? productsByservice(dynamic response) => getJsonField(
        response,
        r'''$.products_by_service.*''',
        true,
      ) as List?;
  static List<String>? productsById(dynamic response) => (getJsonField(
        response,
        r'''$.products_by_service.*.id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? productsBytitle(dynamic response) => (getJsonField(
        response,
        r'''$.products_by_service.*.title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? productsbySubjectId(dynamic response) => (getJsonField(
        response,
        r'''$.products_by_service.*.subject_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? productsbyDurations(dynamic response) => (getJsonField(
        response,
        r'''$.products_by_service.*.duration''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? productsbystd(dynamic response) => (getJsonField(
        response,
        r'''$.products_by_service.*.std''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? productsbyType(dynamic response) => (getJsonField(
        response,
        r'''$.products_by_service.*.service_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? productsbyserviceId(dynamic response) => (getJsonField(
        response,
        r'''$.products_by_service.*.service_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? productsbyround(dynamic response) => (getJsonField(
        response,
        r'''$.products_by_service.*.round''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? productsAmount(dynamic response) => (getJsonField(
        response,
        r'''$.products_by_service.*.amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? resultamount(dynamic response) => (getJsonField(
        response,
        r'''$.products_by_service.*.result_amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? productsUsdamount(dynamic response) => (getJsonField(
        response,
        r'''$.products_by_service.*.usd_amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? usdresultamount(dynamic response) => (getJsonField(
        response,
        r'''$.products_by_service[:].usd_result_amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? productStatus(dynamic response) => (getJsonField(
        response,
        r'''$.products_by_service[:].status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? productsCreatedOn(dynamic response) => (getJsonField(
        response,
        r'''$.products_by_service[:].created_on''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? productcreatedby(dynamic response) => (getJsonField(
        response,
        r'''$.products_by_service[:].created_by''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modifiedOn(dynamic response) => (getJsonField(
        response,
        r'''$.products_by_service[:].modified_on''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modifiedby(dynamic response) => (getJsonField(
        response,
        r'''$.products_by_service[:].modified_by''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? subjectsName(dynamic response) => (getJsonField(
        response,
        r'''$.products_by_service.*.subject_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? alias(dynamic response) => (getJsonField(
        response,
        r'''$.products_by_service.*.subject_alias''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? subjectIcon(dynamic response) => (getJsonField(
        response,
        r'''$.products_by_service.*.subject_icon''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? round(dynamic response) => (getJsonField(
        response,
        r'''$.products_by_service.*.round''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? round1subStd(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.round1_subscribed.standard''',
      ));
  static List<String>? round2sub(dynamic response) => (getJsonField(
        response,
        r'''$.round2_subscribed.*''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? round1sub(dynamic response) => (getJsonField(
        response,
        r'''$.round1_subscribed.*''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? qaulified(dynamic response) => (getJsonField(
        response,
        r'''$.qual_subject_ids.*''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class TestCall {
  static Future<ApiCallResponse> call({
    String? subjectId = '',
    String? round = '',
    String? stdId = '',
    String? userId = '',
    String? serviceId = '',
    String? token = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'TestCall',
        'variables': {
          'subjectId': subjectId,
          'round': round,
          'stdId': stdId,
          'userId': userId,
          'serviceId': serviceId,
          'token': token,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static List? testResults(dynamic response) => getJsonField(
        response,
        r'''$.TestResults.*''',
        true,
      ) as List?;
  static dynamic practise(dynamic response) => getJsonField(
        response,
        r'''$.TestResults.practise''',
      );
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  static List<String>? testId(dynamic response) => (getJsonField(
        response,
        r'''$.tests..testId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? practiselist(dynamic response) => getJsonField(
        response,
        r'''$.tests.practise.*''',
        true,
      ) as List?;
  static List<String>? subjectName(dynamic response) => (getJsonField(
        response,
        r'''$.tests..subject_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? allservices(dynamic response) => getJsonField(
        response,
        r'''$.tests.*''',
        true,
      ) as List?;
  static List<String>? testicons(dynamic response) => (getJsonField(
        response,
        r'''$.tests..test_icon''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? testtime(dynamic response) => (getJsonField(
        response,
        r'''$.tests.*.time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? monthlylist(dynamic response) => getJsonField(
        response,
        r'''$.tests.final.*''',
        true,
      ) as List?;
  static String? practisemsg(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message.*.*.practise''',
      ));
  static String? ground2finalmsg(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message.*.*..final''',
      ));
}

class GetquestionsCall {
  static Future<ApiCallResponse> call({
    String? testId = '',
    String? userId = '',
    String? token = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetquestionsCall',
        'variables': {
          'testId': testId,
          'userId': userId,
          'token': token,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static List<String>? questionId(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.*.questionId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? questionName(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.*.question''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? answer1(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.*.answer1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? answer2(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.*.answer2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? answer3(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.*.answer3''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? answer4(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.*.answer4''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? trueanswer(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.*.true_answer''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? subjectName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.test_details.*.subject_name''',
      ));
  static String? alias(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.test_details.*.alias''',
      ));
  static List? testQuestions(dynamic response) => getJsonField(
        response,
        r'''$.test_questions.*''',
        true,
      ) as List?;
  static String? starttime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.test_details.*.test_start_time''',
      ));
  static String? endTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.test_details..test_end_time''',
      ));
  static String? timer(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.test_details..time''',
      ));
  static List<String>? answerimage1(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.*.answer_image1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? answerimage2(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.*.answer_image2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? anserimage3(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.*.answer_image3''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? answerimage4(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.*.answer_image4''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? questionimages(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.*.question_image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? questions(dynamic response) => getJsonField(
        response,
        r'''$.test_questions.*''',
        true,
      ) as List?;
  static dynamic testdetails(dynamic response) => getJsonField(
        response,
        r'''$.test_details.*''',
      );
}

class SlotCall {
  static Future<ApiCallResponse> call({
    String? slot = '',
    String? userId = '',
    String? token = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SlotCall',
        'variables': {
          'slot': slot,
          'userId': userId,
          'token': token,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic slot(dynamic response) => getJsonField(
        response,
        r'''$.updated_data.slot''',
      );
}

class OrderssCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? token = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'OrderssCall',
        'variables': {
          'userId': userId,
          'token': token,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static List? transactions(dynamic response) => getJsonField(
        response,
        r'''$.all_user_transactions''',
        true,
      ) as List?;
}

class ScheduleCall {
  static Future<ApiCallResponse> call({
    String? stdId = '',
    String? serviceId = '',
    String? token = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ScheduleCall',
        'variables': {
          'stdId': stdId,
          'serviceId': serviceId,
          'token': token,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static List<String>? dates(dynamic response) => (getJsonField(
        response,
        r'''$.annualExamSchedule.*.*.*''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? slot1(dynamic response) => getJsonField(
        response,
        r'''$.annualExamSchedule["Slot 1 of Round 1"].*''',
        true,
      ) as List?;
  static List? slot2(dynamic response) => getJsonField(
        response,
        r'''$.annualExamSchedule["Slot 2 Round 1"].*''',
        true,
      ) as List?;
  static List<String>? slot2Dates(dynamic response) => (getJsonField(
        response,
        r'''$.annualExamSchedule["Slot 2 Round 1"].*.*''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? slot1dates(dynamic response) => (getJsonField(
        response,
        r'''$.annualExamSchedule["Slot 1 of Round 1"].*.*''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? all(dynamic response) => getJsonField(
        response,
        r'''$.monthlyExamsSchedule.*''',
        true,
      ) as List?;
  static List<String>? months(dynamic response) => (getJsonField(
        response,
        r'''$.monthlyExamsSchedule.schedule[:].Month''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? science(dynamic response) => (getJsonField(
        response,
        r'''$.monthlyExamsSchedule.*['Science']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? maths(dynamic response) => (getJsonField(
        response,
        r'''$.monthlyExamsSchedule.*['Maths']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? gk(dynamic response) => (getJsonField(
        response,
        r'''$.monthlyExamsSchedule.*['GK & Essay']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? drawing(dynamic response) => (getJsonField(
        response,
        r'''$.monthlyExamsSchedule.*['English & Drawing']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetUsersCall {
  static Future<ApiCallResponse> call({
    String? testId = '',
    String? attempted = '',
    String? userId = '',
    String? takenTime = '',
    String? sessionId = '',
    String? questionId = '',
    String? userAnswer = '',
    dynamic userAnswersJson,
    String? token = '',
  }) async {
    final userAnswers = _serializeJson(userAnswersJson, true);
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetUsersCall',
        'variables': {
          'testId': testId,
          'attempted': attempted,
          'userId': userId,
          'takenTime': takenTime,
          'sessionId': sessionId,
          'questionId': questionId,
          'userAnswer': userAnswer,
          'userAnswers': userAnswers,
          'token': token,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class SubmitanswerstobackendCall {
  static Future<ApiCallResponse> call({
    String? testId = '',
    String? attemptedQuestions = '',
    String? userId = '',
    String? takenTime = '',
    String? sessionId = '',
    dynamic userAnswersJson,
    String? token = '',
  }) async {
    final userAnswers = _serializeJson(userAnswersJson, true);
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SubmitanswerstobackendCall',
        'variables': {
          'testId': testId,
          'attemptedQuestions': attemptedQuestions,
          'userId': userId,
          'takenTime': takenTime,
          'sessionId': sessionId,
          'userAnswers': userAnswers,
          'token': token,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static dynamic totalquestions(dynamic response) => getJsonField(
        response,
        r'''$.data.examination_details.total_questions''',
      );
  static dynamic attempted(dynamic response) => getJsonField(
        response,
        r'''$.data.examination_details.attempted_questions_count''',
      );
}

class NoticesCall {
  static Future<ApiCallResponse> call({
    String? stdId = '5',
    String? token = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'NoticesCall',
        'variables': {
          'stdId': stdId,
          'token': token,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static List? instructions(dynamic response) => getJsonField(
        response,
        r'''$.notices.instructions.*''',
        true,
      ) as List?;
  static List? annual(dynamic response) => getJsonField(
        response,
        r'''$.notices.annual.*''',
        true,
      ) as List?;
  static List? monthly(dynamic response) => getJsonField(
        response,
        r'''$.notices.monthly.*''',
        true,
      ) as List?;
}

class ProductsCall {
  static Future<ApiCallResponse> call({
    String? stdId = '',
    String? token = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ProductsCall',
        'variables': {
          'stdId': stdId,
          'token': token,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static List? products(dynamic response) => getJsonField(
        response,
        r'''$.products.*''',
        true,
      ) as List?;
  static List? monthly90(dynamic response) => getJsonField(
        response,
        r'''$.products["90"]["Monthly Test"].*''',
        true,
      ) as List?;
  static List? monthly182(dynamic response) => getJsonField(
        response,
        r'''$.products["182"]["Monthly Test"].*''',
        true,
      ) as List?;
  static List? monthly365(dynamic response) => getJsonField(
        response,
        r'''$.products["365"]["Monthly Test"].*''',
        true,
      ) as List?;
  static List? oBooks(dynamic response) => getJsonField(
        response,
        r'''$.products["365"]["Olympiad Books"].*''',
        true,
      ) as List?;
  static List? oExams(dynamic response) => getJsonField(
        response,
        r'''$.products["365"]["Olympiad Exams"].*''',
        true,
      ) as List?;
  static List? previous(dynamic response) => getJsonField(
        response,
        r'''$.products["365"]["Previous Year Question Paper"].*''',
        true,
      ) as List?;
  static List? liveClasses(dynamic response) => getJsonField(
        response,
        r'''$.products["365"]["Live Online Classes"].*''',
        true,
      ) as List?;
  static List? onlineStudy(dynamic response) => getJsonField(
        response,
        r'''$.products["365"]["Online Study Material"].*''',
        true,
      ) as List?;
  static List? ebook(dynamic response) => getJsonField(
        response,
        r'''$.products["365"]["Ebooks"].*''',
        true,
      ) as List?;
  static List? certificate(dynamic response) => getJsonField(
        response,
        r'''$.products["365"]["Certificate"].*''',
        true,
      ) as List?;
  static List? summerQuiz(dynamic response) => getJsonField(
        response,
        r'''$.products["365"]["Summer Quiz Competition"].*''',
        true,
      ) as List?;
  static List<String>? productName(dynamic response) => (getJsonField(
        response,
        r'''$.products.*.*.*.product_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? amount(dynamic response) => (getJsonField(
        response,
        r'''$.products.*.*.*.INR''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? productsnew(dynamic response) => getJsonField(
        response,
        r'''$.products.*.*.*''',
        true,
      ) as List?;
  static List<String>? round(dynamic response) => (getJsonField(
        response,
        r'''$.products.*.*.*.round''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ProductsSubscriptionCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    List<int>? productsList,
    String? payableAmount = '',
    String? deliveryCharge = '',
    String? powerpackid = '',
    String? purchaseType = '',
    List<int>? comboIdList,
    String? token = '',
  }) async {
    final products = _serializeList(productsList);
    final comboId = _serializeList(comboIdList);

    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ProductsSubscriptionCall',
        'variables': {
          'userId': userId,
          'products': products,
          'payableAmount': payableAmount,
          'deliveryCharge': deliveryCharge,
          'powerpackid': powerpackid,
          'purchaseType': purchaseType,
          'comboId': comboId,
          'token': token,
        },
      },
    );
    print(response);
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static List? products(dynamic response) => getJsonField(
        response,
        r'''$.products.*''',
        true,
      ) as List?;
  static List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.products.*.product_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? subjectid(dynamic response) => (getJsonField(
        response,
        r'''$.products.*.subject_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? serviceId(dynamic response) => (getJsonField(
        response,
        r'''$.products.*.service_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.products.*.product_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? alias(dynamic response) => (getJsonField(
        response,
        r'''$.products.*.alias''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? servicetype(dynamic response) => (getJsonField(
        response,
        r'''$.products.*.service_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? round(dynamic response) => (getJsonField(
        response,
        r'''$.products.*.round''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? duration(dynamic response) => (getJsonField(
        response,
        r'''$.products.*.duration''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? amount(dynamic response) => (getJsonField(
        response,
        r'''$.products.*.amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? merchantId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.payment_data.pstatus.merchantTransactionId''',
      ));
  static String? error(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error''',
      ));
}

class GetStandardsCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetStandardsCall',
        'variables': {
          'token': token,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static List<String>? standards(dynamic response) => (getJsonField(
        response,
        r'''$.standards.*.std_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class DeleteLogsCall {
  static Future<ApiCallResponse> call({
    String? testId = '',
    String? userid = '',
    String? token = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DeleteLogsCall',
        'variables': {
          'testId': testId,
          'userid': userid,
          'token': token,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class TestingexamCall {
  static Future<ApiCallResponse> call({
    String? userId = '299898',
    String? token = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'TestingexamCall',
        'variables': {
          'userId': userId,
          'token': token,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ResultsCall {
  static Future<ApiCallResponse> call({
    String? mobile = '',
    String? token = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ResultsCall',
        'variables': {
          'mobile': mobile,
          'token': token,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static List? resultdata(dynamic response) => getJsonField(
        response,
        r'''$.resultData.*''',
        true,
      ) as List?;
}

class RoundregistrationCall {
  static Future<ApiCallResponse> call({
    String? mobileNo = '',
    String? userId = '',
    String? stdId = '',
    String? token = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'RoundregistrationCall',
        'variables': {
          'mobileNo': mobileNo,
          'userId': userId,
          'stdId': stdId,
          'token': token,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static List? science(dynamic response) => getJsonField(
        response,
        r'''$.data.packages[?(@.package_name == "SCIENCE ROUND 2")].combos.*''',
        true,
      ) as List?;
  static List? packages(dynamic response) => getJsonField(
        response,
        r'''$.data.packages''',
        true,
      ) as List?;
  static List? comboname(dynamic response) => getJsonField(
        response,
        r'''$.data.packages[:].combos''',
        true,
      ) as List?;
  static List? maths(dynamic response) => getJsonField(
        response,
        r'''$.data.packages[?(@.package_name == "MATHS ROUND 2")].combos.*''',
        true,
      ) as List?;
  static List? english(dynamic response) => getJsonField(
        response,
        r'''$.data.packages[?(@.package_name == "ENGLISH ROUND 2")]''',
        true,
      ) as List?;
  static List? nonqualified(dynamic response) => getJsonField(
        response,
        r'''$.data.non_qualified_product_data.*''',
        true,
      ) as List?;
  static List? combos(dynamic response) => getJsonField(
        response,
        r'''$.data.packages.*''',
        true,
      ) as List?;
  static List<String>? amount(dynamic response) => (getJsonField(
        response,
        r'''$.data.packages[:].combos[:].inr_discount_amt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class SubmitregistrationCall {
  static Future<ApiCallResponse> call({
    String? userid = '',
    List<String>? comboIdList,
    List<String>? certificatesList,
    String? payment = '',
    String? slug = '',
    String? totaldiscount = '',
    String? finalamount = '',
    String? deliverycharges = '',
    int? isUpdated,
    String? token = '',
  }) async {
    final comboId = _serializeList(comboIdList);
    final certificates = _serializeList(certificatesList);

    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SubmitregistrationCall',
        'variables': {
          'userid': userid,
          'comboId': comboId,
          'certificates': certificates,
          'payment': payment,
          'slug': slug,
          'totaldiscount': totaldiscount,
          'finalamount': finalamount,
          'deliverycharges': deliverycharges,
          'isUpdated': isUpdated,
          'token': token,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? transactionId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.payment_data.merchantTransactionId''',
      ));
}

class PhonepeCall {
  static Future<ApiCallResponse> call({
    String? verify = '',
    String? base = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'PhonepeCall',
        'variables': {
          'verify': verify,
          'base': base,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static String? code(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.code''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  static String? merchantId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.merchantId''',
      ));
  static String? transactionid(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.merchantTransactionId''',
      ));
  static String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.instrumentResponse.redirectInfo.url''',
      ));
}

class PaymentStatusCall {
  static Future<ApiCallResponse> call({
    String? merchantId = '',
    String? transactionId = '',
    String? verify = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'PaymentStatusCall',
        'variables': {
          'merchantId': merchantId,
          'transactionId': transactionId,
          'verify': verify,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? code(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.code''',
      ));
  static bool? succes(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static String? merchantId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.merchantId''',
      ));
  static String? transaction(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.transactionId''',
      ));
}

class PhonecallbackCall {
  static Future<ApiCallResponse> call({
    bool? success,
    String? code = '',
    String? message = '',
    dynamic dataJson,
    String? orderId = '',
    String? token = '',
  }) async {
    final data = _serializeJson(dataJson);
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'PhonecallbackCall',
        'variables': {
          'success': success,
          'code': code,
          'message': message,
          'data': data,
          'orderId': orderId,
          'token': token,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static dynamic amount(dynamic response) => getJsonField(
        response,
        r'''$.response_data.amount''',
      );
  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.response_data.payment_status''',
      );
  static dynamic responsecode(dynamic response) => getJsonField(
        response,
        r'''$.response_data.responseCode''',
      );
  static dynamic orderid(dynamic response) => getJsonField(
        response,
        r'''$.response_data.order_id''',
      );
  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.response_data.message''',
      );
}

class StatusCheckCall {
  static Future<ApiCallResponse> call({
    String? trancastionid = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "merchantTransactionId": "${trancastionid}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'statusCheck',
      apiUrl:
          'https://www.indiantalent.org/RESTapi/student-v1/payment/check_payment_status',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? code(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response_data.responseCode''',
      ));
}

class SummerQuizCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'summerQuiz',
      apiUrl:
          'https://www.indiantalent.org/RESTapi/student-v1/Products/summer_quiz_product_and_coupons',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic productData(dynamic response) => getJsonField(
        response,
        r'''$.summer_quiz.product_data.*''',
      );
  static String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.summer_quiz.product_data[:].title''',
      ));
  static String? amount(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.summer_quiz.product_data[:].amount''',
      ));
  static dynamic coupon(dynamic response) => getJsonField(
        response,
        r'''$.summer_quiz.coupons.*''',
      );
  static dynamic subscription(dynamic response) => getJsonField(
        response,
        r'''$.summer_quiz.subscriptions''',
      );
  static List<int>? standards(dynamic response) => (getJsonField(
        response,
        r'''$.summer_quiz.standards''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class MonthlyResultsCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? subjectId = '',
    String? stdId = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}",
  "subject_id": "${subjectId}",
  "std_id": "${stdId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'monthlyResults',
      apiUrl:
          'https://www.indiantalent.org/RESTapi/student-v1/exam/test_attempts',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? results(dynamic response) => getJsonField(
        response,
        r'''$.user_test_logs.*''',
        true,
      ) as List?;
}

class RoundresultsCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'roundresults',
      apiUrl:
          'https://www.indiantalent.org/RESTapi/student-v1/result/get_round_2_results',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? results(dynamic response) => getJsonField(
        response,
        r'''$.data.results.*''',
        true,
      ) as List?;
  static List? certificate(dynamic response) => getJsonField(
        response,
        r'''$.data.certificate_product_data.*''',
        true,
      ) as List?;
}

class ViewCertificatesCall {
  static Future<ApiCallResponse> call({
    String? resultId = '',
    String? userId = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "result_id": "${resultId}",
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'viewCertificates',
      apiUrl:
          'https://www.indiantalent.org/RESTapi/student-v1/exam/view_certificate',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? certificatepath(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.display_on_certificate.certificate_path''',
      ));
  static List? cdertificateData(dynamic response) => getJsonField(
        response,
        r'''$.data.certificate_product_data''',
        true,
      ) as List?;
  static dynamic certificatedara(dynamic response) => getJsonField(
        response,
        r'''$.data.display_on_certificate''',
      );
}

class PowerPackagesCall {
  static Future<ApiCallResponse> call({
    String? stdId = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "std_id": "${stdId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'powerPackages',
      apiUrl:
          'https://www.indiantalent.org/RESTapi/student-v1/products/fetch_packages',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? packages(dynamic response) => getJsonField(
        response,
        r'''$.packages.*''',
        true,
      ) as List?;
  static List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$.packages.*.packageData.description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? combos(dynamic response) => getJsonField(
        response,
        r'''$.packages.*.packageData.comboData.*''',
        true,
      ) as List?;
  static List? comboproducts(dynamic response) => getJsonField(
        response,
        r'''$.packages.*.packageData.comboData[:].comboProducts''',
        true,
      ) as List?;
  static List<String>? comboname(dynamic response) => (getJsonField(
        response,
        r'''$.packages[:].packageData.comboData[:].comboName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class BannersCall {
  static Future<ApiCallResponse> call({
    String? stdId = '',
    String? displayFor = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "std_id": "${stdId}",
  "display_for": "${displayFor}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'banners',
      apiUrl: 'https://www.indiantalent.org/RESTapi/student-v1/profile/banners',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? banners(dynamic response) => getJsonField(
        response,
        r'''$.banners''',
        true,
      ) as List?;
}

class NotificationsCall {
  static Future<ApiCallResponse> call({
    String? stdId = '',
    String? displayFor = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "std_id": "${stdId}",
  "display_for": "${displayFor}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'notifications',
      apiUrl:
          'https://www.indiantalent.org/RESTapi/student-v1/profile/announcements',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? announcements(dynamic response) => getJsonField(
        response,
        r'''$.announcements''',
        true,
      ) as List?;
  static List? highpriority(dynamic response) => getJsonField(
        response,
        r'''$.high_priority_announcements.*''',
        true,
      ) as List?;
}

class GetquestionsoxCall {
  static Future<ApiCallResponse> call({
    String? testId = '',
    String? userId = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "test_id": "${testId}",
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getquestionsox',
      apiUrl:
          'https://www.indiantalent.org/RESTapi/student-v1/exam/get_questions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? sectionAquestionId(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab1.questions[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionAquestions(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab1.questions[:].question''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionAquestionImage(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab1.questions[:].question_image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionAanswer1(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab1.questions[:].answer1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionAanswer2(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab1.questions[:].answer2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionAanswer3(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab1.questions[:].answer3''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionAanswer4(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab1.questions[:].answer4''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionAanswerimage1(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab1.questions[:].answer_image1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionAanswerimage2(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab1.questions[:].answer_image2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionAanswerimage3(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab1.questions[:].answer_image3''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionAanswerimage4(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab1.questions[:].answer_image4''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionBquestionId(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab2.questions[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionBquestions(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab2.questions[:].question''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionBquestionImage(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab2.questions[:].question_image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionBanswer1(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab2.questions[:].answer1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionBanswer2(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab2.questions[:].answer2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionBanswer3(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab2.questions[:].answer3''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionBanswer4(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab2.questions[:].answer4''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionBanswerImage1(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab2.questions[:].answer_image1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionBanswerImage2(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab2.questions[:].answer_image2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionBanswerImage3(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab2.questions[:].answer_image3''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionBanswerImage4(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab2.questions[:].answer_image4''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionCquestionId(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab3.questions[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionCquestions(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab3.questions[:].question''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionCquestionImage(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab3.questions[:].question_image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionCanswer1(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab3.questions[:].answer1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionCanswer2(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab3.questions[:].answer2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionCanswer3(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab3.questions[:].answer3''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionCanswer4(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab3.questions[:].answer4''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionCanswerimage1(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab3.questions[:].answer_image1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionCanswerimage2(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab3.questions[:].answer_image2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionCanswerimage3(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab3.questions[:].answer_image3''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionCanswerimage4(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab3.questions[:].answer_image4''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? testformat1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.test_questions.tab1.question_format''',
      ));
  static String? testformat2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.test_questions.tab2.question_format''',
      ));
  static String? testformat3(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.test_questions.tab3.question_format''',
      ));
  static dynamic testdetails(dynamic response) => getJsonField(
        response,
        r'''$.test_details.*''',
      );
}

class SubmissionCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'submission',
      apiUrl:
          'https://www.indiantalent.org/RESTapi/student-v1/exam/check_submission',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? sectionAquestionId(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab1.questions[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionAquestions(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab1.questions[:].question''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionAquestionImage(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab1.questions[:].question_image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionAanswer1(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab1.questions[:].answer1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionAanswer2(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab1.questions[:].answer2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionAanswer3(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab1.questions[:].answer3''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionAanswer4(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab1.questions[:].answer4''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionAanswerimage1(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab1.questions[:].answer_image1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionAanswerimage2(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab1.questions[:].answer_image2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionAanswerimage3(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab1.questions[:].answer_image3''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionAanswerimage4(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab1.questions[:].answer_image4''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionBquestionId(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab2.questions[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionBquestions(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab2.questions[:].question''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionBquestionImage(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab2.questions[:].question_image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionBanswer1(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab2.questions[:].answer1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionBanswer2(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab2.questions[:].answer2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionBanswer3(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab2.questions[:].answer3''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionBanswer4(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab2.questions[:].answer4''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionBanswerImage1(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab2.questions[:].answer_image1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionBanswerImage2(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab2.questions[:].answer_image2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionBanswerImage3(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab2.questions[:].answer_image3''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionBanswerImage4(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab2.questions[:].answer_image4''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionCquestionId(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab3.questions[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionCquestions(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab3.questions[:].question''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionCquestionImage(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab3.questions[:].question_image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionCanswer1(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab3.questions[:].answer1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionCanswer2(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab3.questions[:].answer2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionCanswer3(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab3.questions[:].answer3''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionCanswer4(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab3.questions[:].answer4''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionCanswerimage1(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab3.questions[:].answer_image1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionCanswerimage2(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab3.questions[:].answer_image2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionCanswerimage3(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab3.questions[:].answer_image3''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sectionCanswerimage4(dynamic response) => (getJsonField(
        response,
        r'''$.test_questions.tab3.questions[:].answer_image4''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? testformat1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.test_questions.tab1.question_format''',
      ));
  static String? testformat2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.test_questions.tab2.question_format''',
      ));
  static String? testformat3(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.test_questions.tab3.question_format''',
      ));
}

class AppcheckCall {
  static Future<ApiCallResponse> call({
    String? appId = '',
    String? platform = '',
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'appcheck',
      apiUrl: 'https://get-appversion.vercel.app/app-version',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'appId': appId,
        'platform': platform,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? androidversion(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.version''',
      ));
}

class ValidateTokenCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ValidateTokenCall',
        'variables': {
          'token': token,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GetNewTokenCall {
  static Future<ApiCallResponse> call({
    String? userID = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetNewTokenCall',
        'variables': {
          'userID': userID,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
