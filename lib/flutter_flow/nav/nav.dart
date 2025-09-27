import 'dart:async';

import 'package:flutter/material.dart';
import 'package:indian_talent_olympiad/pages/powerfailure/powerfailure_widget.dart';
import 'package:indian_talent_olympiad/pages/powerwebview/powerwebview_widget.dart';
import 'package:provider/provider.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier, [Widget? entryPage]) =>
    GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? entryPage ?? const NavBarPage()
          : const OnBoardingWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? entryPage ?? const NavBarPage()
              : const OnBoardingWidget(),
        ),
        FFRoute(
          name: 'schedule',
          path: '/schedule',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'schedule')
              : const ScheduleWidget(),
        ),
        FFRoute(
          name: 'service',
          path: '/service',
          builder: (context, params) => const ServiceWidget(),
        ),
        FFRoute(
          name: 'profile',
          path: '/profile',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'profile')
              : const ProfileWidget(),
        ),
        FFRoute(
          name: 'onBoarding',
          path: '/onBoarding',
          builder: (context, params) => const OnBoardingWidget(),
        ),
        FFRoute(
          name: 'walkThrough',
          path: '/walkThrough',
          builder: (context, params) => const WalkThroughWidget(),
        ),
        FFRoute(
          name: 'forgetPassword',
          path: '/forgetPassword',
          builder: (context, params) => const ForgetPasswordWidget(),
        ),
        FFRoute(
          name: 'otpVerify',
          path: '/otpVerify',
          builder: (context, params) => const OtpVerifyWidget(),
        ),
        FFRoute(
          name: 'resetPassword',
          path: '/resetPassword',
          builder: (context, params) => ResetPasswordWidget(
            phonenumber: params.getParam('phonenumber', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'paymentSuccess',
          path: '/paymentSuccess',
          builder: (context, params) => const PaymentSuccessWidget(),
        ),
        FFRoute(
          name: 'monthlyexam',
          path: '/monthlyexam',
          builder: (context, params) => MonthlyexamWidget(
            serviceid: params.getParam('serviceid', ParamType.String),
            choosenservice: params.getParam('choosenservice', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'annualExamStart',
          path: '/annualExamStart',
          builder: (context, params) => AnnualExamStartWidget(
            subjectid: params.getParam('subjectid', ParamType.String),
            serviceid: params.getParam('serviceid', ParamType.String),
            choosensubject: params.getParam('choosensubject', ParamType.String),
            alias: params.getParam('alias', ParamType.String),
             round: params.getParam('round', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'editProfile',
          path: '/editProfile',
          builder: (context, params) => const EditProfileWidget(),
        ),
        FFRoute(
          name: 'powerPackages',
          path: '/powerPackages',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'powerPackages')
              : const PowerPackagesWidget(),
        ),
         FFRoute(
          name: 'subscription',
          path: '/subscription',
          builder: (context, params) => SubscriptionWidget(
            serviceName: params.getParam('serviceName', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'myOrders',
          path: '/myOrders',
          builder: (context, params) => const MyOrdersWidget(),
        ),
        FFRoute(
          name: 'testpage',
          path: '/testpage',
          builder: (context, params) => TestpageWidget(
            testId: params.getParam(
              'testId',
              ParamType.String,
            ),
            timer: params.getParam(
              'timer',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Auth1Login',
          path: '/auth1Login',
          builder: (context, params) => const Auth1LoginWidget(),
        ),
        FFRoute(
          name: 'Auth1register',
          path: '/auth1register',
          builder: (context, params) => const Auth1registerWidget(),
        ),
        FFRoute(
          name: 'Homepagelogin',
          path: '/homepagelogin',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'Homepagelogin')
              : const HomepageloginWidget(),
        ),
        FFRoute(
          name: 'aftersubmit',
          path: '/aftersubmit',
          builder: (context, params) => AftersubmitWidget(
            testid: params.getParam('testid', ParamType.String),
            totaltime: params.getParam('totaltime', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'helpPage',
          path: '/helpPage',
          builder: (context, params) => const HelpPageWidget(),
        ),
        FFRoute(
          name: 'termsAndconditions',
          path: '/termsAndconditions',
          builder: (context, params) => const TermsAndconditionsWidget(),
        ),
        FFRoute(
          name: 'privacyPolicy',
          path: '/privacyPolicy',
          builder: (context, params) => const PrivacyPolicyWidget(),
        ),
        FFRoute(
          name: 'Deletionofrequest',
          path: '/deletionofrequest',
          builder: (context, params) => const DeletionofrequestWidget(),
        ),
        FFRoute(
          name: 'notices',
          path: '/notices',
          builder: (context, params) => const NoticesWidget(),
        ),
        FFRoute(
          name: 'demo',
          path: '/demo',
          builder: (context, params) => const DemoWidget(),
        ),
        FFRoute(
          name: 'webview_payment',
          path: '/webviewPayment',
          builder: (context, params) => WebviewPaymentWidget(
            payurl: params.getParam('payurl', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'Cartvalue',
          path: '/cartvalue',
          builder: (context, params) => const CartvalueWidget(),
        ),
        FFRoute(
          name: 'finalpaybutton',
          path: '/finalpaybutton',
          builder: (context, params) => FinalpaybuttonWidget(
            orderid: params.getParam('orderid', ParamType.String),
            finalamount: params.getParam('finalamount', ParamType.double),
          ),
        ),
        FFRoute(
          name: 'paymentfailure',
          path: '/paymentfailure',
          builder: (context, params) => const PaymentfailureWidget(),
        ),
        FFRoute(
          name: 'productsmenu',
          path: '/productsmenu',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'productsmenu')
              : const ProductsmenuWidget(),
        ),
        FFRoute(
          name: 'refundpolicy',
          path: '/refundpolicy',
          builder: (context, params) => const RefundpolicyWidget(),
        ),
        FFRoute(
          name: 'roundregistration',
          path: '/roundregistration',
          builder: (context, params) => const RoundregistrationWidget(),
        ),
        FFRoute(
          name: 'results',
          path: '/results',
          builder: (context, params) => const ResultsWidget(),
        ),
        FFRoute(
          name: 'CartvalueCopy',
          path: '/cartvalueCopy',
          builder: (context, params) => const CartvalueCopyWidget(),
        ),
        FFRoute(
          name: 'productWebview',
          path: '/productWebview',
          builder: (context, params) => ProductWebviewWidget(
            payurl: params.getParam('payurl', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'productFailure',
          path: '/productFailure',
          builder: (context, params) => const ProductFailureWidget(),
        ),
        FFRoute(
          name: 'summerquiz',
          path: '/summerquiz',
          builder: (context, params) => const SummerquizWidget(),
        ),
        FFRoute(
          name: 'annualExam',
          path: '/annualExam',
          builder: (context, params) => AnnualExamWidget(
            serviceid: params.getParam('serviceid', ParamType.String),
            choosenservice: params.getParam('choosenservice', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'quizdetails',
          path: '/quizdetails',
          builder: (context, params) => const QuizdetailsWidget(),
        ),
        FFRoute(
          name: 'round2result',
          path: '/round2result',
          builder: (context, params) => const Round2resultWidget(),
        ),
        FFRoute(
          name: 'Coupons',
          path: '/coupons',
          builder: (context, params) => const CouponsWidget(),
        ),
        FFRoute(
          name: 'certificateViewer',
          path: '/certificateViewer',
          builder: (context, params) => CertificateViewerWidget(
            resultId: params.getParam('resultId', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'powerProducts',
          path: '/powerProducts',
          builder: (context, params) => PowerProductsWidget(
            productId: params.getParam('productId', ParamType.JSON),
          ),
        ),
         FFRoute(
          name: 'notifications',
          path: '/notifications',
          builder: (context, params) => const NotificationsWidget(),
        ),
        FFRoute(
          name: 'powerwebview',
          path: '/powerwebview',
          builder: (context, params) => PowerwebviewWidget(
            payurl: params.getParam('payurl', ParamType.String),
            productid: params.getParam('productid', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'powerfailure',
          path: '/powerfailure',
          builder: (context, params) => PowerfailureWidget(
            payurl: params.getParam('payurl', ParamType.String),
            productid: params.getParam('productid', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'outOfversion',
          path: '/outOfversion',
          builder: (context, params) => const OutOfversionWidget(),
        ),
        FFRoute(
          name: 'testDetails',
          path: '/testDetails',
          builder: (context, params) => TestDetailsWidget(
            testId: params.getParam(
              'testId',
              ParamType.String,
            ),
            time: params.getParam(
              'time',
              ParamType.String,
            ),
            alias: params.getParam(
              'alias',
              ParamType.String,
            ),
            testName: params.getParam(
              'testName',
              ParamType.String,
            ),
            totalTime: params.getParam(
              'totalTime',
              ParamType.String,
            ),
             category: params.getParam(
              'category',
              ParamType.String,
            ), 
             subjectName: params.getParam(
              'subjectName',
              ParamType.String,
            ), 
            stdid: params.getParam(
              'stdid',
              ParamType.String,
            ), 
            totalquestion: params.getParam(
              'totalquestion',
              ParamType.String,
            ),
             totalmarks: params.getParam(
              'totalmarks',
              ParamType.String,
            )
          ),
        )
        
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/onBoarding';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.white,
                  child: Center(
                    child: Image.asset(
                      'assets/images/ITO_Pencil_Logo_with_name.png',
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 300),
      );
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
