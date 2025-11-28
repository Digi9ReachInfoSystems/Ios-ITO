const axios = require("axios").default;
const qs = require("qs");

async function _loginOutsideCall(context, ffVariables) {
  var mobile = ffVariables["mobile"];
  var password = ffVariables["password"];

  var url = `https://www.indiantalent.org/RESTapi/student/auth/login`;
  var headers = {};
  var params = { login_id: mobile, password: password };
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "X_WWW_FORM_URL_ENCODED",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _forgetPasswordCall(context, ffVariables) {
  var mobile = ffVariables["mobile"];

  var url = `https://www.indiantalent.org/RESTapi/student/Auth/forgot_password`;
  var headers = {};
  var params = {};
  var ffApiRequestBody = `
{
  "mobile": "${mobile}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _verifyOtpPhoneCall(context, ffVariables) {
  var otp = ffVariables["otp"];

  var url = `https://www.indiantalent.org/RESTapi/student/auth/verify_otp`;
  var headers = {};
  var params = {};
  var ffApiRequestBody = `
{
  "otp": "${otp}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _regiterCall(context, ffVariables) {
  var studentName = ffVariables["studentName"];
  var parentName = ffVariables["parentName"];
  var parentEmail = ffVariables["parentEmail"];
  var mobile = ffVariables["mobile"];
  var address = ffVariables["address"];
  var schoolName = ffVariables["schoolName"];
  var state = ffVariables["state"];
  var city = ffVariables["city"];
  var password = ffVariables["password"];
  var confirmPassword = ffVariables["confirmPassword"];
  var stdId = ffVariables["stdId"];

  var url = `https://www.indiantalent.org/RESTapi/student/register/index`;
  var headers = {};
  var params = {};
  var ffApiRequestBody = `
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
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _resetpasswordCall(context, ffVariables) {
  var password = ffVariables["password"];
  var confirmPassword = ffVariables["confirmPassword"];
  var mobile = ffVariables["mobile"];
  var otp = ffVariables["otp"];

  var url = `https://www.indiantalent.org/RESTapi/student/Auth/recover_account`;
  var headers = {};
  var params = {};
  var ffApiRequestBody = `
{
  "mobile": "${mobile}",
  "otp": "${otp}",
  "password": "${password}",
  "confirm_password": "${confirmPassword}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _getAllProductsCall(context, ffVariables) {
  var std = ffVariables["std"];

  var url = `https://www.indiantalent.org/RESTapi/student/products/fetch_products_and_coupons`;
  var headers = {};
  var params = {};
  var ffApiRequestBody = `
{
  "std_id": "${std}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _editprofileCall(context, ffVariables) {
  var token = ffVariables["token"];
  var studentName = ffVariables["studentName"];
  var parentName = ffVariables["parentName"];
  var address = ffVariables["address"];
  var district = ffVariables["district"];
  var state = ffVariables["state"];
  var city = ffVariables["city"];
  var pinCode = ffVariables["pinCode"];
  var schoolName = ffVariables["schoolName"];
  var schoolState = ffVariables["schoolState"];
  var schoolAddress = ffVariables["schoolAddress"];
  var schoolCity = ffVariables["schoolCity"];
  var schoolPincode = ffVariables["schoolPincode"];
  var userName = ffVariables["userName"];

  var url = `https://www.indiantalent.org/RESTapi/student/profile/index`;
  var headers = {};
  var params = {};
  var ffApiRequestBody = `
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
}`;

  return makeApiRequest({
    method: "put",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _subcsriptionsCall(context, ffVariables) {
  var userId = ffVariables["userId"];
  var stdId = ffVariables["stdId"];

  var url = `https://www.indiantalent.org/RESTapi/student/profile/subscriptions`;
  var headers = {};
  var params = {};
  var ffApiRequestBody = `
{
  "user_id": "${userId}",
  "std_id": "${stdId}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _orderprCall(context, ffVariables) {
  var userId = ffVariables["userId"];

  var url = `https://www.indiantalent.org/RESTapi/student/profile/orders`;
  var headers = {};
  var params = {};
  var ffApiRequestBody = `
{
  "user_id": "${userId}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _getServicesCall(context, ffVariables) {
  var url = `https://www.indiantalent.org/RESTapi/student/services/index`;
  var headers = {};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _subjectsCall(context, ffVariables) {
  var stdId = ffVariables["stdId"];
  var userId = ffVariables["userId"];
  var serviceId = ffVariables["serviceId"];

  var url = `https://www.indiantalent.org/RESTapi/student/exam/index`;
  var headers = {};
  var params = {};
  var ffApiRequestBody = `
{
  "std_id": "${stdId}",
  "user_id": "${userId}",
  "service_id": "${serviceId}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _testCall(context, ffVariables) {
  var subjectId = ffVariables["subjectId"];
  var round = ffVariables["round"];
  var stdId = ffVariables["stdId"];
  var userId = ffVariables["userId"];
  var serviceId = ffVariables["serviceId"];

  var url = `https://www.indiantalent.org/RESTapi/student/exam/get_tests`;
  var headers = {};
  var params = {};
  var ffApiRequestBody = `
{
  "subject_id": "${subjectId}",
  "round": "${round}",
  "std_id": "${stdId}",
  "user_id": "${userId}",
  "service_id": "${serviceId}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _getquestionsCall(context, ffVariables) {
  var testId = ffVariables["testId"];
  var userId = ffVariables["userId"];

  var url = `https://www.indiantalent.org/RESTapi/student/exam/get_questions`;
  var headers = {};
  var params = {};
  var ffApiRequestBody = `
{
  "test_id": "${testId}",
  "user_id": "${userId}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _slotCall(context, ffVariables) {
  var slot = ffVariables["slot"];
  var userId = ffVariables["userId"];

  var url = `https://www.indiantalent.org/RESTapi/student/exam/set_annual_slot`;
  var headers = {};
  var params = {};
  var ffApiRequestBody = `
{
  "slot": "${slot}",
  "user_id": "${userId}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _orderssCall(context, ffVariables) {
  var userId = ffVariables["userId"];

  var url = `https://www.indiantalent.org/RESTapi/student/profile/orders`;
  var headers = {};
  var params = {};
  var ffApiRequestBody = `
{
  "user_id": "${userId}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _scheduleCall(context, ffVariables) {
  var stdId = ffVariables["stdId"];
  var serviceId = ffVariables["serviceId"];

  var url = `https://www.indiantalent.org/RESTapi/student/profile/schedule`;
  var headers = {};
  var params = {};
  var ffApiRequestBody = `
{
  "std_id": "${stdId}",
  "service_id": "${serviceId}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _getUsersCall(context, ffVariables) {
  var testId = ffVariables["testId"];
  var attempted = ffVariables["attempted"];
  var userId = ffVariables["userId"];
  var takenTime = ffVariables["takenTime"];
  var sessionId = ffVariables["sessionId"];
  var questionId = ffVariables["questionId"];
  var userAnswer = ffVariables["userAnswer"];
  var userAnswers = ffVariables["userAnswers"];

  var url = `https://www.indiantalent.org/RESTapi/student/exam/exam_response`;
  var headers = {};
  var params = {};
  var ffApiRequestBody = `
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
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _submitanswerstobackendCall(context, ffVariables) {
  var testId = ffVariables["testId"];
  var attemptedQuestions = ffVariables["attemptedQuestions"];
  var userId = ffVariables["userId"];
  var takenTime = ffVariables["takenTime"];
  var sessionId = ffVariables["sessionId"];
  var userAnswers = ffVariables["userAnswers"];

  var url = `https://www.indiantalent.org/RESTapi/student/exam/exam_response`;
  var headers = {};
  var params = {};
  var ffApiRequestBody = `
{
  "test_id": "${testId}",
  "attempted_questions": "${attemptedQuestions}",
  "user_id": "${userId}",
  "taken_time": "${takenTime}",
  "session_id": "${sessionId}",
  "user_answers": ${userAnswers}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _noticesCall(context, ffVariables) {
  var stdId = ffVariables["stdId"];

  var url = `https://www.indiantalent.org/RESTapi/student/profile/notices`;
  var headers = {};
  var params = {};
  var ffApiRequestBody = `
{
  "std_id": "${stdId}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _productsCall(context, ffVariables) {
  var stdId = ffVariables["stdId"];

  var url = `https://www.indiantalent.org/RESTapi/student/products/fetch_products`;
  var headers = {};
  var params = {};
  var ffApiRequestBody = `
{
  "std_id": "${stdId}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _productsSubscriptionCall(context, ffVariables) {
  var userId = ffVariables["userId"];
  var products = ffVariables["products"];
  var payableAmount = ffVariables["payableAmount"];
  var deliveryCharge = ffVariables["deliveryCharge"];
  var powerpackid = ffVariables["powerpackid"];
  var purchaseType = ffVariables["purchaseType"];
  var comboId = ffVariables["comboId"];

  var url = `https://www.indiantalent.org/RESTapi/student/register/get_selected_products`;
  var headers = {};
  var params = {};
  var ffApiRequestBody = `
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
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _getStandardsCall(context, ffVariables) {
  var url = `https://www.indiantalent.org/RESTapi/student/Standard`;
  var headers = {};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _deleteLogsCall(context, ffVariables) {
  var testId = ffVariables["testId"];
  var userid = ffVariables["userid"];

  var url = `https://www.indiantalent.org/RESTapi/student/exam/delete_test_logs`;
  var headers = {};
  var params = {};
  var ffApiRequestBody = `
{
"testId":"${testId}",
"userId":"${userid}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _testingexamCall(context, ffVariables) {
  var userId = ffVariables["userId"];

  var url = `https://www.indiantalent.org/RESTapi/student/exam/resultData`;
  var headers = {};
  var params = { user_id: userId };
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _resultsCall(context, ffVariables) {
  var mobile = ffVariables["mobile"];

  var url = `https://www.indiantalent.org/RESTapi/student/Result`;
  var headers = {};
  var params = {};
  var ffApiRequestBody = `
{
  "mobile": "${mobile}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _roundregistrationCall(context, ffVariables) {
  var mobileNo = ffVariables["mobileNo"];
  var userId = ffVariables["userId"];
  var stdId = ffVariables["stdId"];

  var url = `https://www.indiantalent.org/RESTapi/student/products/fetch_round_two_combos`;
  var headers = {};
  var params = {};
  var ffApiRequestBody = `
{
  "mobile": "${mobileNo}",
  "user_id": "${userId}",
 
  "standard": "${stdId}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _submitregistrationCall(context, ffVariables) {
  var userid = ffVariables["userid"];
  var comboId = ffVariables["comboId"];
  var certificates = ffVariables["certificates"];
  var payment = ffVariables["payment"];
  var slug = ffVariables["slug"];
  var totaldiscount = ffVariables["totaldiscount"];
  var finalamount = ffVariables["finalamount"];
  var deliverycharges = ffVariables["deliverycharges"];
  var isUpdated = ffVariables["isUpdated"];

  var url = `https://www.indiantalent.org/RESTapi/student/Register/round_two`;
  var headers = {};
  var params = {};
  var ffApiRequestBody = `
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
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _phonepeCall(context, ffVariables) {
  var verify = ffVariables["verify"];
  var base = ffVariables["base"];

  var url = `https://api.phonepe.com/apis/hermes/pg/v1/pay`;
  var headers = { "Content-Type": `application/json`, "X-VERIFY": `${verify}` };
  var params = {};
  var ffApiRequestBody = `
{
  "request": "${base}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _paymentStatusCall(context, ffVariables) {
  var merchantId = ffVariables["merchantId"];
  var transactionId = ffVariables["transactionId"];
  var verify = ffVariables["verify"];

  var url = `https://mercury-t2.phonepe.com/v3/transaction/${merchantId}/${transactionId}/status`;
  var headers = { accept: `application/json`, "X-VERIFY": `${verify}` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _phonecallbackCall(context, ffVariables) {
  var success = ffVariables["success"];
  var code = ffVariables["code"];
  var message = ffVariables["message"];
  var data = ffVariables["data"];
  var orderId = ffVariables["orderId"];

  var url = `https://www.indiantalent.org/RESTapi/student/payment/Phonepe_callback`;
  var headers = {};
  var params = {
    success: success,
    code: code,
    message: message,
    data: data,
    order_id: orderId,
  };
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "X_WWW_FORM_URL_ENCODED",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

/// Helper functions to route to the appropriate API Call.

async function makeApiCall(context, data) {
  var callName = data["callName"] || "";
  var variables = data["variables"] || {};

  const callMap = {
    LoginOutsideCall: _loginOutsideCall,
    ForgetPasswordCall: _forgetPasswordCall,
    VerifyOtpPhoneCall: _verifyOtpPhoneCall,
    RegiterCall: _regiterCall,
    ResetpasswordCall: _resetpasswordCall,
    GetAllProductsCall: _getAllProductsCall,
    EditprofileCall: _editprofileCall,
    SubcsriptionsCall: _subcsriptionsCall,
    OrderprCall: _orderprCall,
    GetServicesCall: _getServicesCall,
    SubjectsCall: _subjectsCall,
    TestCall: _testCall,
    GetquestionsCall: _getquestionsCall,
    SlotCall: _slotCall,
    OrderssCall: _orderssCall,
    ScheduleCall: _scheduleCall,
    GetUsersCall: _getUsersCall,
    SubmitanswerstobackendCall: _submitanswerstobackendCall,
    NoticesCall: _noticesCall,
    ProductsCall: _productsCall,
    ProductsSubscriptionCall: _productsSubscriptionCall,
    GetStandardsCall: _getStandardsCall,
    DeleteLogsCall: _deleteLogsCall,
    TestingexamCall: _testingexamCall,
    ResultsCall: _resultsCall,
    RoundregistrationCall: _roundregistrationCall,
    SubmitregistrationCall: _submitregistrationCall,
    PhonepeCall: _phonepeCall,
    PaymentStatusCall: _paymentStatusCall,
    PhonecallbackCall: _phonecallbackCall,
  };

  if (!(callName in callMap)) {
    return {
      statusCode: 400,
      error: `API Call "${callName}" not defined as private API.`,
    };
  }

  var apiCall = callMap[callName];
  var response = await apiCall(context, variables);
  return response;
}

async function makeApiRequest({
  method,
  url,
  headers,
  params,
  body,
  returnBody,
  isStreamingApi,
}) {
  return axios
    .request({
      method: method,
      url: url,
      headers: headers,
      params: params,
      responseType: isStreamingApi ? "stream" : "json",
      ...(body && { data: body }),
    })
    .then((response) => {
      return {
        statusCode: response.status,
        headers: response.headers,
        ...(returnBody && { body: response.data }),
        isStreamingApi: isStreamingApi,
      };
    })
    .catch(function (error) {
      return {
        statusCode: error.response.status,
        headers: error.response.headers,
        ...(returnBody && { body: error.response.data }),
        error: error.message,
      };
    });
}

const _unauthenticatedResponse = {
  statusCode: 401,
  headers: {},
  error: "API call requires authentication",
};

function createBody({ headers, params, body, bodyType }) {
  switch (bodyType) {
    case "JSON":
      headers["Content-Type"] = "application/json";
      return body;
    case "TEXT":
      headers["Content-Type"] = "text/plain";
      return body;
    case "X_WWW_FORM_URL_ENCODED":
      headers["Content-Type"] = "application/x-www-form-urlencoded";
      return qs.stringify(params);
  }
}
function escapeStringForJson(val) {
  if (typeof val !== "string") {
    return val;
  }
  return val
    .replace(/[\\]/g, "\\\\")
    .replace(/["]/g, '\\"')
    .replace(/[\n]/g, "\\n")
    .replace(/[\t]/g, "\\t");
}

module.exports = { makeApiCall };
