import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indian_talent_olympiad/school/bloc/auth/school_auth_bloc.dart';
import 'package:indian_talent_olympiad/school/data/repositories/school_auth_repository.dart';
import 'package:indian_talent_olympiad/school/data/services/school_api_service.dart';
import 'package:indian_talent_olympiad/school/presentation/dashboard/school_dashboard_page.dart';
import 'package:indian_talent_olympiad/school/presentation/login/school_login_page.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

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
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? entryPage ?? NavBarPage()
          : OnBoardingWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? entryPage ?? NavBarPage()
              : OnBoardingWidget(),
        ),
        FFRoute(
          name: ScheduleWidget.routeName,
          path: ScheduleWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'schedule')
              : ScheduleWidget(),
        ),
        FFRoute(
          name: ServiceWidget.routeName,
          path: ServiceWidget.routePath,
          builder: (context, params) => ServiceWidget(),
        ),
        FFRoute(
          name: ProfileWidget.routeName,
          path: ProfileWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'profile')
              : ProfileWidget(),
        ),
        FFRoute(
          name: OnBoardingWidget.routeName,
          path: OnBoardingWidget.routePath,
          builder: (context, params) => OnBoardingWidget(),
        ),
        FFRoute(
          name: WalkThroughWidget.routeName,
          path: WalkThroughWidget.routePath,
          builder: (context, params) => WalkThroughWidget(),
        ),
        FFRoute(
          name: ForgetPasswordWidget.routeName,
          path: ForgetPasswordWidget.routePath,
          builder: (context, params) => ForgetPasswordWidget(),
        ),
        FFRoute(
          name: OtpVerifyWidget.routeName,
          path: OtpVerifyWidget.routePath,
          builder: (context, params) => OtpVerifyWidget(),
        ),
        FFRoute(
          name: ResetPasswordWidget.routeName,
          path: ResetPasswordWidget.routePath,
          builder: (context, params) => ResetPasswordWidget(
            phonenumber: params.getParam(
              'phonenumber',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: PaymentSuccessWidget.routeName,
          path: PaymentSuccessWidget.routePath,
          builder: (context, params) => PaymentSuccessWidget(),
        ),
        FFRoute(
          name: MonthlyexamWidget.routeName,
          path: MonthlyexamWidget.routePath,
          builder: (context, params) => MonthlyexamWidget(
            serviceid: params.getParam(
              'serviceid',
              ParamType.String,
            ),
            choosenservice: params.getParam(
              'choosenservice',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: AnnualExamStartWidget.routeName,
          path: AnnualExamStartWidget.routePath,
          builder: (context, params) => AnnualExamStartWidget(
            subjectid: params.getParam(
              'subjectid',
              ParamType.String,
            ),
            serviceid: params.getParam(
              'serviceid',
              ParamType.String,
            ),
            choosensubject: params.getParam(
              'choosensubject',
              ParamType.String,
            ),
            alias: params.getParam(
              'alias',
              ParamType.String,
            ),
            round: params.getParam(
              'round',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: EditProfileWidget.routeName,
          path: EditProfileWidget.routePath,
          builder: (context, params) => EditProfileWidget(),
        ),
        FFRoute(
          name: PowerPackagesWidget.routeName,
          path: PowerPackagesWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'powerPackages')
              : PowerPackagesWidget(),
        ),
        FFRoute(
          name: SubscriptionWidget.routeName,
          path: SubscriptionWidget.routePath,
          builder: (context, params) => SubscriptionWidget(
            serviceName: params.getParam(
              'serviceName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: MyOrdersWidget.routeName,
          path: MyOrdersWidget.routePath,
          builder: (context, params) => MyOrdersWidget(),
        ),
        FFRoute(
          name: TestpageWidget.routeName,
          path: TestpageWidget.routePath,
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
          name: Auth1LoginWidget.routeName,
          path: Auth1LoginWidget.routePath,
          builder: (context, params) => Auth1LoginWidget(),
        ),
        FFRoute(
          name: Auth1registerWidget.routeName,
          path: Auth1registerWidget.routePath,
          builder: (context, params) => Auth1registerWidget(),
        ),
        FFRoute(
          name: HomepageloginWidget.routeName,
          path: HomepageloginWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Homepagelogin')
              : HomepageloginWidget(),
        ),
        FFRoute(
          name: AftersubmitWidget.routeName,
          path: AftersubmitWidget.routePath,
          builder: (context, params) => AftersubmitWidget(
            testid: params.getParam(
              'testid',
              ParamType.String,
            ),
            totaltime: params.getParam(
              'totaltime',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: HelpPageWidget.routeName,
          path: HelpPageWidget.routePath,
          builder: (context, params) => HelpPageWidget(),
        ),
        FFRoute(
          name: TermsAndconditionsWidget.routeName,
          path: TermsAndconditionsWidget.routePath,
          builder: (context, params) => TermsAndconditionsWidget(),
        ),
        FFRoute(
          name: PrivacyPolicyWidget.routeName,
          path: PrivacyPolicyWidget.routePath,
          builder: (context, params) => PrivacyPolicyWidget(),
        ),
        FFRoute(
          name: DeletionofrequestWidget.routeName,
          path: DeletionofrequestWidget.routePath,
          builder: (context, params) => DeletionofrequestWidget(),
        ),
        FFRoute(
          name: NoticesWidget.routeName,
          path: NoticesWidget.routePath,
          builder: (context, params) => NoticesWidget(),
        ),
        FFRoute(
          name: DemoWidget.routeName,
          path: DemoWidget.routePath,
          builder: (context, params) => DemoWidget(),
        ),
        FFRoute(
          name: WebviewPaymentWidget.routeName,
          path: WebviewPaymentWidget.routePath,
          builder: (context, params) => WebviewPaymentWidget(
            payurl: params.getParam(
              'payurl',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: CartvalueWidget.routeName,
          path: CartvalueWidget.routePath,
          builder: (context, params) => CartvalueWidget(),
        ),
        FFRoute(
          name: FinalpaybuttonWidget.routeName,
          path: FinalpaybuttonWidget.routePath,
          builder: (context, params) => FinalpaybuttonWidget(
            orderid: params.getParam(
              'orderid',
              ParamType.String,
            ),
            finalamount: params.getParam(
              'finalamount',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: PaymentfailureWidget.routeName,
          path: PaymentfailureWidget.routePath,
          builder: (context, params) => PaymentfailureWidget(),
        ),
        FFRoute(
          name: ProductsmenuWidget.routeName,
          path: ProductsmenuWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'productsmenu')
              : ProductsmenuWidget(),
        ),
        FFRoute(
          name: RefundpolicyWidget.routeName,
          path: RefundpolicyWidget.routePath,
          builder: (context, params) => RefundpolicyWidget(),
        ),
        FFRoute(
          name: RoundregistrationWidget.routeName,
          path: RoundregistrationWidget.routePath,
          builder: (context, params) => RoundregistrationWidget(),
        ),
        FFRoute(
          name: ResultsWidget.routeName,
          path: ResultsWidget.routePath,
          builder: (context, params) => ResultsWidget(),
        ),
        FFRoute(
          name: CartvalueCopyWidget.routeName,
          path: CartvalueCopyWidget.routePath,
          builder: (context, params) => CartvalueCopyWidget(),
        ),
        FFRoute(
          name: ProductWebviewWidget.routeName,
          path: ProductWebviewWidget.routePath,
          builder: (context, params) => ProductWebviewWidget(
            payurl: params.getParam(
              'payurl',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ProductFailureWidget.routeName,
          path: ProductFailureWidget.routePath,
          builder: (context, params) => ProductFailureWidget(),
        ),
        FFRoute(
          name: SummerquizWidget.routeName,
          path: SummerquizWidget.routePath,
          builder: (context, params) => SummerquizWidget(),
        ),
        FFRoute(
          name: AnnualExamWidget.routeName,
          path: AnnualExamWidget.routePath,
          builder: (context, params) => AnnualExamWidget(
            serviceid: params.getParam(
              'serviceid',
              ParamType.String,
            ),
            choosenservice: params.getParam(
              'choosenservice',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: QuizdetailsWidget.routeName,
          path: QuizdetailsWidget.routePath,
          builder: (context, params) => QuizdetailsWidget(),
        ),
        FFRoute(
          name: Round2resultWidget.routeName,
          path: Round2resultWidget.routePath,
          builder: (context, params) => Round2resultWidget(),
        ),
        FFRoute(
          name: CouponsWidget.routeName,
          path: CouponsWidget.routePath,
          builder: (context, params) => CouponsWidget(),
        ),
        FFRoute(
          name: CertificateViewerWidget.routeName,
          path: CertificateViewerWidget.routePath,
          builder: (context, params) => CertificateViewerWidget(
            resultId: params.getParam(
              'resultId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: PowerProductsWidget.routeName,
          path: PowerProductsWidget.routePath,
          builder: (context, params) => PowerProductsWidget(
            productId: params.getParam(
              'productId',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: NotificationsWidget.routeName,
          path: NotificationsWidget.routePath,
          builder: (context, params) => NotificationsWidget(),
        ),
        FFRoute(
          name: TestpagetestingdummyWidget.routeName,
          path: TestpagetestingdummyWidget.routePath,
          builder: (context, params) => TestpagetestingdummyWidget(
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
          name: PowercartWidget.routeName,
          path: PowercartWidget.routePath,
          builder: (context, params) => PowercartWidget(),
        ),
        FFRoute(
          name: PowerwebviewWidget.routeName,
          path: PowerwebviewWidget.routePath,
          builder: (context, params) => PowerwebviewWidget(
            payurl: params.getParam(
              'payurl',
              ParamType.String,
            ),
            productid: params.getParam(
              'productid',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: PowerfailureWidget.routeName,
          path: PowerfailureWidget.routePath,
          builder: (context, params) => PowerfailureWidget(
            payurl: params.getParam(
              'payurl',
              ParamType.String,
            ),
            productid: params.getParam(
              'productid',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: TestDetailsWidget.routeName,
          path: TestDetailsWidget.routePath,
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
            ),
          ),
        ),
        FFRoute(
          name: OutOfversionWidget.routeName,
          path: OutOfversionWidget.routePath,
          builder: (context, params) => OutOfversionWidget(),
        ),
        FFRoute(
          name: MonthlyexamCopyWidget.routeName,
          path: MonthlyexamCopyWidget.routePath,
          builder: (context, params) => MonthlyexamCopyWidget(
            serviceid: params.getParam(
              'serviceid',
              ParamType.String,
            ),
            choosenservice: params.getParam(
              'choosenservice',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: CartvalueCopyCopyWidget.routeName,
          path: CartvalueCopyCopyWidget.routePath,
          builder: (context, params) => CartvalueCopyCopyWidget(),
        ),

        //School Navigation
       FFRoute(
  name: 'SchoolLogin',
  path: '/school-login',
  builder: (context, params) {
    return RepositoryProvider(
      create: (_) => SchoolApiService(),
      child: RepositoryProvider(
        create: (context) => SchoolAuthRepository(
          apiService: context.read<SchoolApiService>(),
        ),
        child: BlocProvider(
          create: (context) => SchoolAuthBloc(
            repository: context.read<SchoolAuthRepository>(),
          ),
          child: const SchoolLoginPage(),
        ),
      ),
    );
  },
),
FFRoute(
  name: 'SchoolDashboard',
  path: '/school-dashboard',
  builder: (context, params) => const SchoolDashboardPage(),
),



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
      (state.allParams.length == 1 &&
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
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
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
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
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
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  child: Center(
                    child: Image.asset(
                      'assets/images/indian-talent-olympiad-new-logo.png',
                      width: MediaQuery.sizeOf(context).width * 0.6,
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

  static TransitionInfo appDefault() => TransitionInfo(
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

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
