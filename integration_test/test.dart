
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:indian_talent_olympiad/main.dart';
import 'package:indian_talent_olympiad/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';
import 'package:indian_talent_olympiad/backend/firebase/firebase_config.dart';
import 'package:indian_talent_olympiad/auth/firebase_auth/auth_util.dart';


void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  testWidgets('Regitration page', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: const MyApp(),
    ));

    await tester.enterText(find.byKey(const ValueKey('TextField_q8c8')), 'Megha');
    await tester.enterText(find.byKey(const ValueKey('TextField_1w5e')), 'Honnappa');
    await tester.enterText(
        find.byKey(const ValueKey('TextField_e33n')), 'honnappa@gmail.com');
    await tester.enterText(
        find.byKey(const ValueKey('TextField_w3il')), '8088215512');
    await tester.enterText(find.byKey(const ValueKey('TextField_x2g0')), 'Bangalore');
    await tester.enterText(find.byKey(const ValueKey('TextField_b8tt')), 'PPEC');
    await tester.enterText(find.byKey(const ValueKey('TextField_7sea')), 'Karnataka');
    await tester.enterText(find.byKey(const ValueKey('TextField_chcn')), 'Bangalore');
    await tester.tap(find.byKey(const ValueKey('DropDown_0vrd')));
    await tester.enterText(find.byKey(const ValueKey('TextField_mbbb')), 'megha@123');
    await tester.enterText(find.byKey(const ValueKey('TextField_l7dt')), 'megha@123');
    await tester.pumpAndSettle();
    expect(find.text('Welcome back!'), findsWidgets);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
