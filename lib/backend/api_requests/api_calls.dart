import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:indian_talent_olympiad/backend/api_requests/api_token_manager.dart';

import '../cloud_functions/cloud_functions.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

String getBaseUrl() {
  // Default fallback if .env fails to load
  return dotenv.env['BASE_URL'] ??
      'https://www.olympiadx.com/RESTapi';
}

class LoginOutsideCall {
  static Future<ApiCallResponse> call({
    String? mobile = '',
    String? password = '',
  }) async {
    // ✅ Make the actual REST API call
    final response = await ApiManager.instance.makeApiCall(
      callName: 'LoginOutsideCall',
      apiUrl: '${getBaseUrl()}/student/auth/login',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'login_id': mobile,
        'password': password,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );

    // ✅ Build compatible ApiCallResponse (FlutterFlow format)
    final apiResponse = ApiCallResponse(
      response.jsonBody,
      response.headers,
      response.statusCode,
      response: response.response,
    );

    // ✅ Extract and store token globally
    try {
      final token = getJsonField(apiResponse.jsonBody, r'''$.token.firebase_token''');
      final expires = getJsonField(apiResponse.jsonBody, r'''$.token.expires_at''');

      if (token != null && token.toString().isNotEmpty) {
        ApiTokenManager.setToken(token.toString(), expires?.toString());
        print('✅ Token saved: ${ApiTokenManager.token}');
        
      } else {
        print('⚠️ No token found in response');
      }
    } catch (e) {
      print('⚠️ Token parsing failed: $e');
    }

    return apiResponse;
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
  static String? token(dynamic response) =>
    castToType<String>(getJsonField(response, r'''$.token.firebase_token'''));
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
  static dynamic schoolstate(dynamic response) => getJsonField(
        response,
        r'''$.session_data.school_state''',
      );
}

class ForgetPasswordCall {
   static Future<ApiCallResponse> call({
    String? mobile = '',
  }) async {
    final ffApiRequestBody = '''
{
  "mobile": "${mobile}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'forgetPassword',
      apiUrl:
          '${getBaseUrl()}/student/Auth/forgot_password',
      callType: ApiCallType.POST,
      headers: {},
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
  }) async {
    final ffApiRequestBody = '''
{
  "otp": "${otp}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'verifyOtpPhone',
      apiUrl: '${getBaseUrl()}/student/auth/verify_otp',
      callType: ApiCallType.POST,
      headers: {},
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
    final ffApiRequestBody = '''
{
  "student_name": "${studentName}",
  "parent_name": "${parentName}",
  "parent_email": "${parentEmail}",
  "mobile": "${mobile}",
  "address": "${address}",
  "school_name": "${schoolName}",
  "state": "${state}",
  "city": "${city}",
  "password": "${password}",
  "confirm_password": "${confirmPassword}",
  "std_id": ${stdId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'regiter',
      apiUrl: '${getBaseUrl()}/student/register/index',
      callType: ApiCallType.POST,
      headers: {},
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
    final ffApiRequestBody = '''
{
  "mobile": "${mobile}",
  "otp": "${otp}",
  "password": "${password}",
  "confirm_password": "${confirmPassword}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'resetpassword',
      apiUrl:
          '${getBaseUrl()}/student/Auth/recover_account',
      callType: ApiCallType.POST,
      headers: {},
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

class GetAllProductsCall {
 static Future<ApiCallResponse> call({
    String? std = '',
  }) async {
    final ffApiRequestBody = '''
{
  "std_id": "${std}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getAllProducts',
      apiUrl:
          '${getBaseUrl()}/student/products/fetch_products_and_coupons',
      callType: ApiCallType.POST,
      headers: ApiTokenManager.headers,
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
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "student_name": "${studentName}",
  "parent_name": "${parentName}",
  "address": "${address}",
  "district": "${district}",
  "state": "${state}",
  "city": "${city}",
  "pin_code": "${pinCode}",
  "school_name": "${schoolName}",
  "school_state": "${schoolState}",
  "school_address": "${schoolAddress}",
  "school_city": "${schoolCity}",
  "school_pin_code": "${schoolPincode}",
  "username": "${userName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'editprofile',
      apiUrl: '${getBaseUrl()}/student/profile/index',
      callType: ApiCallType.PUT,
      headers: ApiTokenManager.headers,
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

class SubcsriptionsCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? stdId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}",
  "std_id": "${stdId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'subcsriptions',
      apiUrl:
          '${getBaseUrl()}/student/profile/subscriptions',
      callType: ApiCallType.POST,
      headers: ApiTokenManager.headers,
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
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'orderpr',
      apiUrl: '${getBaseUrl()}/student/profile/orders',
      callType: ApiCallType.POST,
      headers: ApiTokenManager.headers,
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

class GetServicesCall {
 static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getServices',
      apiUrl: '${getBaseUrl()}/student/services/index',
      callType: ApiCallType.GET,
      headers: ApiTokenManager.headers,
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
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
  }) async {
    final ffApiRequestBody = '''
{
  "std_id": "${stdId}",
  "user_id": "${userId}",
  "service_id": "${serviceId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'subjects',
      apiUrl: '${getBaseUrl()}/student/exam/index',
      callType: ApiCallType.POST,
      headers: ApiTokenManager.headers,
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
  }) async {
    final ffApiRequestBody = '''
{
  "subject_id": "${subjectId}",
  "round": "${round}",
  "std_id": "${stdId}",
  "user_id": "${userId}",
  "service_id": "${serviceId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'test',
      apiUrl: '${getBaseUrl()}/student/exam/get_tests',
      callType: ApiCallType.POST,
      headers: ApiTokenManager.headers,
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

  static dynamic testResults(dynamic response) => getJsonField(
        response,
        r'''$.TestResults.*''',
        true,
      );
  static dynamic practise(dynamic response) => getJsonField(
        response,
        r'''$.TestResults.practise''',
      );
  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic testId(dynamic response) => (getJsonField(
        response,
        r'''$.tests..testId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static dynamic practiselist(dynamic response) => getJsonField(
        response,
        r'''$.tests.practise.*''',
        true,
      );
  static dynamic subjectName(dynamic response) => (getJsonField(
        response,
        r'''$.tests..subject_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static dynamic allservices(dynamic response) => getJsonField(
        response,
        r'''$.tests.*''',
        true,
      );
  static dynamic testicons(dynamic response) => (getJsonField(
        response,
        r'''$.tests..test_icon''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static dynamic testtime(dynamic response) => (getJsonField(
        response,
        r'''$.tests.*.time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static dynamic monthlylist(dynamic response) => getJsonField(
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
  }) async {
    final ffApiRequestBody = '''
{
  "test_id": "${testId}",
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getquestions',
      apiUrl: '${getBaseUrl()}/student/exam/get_questions',
      callType: ApiCallType.POST,
      headers: ApiTokenManager.headers,
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
  static dynamic questionId(dynamic response) => getJsonField(
        response,
        r'''$.test_questions.*.questionId''',
        true,
      );
  static dynamic questionName(dynamic response) => getJsonField(
        response,
        r'''$.test_questions.*.question''',
        true,
      );
  static dynamic answer1(dynamic response) => getJsonField(
        response,
        r'''$.test_questions.*.answer1''',
        true,
      );
  static dynamic answer2(dynamic response) => getJsonField(
        response,
        r'''$.test_questions.*.answer2''',
        true,
      );
  static dynamic answer3(dynamic response) => getJsonField(
        response,
        r'''$.test_questions.*.answer3''',
        true,
      );
  static dynamic answer4(dynamic response) => getJsonField(
        response,
        r'''$.test_questions.*.answer4''',
        true,
      );
  static dynamic trueanswer(dynamic response) => getJsonField(
        response,
        r'''$.test_questions.*.true_answer''',
        true,
      );
  static dynamic subjectName(dynamic response) => getJsonField(
        response,
        r'''$.test_details.*.subject_name''',
      );
  static dynamic alias(dynamic response) => getJsonField(
        response,
        r'''$.test_details.*.alias''',
      );
  static dynamic testQuestions(dynamic response) => getJsonField(
        response,
        r'''$.test_questions.*''',
        true,
      );
  static dynamic starttime(dynamic response) => getJsonField(
        response,
        r'''$.test_details.*.test_start_time''',
      );
  static dynamic endTime(dynamic response) => getJsonField(
        response,
        r'''$.test_details..test_end_time''',
      );
  static dynamic timer(dynamic response) => getJsonField(
        response,
        r'''$.test_details..time''',
      );
  static dynamic answerimage1(dynamic response) => getJsonField(
        response,
        r'''$.test_questions.*.answer_image1''',
        true,
      );
  static dynamic answerimage2(dynamic response) => getJsonField(
        response,
        r'''$.test_questions.*.answer_image2''',
        true,
      );
  static dynamic anserimage3(dynamic response) => getJsonField(
        response,
        r'''$.test_questions.*.answer_image3''',
        true,
      );
  static dynamic answerimage4(dynamic response) => getJsonField(
        response,
        r'''$.test_questions.*.answer_image4''',
        true,
      );
  static dynamic questionimages(dynamic response) => getJsonField(
        response,
        r'''$.test_questions.*.question_image''',
        true,
      );
  static dynamic testdetails(dynamic response) => getJsonField(
        response,
        r'''$.test_details.*''',
      );
}

class SlotCall {
 static Future<ApiCallResponse> call({
    String? slot = '',
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "slot": "${slot}",
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'slot',
      apiUrl:
          '${getBaseUrl()}/student/exam/set_annual_slot',
      callType: ApiCallType.POST,
      headers: ApiTokenManager.headers,
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
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'orderss',
      apiUrl: '${getBaseUrl()}/student/profile/orders',
      callType: ApiCallType.POST,
      headers: ApiTokenManager.headers,
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
  }) async {
    final ffApiRequestBody = '''
{
  "std_id": "${stdId}",
  "service_id": "${serviceId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'schedule',
      apiUrl: '${getBaseUrl()}/student/profile/schedule',
      callType: ApiCallType.POST,
      headers: ApiTokenManager.headers,
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
  }) async {
    final userAnswers = _serializeJson(userAnswersJson, true);
    final ffApiRequestBody = '''
{
  "test_id": "${testId}",
  "attempted_questions": "${attempted}",
  "user_id": "${userId}",
  "taken_time": "${takenTime}",
  "session_id": "${sessionId}",
  "user_answers": [    {
      "question_id": "${questionId}",
      "user_answer": "${userAnswer}"
    },
    {
      "question_id": "${questionId}",
      "user_answer": "${userAnswer}"
    },
    {
      "question_id": "${questionId}",
      "user_answer": "${userAnswer}"
    },
    {
      "question_id": "${questionId}",
      "user_answer": "${userAnswer}"
    },
    {
      "question_id": "${questionId}",
      "user_answer": "${userAnswer}"
    },
    {
      "question_id": "${questionId}",
      "user_answer": "${userAnswer}"
    },
    {
      "question_id": "${questionId}",
      "user_answer": "${userAnswer}"
    },
    {
      "question_id": "${questionId}",
      "user_answer": "${userAnswer}"
    },
    {
      "question_id": "${questionId}",
      "user_answer": "${userAnswer}"
    },
    {
      "question_id": "${questionId}",
      "user_answer": "${userAnswer}"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getUsers',
      apiUrl: '${getBaseUrl()}/student/exam/exam_response',
      callType: ApiCallType.POST,
      headers: ApiTokenManager.headers,
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

class SubmitanswerstobackendCall {
 static Future<ApiCallResponse> call({
    String? testId = '',
    String? attemptedQuestions = '',
    String? userId = '',
    String? takenTime = '',
    String? sessionId = '',
    dynamic userAnswersJson,
  }) async {
    final userAnswers = _serializeJson(userAnswersJson, true);
    final ffApiRequestBody = '''
{
  "test_id": "${testId}",
  "attempted_questions": "${attemptedQuestions}",
  "user_id": "${userId}",
  "taken_time": "${takenTime}",
  "session_id": "${sessionId}",
  "user_answers": ${userAnswers}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Submitanswerstobackend',
      apiUrl: '${getBaseUrl()}/student/exam/exam_response',
      callType: ApiCallType.POST,
      headers: ApiTokenManager.headers,
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
  }) async {
    final ffApiRequestBody = '''
{
  "std_id": "${stdId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'notices',
      apiUrl: '${getBaseUrl()}/student/profile/notices',
      callType: ApiCallType.POST,
      headers: ApiTokenManager.headers,
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
  }) async {
    final ffApiRequestBody = '''
{
  "std_id": "${stdId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'products',
      apiUrl:
          '${getBaseUrl()}/student/products/fetch_products',
      callType: ApiCallType.POST,
      headers: ApiTokenManager.headers,
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
    List<String>? comboIdList,
  }) async {
    final products = _serializeList(productsList);
    final comboId = _serializeList(comboIdList);

    final ffApiRequestBody = '''
{
  "user_id": "${userId}",
"products":${products},
"payment_data":{
  "payment_gateway": "ccavenue",
        "currency": "INR",
 "delivery_charge": "${deliveryCharge}",
        "payable_amount": "${payableAmount}", 
        "discount_amount": "0",
        "coupon_code": "NULL",
        "purchase_type" : "individual" ,
"power_pack_id":"${powerpackid}",
 "purchase_type" :"${purchaseType}",
 
 "combo_id":"${comboId}"
}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'products Subscription',
      apiUrl:
          '${getBaseUrl()}/student/register/get_selected_products',
      callType: ApiCallType.POST,
      headers: ApiTokenManager.headers,
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
}

class GetStandardsCall {
   static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get standards',
      apiUrl: '${getBaseUrl()}/student/Standard',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
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
  }) async {
    final ffApiRequestBody = '''
{
"testId":"${testId}",
"userId":"${userid}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'deleteLogs',
      apiUrl:
          '${getBaseUrl()}/student/exam/delete_test_logs',
      callType: ApiCallType.POST,
      headers: {},
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


class TestingexamCall {
  static Future<ApiCallResponse> call({
    String? userId = '299898',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'testingexam',
      apiUrl: '${getBaseUrl()}/student/exam/resultData',
      callType: ApiCallType.GET,
      headers: ApiTokenManager.headers,
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

class ResultsCall {
 static Future<ApiCallResponse> call({
    String? mobile = '',
  }) async {
    final ffApiRequestBody = '''
{
  "mobile": "${mobile}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'results',
      apiUrl: '${getBaseUrl()}/student/Result',
      callType: ApiCallType.POST,
      headers: ApiTokenManager.headers,
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
  }) async {
    final ffApiRequestBody = '''
{
  "mobile": "${mobileNo}",
  "user_id": "${userId}",
 
  "standard": "${stdId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'roundregistration',
      apiUrl:
          '${getBaseUrl()}/student/products/fetch_round_two_combos',
      callType: ApiCallType.POST,
      headers: ApiTokenManager.headers,
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
  }) async {
    final comboId = _serializeList(comboIdList);
    final certificates = _serializeList(certificatesList);

    final ffApiRequestBody = '''
{
  "user_id": "${userid}",
  "selected_combo_ids": ${comboId},
  "selected_certificates": ${certificates},
  "payment_gateway": "${payment}",
  "slug": "${slug}",
  "total_discount": "${totaldiscount}",
  "final_total_amount": "${finalamount}",
"isUpdated":${isUpdated},
  "delivery_charges_applied": "${deliverycharges}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'submitregistration',
      apiUrl: '${getBaseUrl()}/student/Register/round_two',
      callType: ApiCallType.POST,
      headers: ApiTokenManager.headers,
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

  static String? transactionId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.payment_data.merchantTransactionId''',
      ));
}
class AppcheckCall {
  static Future<ApiCallResponse> call({
    String? appId = '',
    String? platform = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'appcheck',
      apiUrl: 'https://get-appversion.vercel.app/app-version',
      callType: ApiCallType.GET,
      headers: {},
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
  }) async {
    final data = _serializeJson(dataJson);

    return ApiManager.instance.makeApiCall(
      callName: 'phonecallback',
      apiUrl:
          '${getBaseUrl()}/student/payment/Phonepe_callback',
      callType: ApiCallType.POST,
      headers: {},
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
  }) async {
    final ffApiRequestBody = '''
{
  "merchantTransactionId": "$trancastionid"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'statusCheck',
      apiUrl:
          '${getBaseUrl()}/student/payment/check_payment_status',
      callType: ApiCallType.POST,
      headers: ApiTokenManager.headers,
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "$userId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'summerQuiz',
      apiUrl:
          '${getBaseUrl()}/student/Products/summer_quiz_product_and_coupons',
      callType: ApiCallType.POST,
      headers: ApiTokenManager.headers,
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "$userId",
  "subject_id": "$subjectId",
  "std_id": "$stdId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'monthlyResults',
      apiUrl: '${getBaseUrl()}/student/exam/test_attempts',
      callType: ApiCallType.POST,
      headers: ApiTokenManager.headers,
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "$userId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'roundresults',
      apiUrl:
          '${getBaseUrl()}/student/result/get_round_2_results',
      callType: ApiCallType.POST,
      headers: ApiTokenManager.headers,
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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
  }) async {
    final ffApiRequestBody = '''
{
  "result_id": "$resultId",
  "user_id": "$userId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'viewCertificates',
      apiUrl:
          '${getBaseUrl()}/student/exam/view_certificate',
      callType: ApiCallType.POST,
      headers: ApiTokenManager.headers,
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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
  }) async {
    final ffApiRequestBody = '''
{
  "std_id": "$stdId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'powerPackages',
      apiUrl:
          '${getBaseUrl()}/student/products/fetch_packages',
      callType: ApiCallType.POST,
      headers: ApiTokenManager.headers,
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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
  }) async {
    final ffApiRequestBody = '''
{
  "std_id": "$stdId",
  "display_for": "$displayFor"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'banners',
      apiUrl: '${getBaseUrl()}/student/profile/banners',
      callType: ApiCallType.POST,
      headers: ApiTokenManager.headers,
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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
  }) async {
    
    final ffApiRequestBody = '''

{
  "std_id": "$stdId",
  "display_for": "$displayFor"
}''';

    return ApiManager.instance.makeApiCall(
      callName: 'notifications',
      apiUrl:
          '${getBaseUrl()}/student/profile/announcements',
      callType: ApiCallType.POST,
      headers: ApiTokenManager.headers,
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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
  }) async {
    final ffApiRequestBody = '''
{
  "test_id": "$testId",
  "user_id": "$userId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getquestionsox',
      apiUrl: '${getBaseUrl()}/student/exam/get_questions',
      callType: ApiCallType.POST,
      headers: ApiTokenManager.headers,
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
