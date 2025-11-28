import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi', 'mr', 'kn'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
    String? mrText = '',
    String? knText = '',
  }) =>
      [enText, hiText, mrText, knText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // schedule
  {
    '0lhtqklb': {
      'en': 'Olympiad Exams',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'xz4fot1o': {
      'en': 'Saturday Tests',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ur85jst5': {
      'en': 'Schedule',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ev0f5aag': {
      'en': 'Schedule',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // service
  {
    '13qtp0iv': {
      'en': 'Services',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '3527l2pb': {
      'en': 'Service',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // profile
  {
    '0zberw20': {
      'en': 'Profile',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'knsmhll4': {
      'en': 'Student',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '68y3oq65': {
      'en': 'Edit  Profile',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '9sklizon': {
      'en': 'School Name',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'dxembudd': {
      'en': 'Standard',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '7zh174zt': {
      'en': 'Mobile Number',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'yasvhqa5': {
      'en': 'My Subscriptions',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'qs4dh6nb': {
      'en': 'My Orders',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'gxvk1k7f': {
      'en': 'My Results',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'gs4e99au': {
      'en': 'My Results',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'nht371of': {
      'en': 'Notice',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '72iq5qk6': {
      'en': 'Special Offers',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'onmqulq9': {
      'en': 'Help Center',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'pml1uqgo': {
      'en': 'Terms And Conditions',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'i163r840': {
      'en': 'Privacy Policy',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'v5y9e6ft': {
      'en': 'Refund Policy',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '6gaztrpy': {
      'en': 'Request Deletion Of Account',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '838acrr5': {
      'en': 'Log Out',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    't52zgx8w': {
      'en': 'Profile',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // onBoarding
  {
    'yjeghw32': {
      'en': 'Skip',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ebi618m2': {
      'en': 'Comprehensive Testing',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'jvp6p828': {
      'en':
          'Get ready to your exams with our comprehensive testing suite. Take mock tests, practice exams, and annual assessments to prepare for success.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'yqa08chn': {
      'en': 'Skip',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'z9v22edw': {
      'en': 'Test History and Performance',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'j7m4mxis': {
      'en':
          'you can monitor your progress, review your test history, distinguish between attempted and unattempted tests, and witness your growth unfold over time.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'za2tngdn': {
      'en': 'Visualize Your Success',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'tzx0d5wx': {
      'en':
          'Visualize your journey to success! Dive into performance graphs that help you understand your strengths and areas for improvement.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '44yn6hpj': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // walkThrough
  {
    'kuh10ruk': {
      'en':
          'You\'re all set! Let\'s start your journey towards academic excellence. Tap \'Start Now\' to begin exploring app',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'v7szmvwc': {
      'en': 'Login',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ub44gpw2': {
      'en': 'New Register',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '0ui2sn1y': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // forgetPassword
  {
    'ucmr90sp': {
      'en': 'Forgot Password',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'yz8kt8ms': {
      'en': 'Forgot Password',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'r58ye3jk': {
      'en':
          'Don’t worry it happens. please enter the Mobile Number associated with your account. ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'wgnrtg9m': {
      'en': 'Mobile',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'wnqu3qlp': {
      'en': 'Enter Your Mobile Number',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ow5lhv0m': {
      'en': 'Send OTP',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'gvzy2mez': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // otpVerify
  {
    'abv7i6dj': {
      'en':
          'A Six digit number is sent on your email.\nPlease enter for verification number',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'xgce04i6': {
      'en': 'OTP Authentication',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'kx8g7s30': {
      'en': 'Verify OTP',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'rnmgpki8': {
      'en': 'Enter OTP',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ehn3voi6': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // resetPassword
  {
    'z9esxu48': {
      'en': 'Reset Password',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'xgie37mp': {
      'en': 'Reset Password',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'sigy6cpn': {
      'en': 'Enter OTP',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'eta66adk': {
      'en': 'New  Password',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '4y2pv2hm': {
      'en': 'Confirm  Password',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'wyooz2zp': {
      'en': 'Change Password',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'xpsklopv': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // paymentSuccess
  {
    'gg4muri2': {
      'en': 'Success!',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'hes5pogu': {
      'en':
          'Thankyou for your order. A copy of the invoice will be sent to your email address.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'gbj1fom8': {
      'en': 'Home Page',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'y5hzdxyl': {
      'en': 'Success',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ct39nxuk': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // monthlyexam
  {
    'wmg69ah6': {
      'en': 'Buy Now',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'g6ah7uqi': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // annualExamStart
  {
    'yydb38vj': {
      'en': 'Test',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'cklmkiq6': {
      'en': 'Result',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'f42ez5r5': {
      'en': 'Practise Test',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'h0xjk98j': {
      'en': 'Start Test',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'vskxbwjm': {
      'en': 'Start Test',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'nu8m86pe': {
      'en': 'Buy Now',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'utlb7p7c': {
      'en': 'Test',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '9b3117uf': {
      'en': 'Result',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'klk35z6s': {
      'en': 'Test Name',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'txshdhqa': {
      'en': 'Score',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'crpdmd6w': {
      'en': 'Date',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'atgsaauz': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // editProfile
  {
    'nbickxmg': {
      'en': 'Edit Profile',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'psmp10d7': {
      'en': 'Edit Profile',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '7j4truf8': {
      'en': 'Student Name',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ev0fm8lu': {
      'en': 'Student Name',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'jkanu6xh': {
      'en': 'Mobile Number',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'wfa8b0ui': {
      'en': 'Mobile No',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'vb2xv1xr': {
      'en': 'Parent\'s Email',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'k4dn27g7': {
      'en': 'User Name',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'hk5w03cl': {
      'en': 'Parent’s Name',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ktljmaut': {
      'en': 'Parent’s Name',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'zcaic49v': {
      'en': 'Postal Address',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ru2d3fhy': {
      'en': 'Address',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'm2a711rp': {
      'en': 'Address',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'fokiu55k': {
      'en': 'District',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'q5j8lk02': {
      'en': 'District',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '7vwhhypu': {
      'en': 'State',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ixh5c2tq': {
      'en': 'State',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'jqcuahqn': {
      'en': 'City',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ugryr4aq': {
      'en': 'City',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'm4ejm7su': {
      'en': 'Pin Code',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '4awpo02z': {
      'en': 'Pin Code',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '2cxgs2ta': {
      'en': 'School Details',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'si17vigj': {
      'en': 'School Name',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'b46ztmkm': {
      'en': 'School Name',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '63392axd': {
      'en': 'School Address',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'bg345486': {
      'en': 'School Address',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    't9gmrusd': {
      'en': 'School City',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'w2l3ckf3': {
      'en': 'School City',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'n7w8dflp': {
      'en': 'School State',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'xqml6y5s': {
      'en': 'School State',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'vktnb9x8': {
      'en': 'School Pin Code',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '8st8e63c': {
      'en': 'School Pin Code',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'i82ysvhv': {
      'en': 'UserName',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '4yzbwj28': {
      'en': 'Username',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '9mvwv57d': {
      'en': 'Update',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'vh0yxfrz': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // powerPackages
  {
    'h526nx3j': {
      'en': 'Power Packages',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '3p380dgi': {
      'en': 'Buy',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'revwv0jf': {
      'en': 'Power Packages',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // subscription
  {
    'r5v23md7': {
      'en': 'My Subscriptions',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'm36votur': {
      'en': 'Sr.No',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'lf8q88su': {
      'en': 'Subject Name',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '74ikobry': {
      'en': 'Purchase date',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'isa0zys0': {
      'en': 'Expiry Date',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'e609leoi': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // myOrders
  {
    '0qm8jz6b': {
      'en': 'My Orders',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'hmcwa06i': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // testpage
  {
    's359z0hh': {
      'en': 'Start time',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'prq5kn4s': {
      'en': 'End time',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'rty09c85': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // Auth1Login
  {
    '34oi8aac': {
      'en': 'Student',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ccm8817s': {
      'en': 'Welcome to ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'gdxu3xyk': {
      'en': 'Please enter your mobile number below to start using app.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '3cxu5ios': {
      'en': 'Mobile No.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'steeiuai': {
      'en': 'Password ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'bj1tqg1e': {
      'en': 'Remember me',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '8npf2paw': {
      'en': 'Forgot Password ?',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'gnq7xyn9': {
      'en': 'Sign in',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '1ho21nwk': {
      'en': 'Not a member',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'a3hvf9hp': {
      'en': 'Join now',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'qopnima2': {
      'en': 'School',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '4c1m3un8': {
      'en': 'Please Fill the Register Form From Desktop only',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'gtx20gcr': {
      'en': 'Login',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'iyb56717': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // Auth1register
  {
    'k0fy032f': {
      'en': 'Student',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'zs6g6l15': {
      'en': 'Welcome to ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '1b6jbwbh': {
      'en': 'Student Name',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'qa5ii1n8': {
      'en': 'Parent Name',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '4f5v6rsr': {
      'en': 'Parent Email',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'zi7x9w34': {
      'en': 'Mobile Number',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'smqeb8r0': {
      'en': 'Address',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'wv36n2ps': {
      'en': 'School Name',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '3u5cpchn': {
      'en': 'State',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '59elty3l': {
      'en': 'City',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'g0pwhp2b': {
      'en': 'Please select standard',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'gr6y2ki2': {
      'en': 'Search for an item...',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'z1f19rd6': {
      'en': 'Password',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '0es8vf2p': {
      'en': 'Confirm Password',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'n5h0wdi4': {
      'en': 'Register',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'tipvfl1q': {
      'en': 'Already  a member',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '6g0cnvs2': {
      'en': 'login now',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'mgn0xv1u': {
      'en': 'Field is required',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '8q24lqtt': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'l1yyfu14': {
      'en': 'Field is required',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'nl179c1o': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'qrn3es1x': {
      'en': 'Field is required',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'pahbben8': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'e4n8dakc': {
      'en': 'Field is required',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '22m51zln': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'myi13k9q': {
      'en': 'Field is required',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ne6tmzae': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'stb2jwg7': {
      'en': 'Field is required',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'p8cpoy8b': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '3w09b3ig': {
      'en': 'Field is required',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'akmplkgn': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'jsv13ayi': {
      'en': 'Field is required',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '94kv5ksc': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ou9aznvh': {
      'en': 'Field is required',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ougu9s4c': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '7ij6lu1t': {
      'en': 'Field is required',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'key34siz': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ybyd08sj': {
      'en': 'School',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'p9xbahvz': {
      'en': 'Please Fill the Register Form From Desktop only',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '3bztodxi': {
      'en': 'Register',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ek1cld4k': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // Homepagelogin
  {
    '1mqf9cgg': {
      'en': 'Welcome back!',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '0q5965g5': {
      'en': 'Category',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'cd2w6etw': {
      'en': 'View All',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '2jau4ht2': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // aftersubmit
  {
    'jwu5nwmn': {
      'en': 'Submitting test',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'qvqfypux': {
      'en': 'Woohoo! You’ve Made It! 🎊',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'v38dczqc': {
      'en': 'We’re submitting your exam now',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '01gw6jiy': {
      'en': 'Please don’t press the back button\n or\n close the app.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'bvfj3qgw': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // helpPage
  {
    '38odbav4': {
      'en': 'Help Center',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '1hfgohhe': {
      'en': 'How May We Help You ?',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ogu8nqmx': {
      'en': 'Call Us',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'mr9t5pcp': {
      'en': 'Toll Free',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'dx9xsol2': {
      'en': '1800 266 9192',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'gxt0m0xm': {
      'en': '022 2517 0711',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'wmjzbhpf': {
      'en': '022 2517 0811',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'e6lksaio': {
      'en': 'Contact No.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ni2ypiu4': {
      'en': '+91 9987930600',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '5m4jqhc8': {
      'en': '+91 9987621382',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '781y8exd': {
      'en': 'Email Us',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'zjit8llm': {
      'en': 'Email ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ixq3t0l6': {
      'en': 'support@indiantalent.org',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'z4qhikas': {
      'en': 'Contact Us At',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'f86dokg3': {
      'en': 'Indian Talent is a part of\nITOlympiad Education Pvt Ltd',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '0lcdzdpc': {
      'en':
          'No. 1005, Kailas Corporate Lounge, Veer Savarkar Marg, Powai Vikhroli Link Road, Vikhroli(W), Mumbai - 400079',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'e6h79no7': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // termsAndconditions
  {
    'tar5nzwh': {
      'en': 'Terms And Conditions',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'rvzp0xy4': {
      'en': 'Terms & Conditions',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'by14fl7u': {
      'en':
          'Students, parents, and schools are requested to carefully go through the Terms and Conditions.\n\n ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ixwntuce': {
      'en': 'GENERAL TERMS & CONDITIONS:',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'mpl41omy': {
      'en':
          'By Registering to Indian Talent Olympiad, you consent to comply with the standards and approaches nitty gritty underneath.\n\nUtilizing our Site or Apps incorporates yet isn\'t restricted to making a record, buying and utilizing Digital Content, posting a survey, or in any case review, visiting, or utilizing any intuitive highlights on our site/application.\n\nBy enrolling, you license us to add your email to the pamphlet membership list. You likewise license us to send normal email pamphlets on your enlisted email id. You likewise permit us to send limited-time messages and SMS, on your enrolled email ID and enlisted portable number.\n\nUtilization of the Content on our site/application is administered by the terms referenced beneath. This incorporates any Digital Content or some other items and administrations ready to move on our site/application (aggregately called the \"Content\") which is the protected work of us or our Suppliers.\n\nNo Content from this site/application might be replicated, republished, duplicated, transferred, posted, communicated or dispersed in any capacity other.\n\nBy buying from our Site/application, you affirm that you comprehend and concur that we won\'t discount your Digital Content on the off chance that you basically:\n\n1. Didn\'t understand there are limitations on computerized content use.\n\n2. Try not to have the correct framework or software details needed to access and utilize your advanced substance appropriately.\n\n3. Didn\'t check the prerequisites of your course before buy to guarantee the computerized content matches the necessities of your educational program.\n\n \n\nThe site grants the most extreme 5 endeavors for every test. Conveyance and utilization of the substance for educational costs and by instructing foundations for business designs is rigorously denied.\n\nYou may not make any benefit from the utilization of this material/substance or data and you may not make some other copies, distribute logins or adjust, make any work got from, republish, unveil accessible to the, spread, or communicate any of it, or adventure any of it for any business reason, without first getting our composed authorization. On the off chance that you present any material for incorporation on this site (counting any presenting on any piece of this site), you award us an uncertain, sovereignty free, around the world, non-elite permit to utilize, replicate, alter, adjust, make an interpretation of and disclose accessible to the, join or remember for different works, that material and any concentrates from it. We may concede sub-licenses of these rights.\n\nOn any purchase of study materials allow at least 15-20 working days for delivery (based on India Post/Courier Delivery Standards) of from the date of receipt of order at Indian Talent Olympiad office. If order is placed on any National, State or Regional holiday, the order will be processed on the next day.\n\nBy buying any Digital Content from us, you recognize that you comprehend and concur it is your duty to guarantee your PC, tablet or shrewd gadget meets the base framework and software particulars needed for the advanced substance to deliver appropriately and for the essential software to work. On the off chance that you don\'t know, we unequivocally prescribe you to test our example computerized content prior to purchasing.\n\nWe claim all authority to change or cease the proposal of any Digital Content or different items and administrations whenever. For Digital Content, contingent upon the Suppliers expressions and conditions, it is conceivable that after you have effectively bought a specific Digital Content, that further buy may not be accessible and a discount is unimaginable.\n\nNow and again, we may offer limited time limits and additionally uncommon offers, which are liable to change and accessibility. The limits and offers apply to recorded Digital Content, items, and benefits and must be utilized as determined. Limited time markdown codes can\'t be utilized reflectively and can\'t be utilized with some other offer. We maintain all authority to pull out limited-time limits and additionally unique proposals whenever.\n\nAlbeit the managers and mediators will endeavor to keep all questionable messages off this site/application, it is outlandish for us to survey all messages. All messages express the perspectives of the creator, and neither the proprietors of ITO will be considered liable for the substance of any message.\n\nBy consenting to these guidelines, you warrant that you won\'t post any messages that are disgusting, foul, explicitly arranged, derisive, undermining, or in any case violative of any laws.\n\nThe proprietors of ITO claim all authority to eliminate, alter, move or close any substance thing under any circumstance.\n\nIf people browsing the website, do not agree to the Policies along with Terms & Conditions laid by the Indian Talent Olympiad, then you are requested to not use the website www.indiantalent.org.\n\nChanges in the Policies along with Terms & Conditions can be done by Indian Talent Management at any time and without notification; users are bound by such amendments and should accordingly visit this page regularly to review the current terms and conditions.\n\nIf there is any threatening (in any means)/illogical argument regarding the Exams, Pattern, Study Materials, Delivery, Results and/or Awards, even after primarily agreeing to all the conditions & replied with the specific resolutions to the queries, then the Subscription & Scholarship of the said participant will be terminated & results will be discarded.\n\nThe decision taken by the Management of Indian Talent Olympiad will be final and will be abiding by all related to the same.\n\nIn case of any legal proceedings, every aspect shall be governed in accordance with the laws of India and all disputes and differences arising between the parties in relation to the matter shall be subject to the exclusive jurisdiction of Courts at Mumbai only.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '64vv7d1s': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // privacyPolicy
  {
    'aojiupqi': {
      'en': 'Terms And Conditions',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'tdg70vwt': {
      'en': 'PRIVACY POLICY',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'rotwmo5z': {
      'en':
          'The Privacy policy of Indian Talent Olympiad has been mentioned.\n\n ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'vzo9knnu': {
      'en': 'INTRODUCTION',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'fg8xz1qx': {
      'en':
          'Welcome to the site of Indian Talent Olympiad. If it\'s not too much trouble, read the strategies cautiously. On the off chance that you proceed to peruse and utilize this site, you concur and are limited by the Policies of utilization.\n\nIndian Talent Olympiad (\"us\", \"we\", or \"our\") works https://www.indiantalent.org/(hereinafter alluded to as \"Administration\").\n\nOur Privacy Policy oversees your visit to https://www.indiantalent.org/, and clarifies how we gather, protect and reveal data that outcomes from your utilization of our Service.\n\nWe utilize your information to give and improve Service. By utilizing Service, you consent to the assortment and utilization of data as per this strategy. Except if in any case characterized in this Privacy Policy, the terms utilized in this Privacy Policy have similar implications as in our Terms and Conditions.\n\nOur Terms and Conditions (\"Terms\") oversee all utilization of our Service and along with the Privacy Policy comprises your concurrence with us (\"understanding\").',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'en4r0fep': {
      'en': 'DEFINITIONS',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '21t3v2p6': {
      'en':
          'Administration implies the https://www.indiantalent.org/site worked by Indian Talent Olympiad\n\nIndividual DATA implies information about a living person who can be distinguished from those information (or from those and other data either in our ownership or prone to come into our ownership).\n\nUse DATA will be information gathered consequently either created by the utilization of Service or from Service framework itself (for instance, the length of a page visit).\n\nTreats are little documents put away on your gadget (PC or cell phone).\n\nInformation CONTROLLER implies a characteristic or lawful individual who (either alone or mutually or just the same as different people) decides the reasons for which and the way wherein any close to home information are, or are to be, handled. With the end goal of this Privacy Policy, we are a Data Controller of your information.\n\nInformation PROCESSORS (OR SERVICE PROVIDERS) implies any characteristic or lawful individual who measures the information for the Data Controller. We may utilize the administrations of different Service Providers to handle your information all the more viably.\n\nInformation SUBJECT is any living person who is the subject of Personal Data.\n\nTHE USER is the individual utilizing our Service. The User compares to the Data Subject, who is the subject of Personal Data',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'u10e0zio': {
      'en': 'INFORMATION COLLECTION AND USE',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'u3c0w6ti': {
      'en':
          'We gather a few unique kinds of data for different purposes to give and improve our Service to you.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '3avslahj': {
      'en': 'TYPES OF DATA COLLECTED',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'c1x2q61f': {
      'en':
          'Individual Data\n\nWhile utilizing our Service, we may request that you furnish us with certain actually recognizable data that can be utilized to contact or distinguish you (\"Personal Data\"). By and by, recognizable data may include:\n\ni. Email address\n\nii. First name and last name\n\niii. Telephone number\n\niv. Address, Country, State, Province, ZIP/Postal code, City\n\n \n\nWe may utilize your Personal Data to reach you with bulletins, showcasing or special materials and other data that might hold any importance with you. You may quit accepting any, or all, of these interchanges from us by following the withdraw connect.\n ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'gfhxgnpz': {
      'en': ' UTILIZATION OF DATA',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'fphej55x': {
      'en':
          'Indian Talent Olympiad utilizes the gathered information for different purposes:\n\na. to give and keep up our Service;\n\nb. to inform you about changes to our Service;\n\nc. to permit you to partake in intelligent highlights of our Service when you decide to do as such;\n\nd. to give client assistance;\n\ne. to accumulate examination or important data so we can improve our Service;\n\nf. to screen the utilization of our Service;\n\ng. to recognize, forestall and address specialized issues;\n\nh. to satisfy some other reason for which you give it;\n\ni. to complete our commitments and uphold our privileges emerging from any agreements gone into among you and us, including for charging and assortment;\n\nj. to furnish you with sees about your record, as well as membership, including lapse and reestablishment, sees, email guidelines, and so on;\n\nk. to furnish you with news, unique offers and general data about different merchandise, administrations, and occasions which we offer that are like those that you have effectively bought or enquired about except if you have picked not to get such data;\n\nl. in some other manner we may depict when you give the data;\n\nm. for some other reason with your assent.\n\n ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '62i2x5td': {
      'en': 'MAINTENANCE OF DATA',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'a12ze3zg': {
      'en':
          'We will hold your Personal Data just however long is essential for the reasons set out in this Privacy Policy. We will hold and utilize your Personal Data to the degree important to conform to our legitimate commitments (for instance, in the event that we are needed to hold your information to follow material laws), resolve questions, and implement our lawful arrangements and strategies.\n\nWe will likewise hold Usage Data for inward investigation purposes. Use Data is for the most part held for a more limited period, aside from when this information is utilized to fortify the security or to improve the usefulness of our Service, or we are legitimately committed to hold this information for longer time spans.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'dj64mtqo': {
      'en': 'MOVE OF DATA',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'yyygndyy': {
      'en':
          'Your data, including Personal Data, might be moved to - and kept up on - PCs situated outside of your state, region, country or other legislative locale where the information insurance laws may contrast from those of your ward.\n\nOn the off chance that you are situated external India and decide to give data to us, kindly note that we move the information, including Personal Data, to India and interaction it there.\n\nYou agree to this Privacy Policy followed by your accommodation of such data addresses your consent to that move.\n\nIndian Talent Olympiad will make every one of the strides sensibly important to guarantee that your information is dealt with safely and as per this Privacy Policy and no exchange of your Personal Data will happen to an association or a country except if there are satisfactory controls set up including the security of your information and other individual data.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'lae8cc2m': {
      'en': 'REVELATION OF DATA',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '03kg38vg': {
      'en':
          'We may unveil individual data that we gather, or you give:\n\ni. Revelation for Law Enforcement.\n\nUnder particular conditions, we might be needed to uncover your Personal Data whenever needed to do as such by law or in light of substantial solicitations by open specialists.\n\n \n\nii. Deal.\n\nIn the event that we or our auxiliaries are associated with a consolidation, procurement or resource deal, your Personal Data might be moved.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '03gvwtec': {
      'en': 'SECURITY OF DATA',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'fveau256': {
      'en':
          'The security of your information is essential to us however recall that no technique for transmission over the Internet or strategy for electronic capacity is 100% secure. While we endeavor to utilize monetarily satisfactory intends to ensure your Personal Data, we can\'t ensure its supreme security.\n ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'tnhfhbbs': {
      'en': 'SPECIALIST ORGANIZATIONS',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'dbq01nt5': {
      'en':
          'We may utilize outsider organizations and people to work with our (\"Service Providers\"), offer Support for our sake, perform Service-related administrations or help us in dissecting how our Service is utilized.\n\nThese outsiders approach your Personal Data just to play out these assignments for our benefit and are committed not to unveil or utilize it for some other reason.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'tzef8zuq': {
      'en': 'INVESTIGATION',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '2rnlymij': {
      'en':
          'We may utilize outsider Service Providers to screen and examine the utilization of our Service.\n ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '9ctp1aei': {
      'en': 'CI/CD INSTRUMENTS',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'k5u5mngn': {
      'en':
          'We may utilize outsider Service Providers to computerize the advancement interaction of our Service.\n ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ccgp4h42': {
      'en': 'CONDUCT REMARKETING',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '3ff4hywy': {
      'en':
          'We may utilize remarketing administrations to promote on outsider sites to many a you visited our Service. We and our outsider merchants use treats to advise, improve and serve advertisements dependent on your past visits to our Service.\n ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'pjzcrsye': {
      'en': 'PAYMENTS',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '8gzgncpb': {
      'en':
          'We may give paid items or potentially benefits inside Service. Around there, we utilize outsider administrations for payments preparing (for example payments processors).\n\nWe won\'t store or gather your payment card subtleties. That data is given straightforwardly to our outsider payment processors whose utilization of your own data is represented by their Privacy Policy. These payment processors hold fast to the guidelines set by PCI-DSS as overseen by the PCI Security Standards Council, which is a joint exertion of brands like Visa, Mastercard, American Express and Discover. PCI-DSS prerequisites help guarantee the protected treatment of Payment data.\n\n ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'o0v804ti': {
      'en': 'YOUNGSTERS\' PRIVACY',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    't9cckmpb': {
      'en':
          'Our Services are expected for instructive use by youngsters younger than 18 (\"Child\" or \"Kids\").\n ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '5iec4wac': {
      'en': 'CHANGES TO THIS PRIVACY POLICY',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'lh348p51': {
      'en':
          'We may refresh our Privacy Policy every once in a while. We will tell you of any progressions by posting the new Privacy Policy on this page.\n\nWe will tell you through email or potentially an unmistakable notification on our Service, preceding the change getting successful and update \"compelling date\" at the highest point of this Privacy Policy.\n\nYou are encouraged to audit this Privacy Policy occasionally for any changes. Changes to this Privacy Policy are compelling when they are posted on this page.\n ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'j7qzwne6': {
      'en': 'GENERAL',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'r31hyjwb': {
      'en':
          'i. The contact information of the user can be used by Indian Talent Olympiad to send alerts regarding services and offers.\n\nii. All the service-related notifications will be sent to the registered mobile number and email.\n\niii. When you register for an Annual Olympiad/Monthly Olympiad subscription or sign up for a free demo test, personal information is asked. We may use the data to give users a better experience and to enhance the nature and quality of our services.\n\niv. Usage of any information or materials by the user on this website is solely at the own risk of the user, for which Indian Talent Olympiad shall not remain responsible.\n\nv. Users need to make sure and shall hold their responsibility solely to assure that the services, products, or information available through this website match their explicit conditions.\n\nvi. ITO will not disclose any of the information obtained by the Registrations, which includes Names, Contact details (Mob. Nos. & Email IDs) Address details with any third party as per NDAs set by the Govt. norms & Regulations.\n\nvii.ITO will not be sharing any payment related details to the third party. Although the payments which are carried out on the payment getaways platforms are themselves are a third part operative & the information about the consumer behaviours & other contact information will be stored with them. The data sharing ‘if’ happens by the related third party, ITO is not at all liable to any claims made by the claimant. And the actions taken against any entity will not be imposable on the ITO & will be restricted to the third party only.\n ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '9kb9zk4h': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // Deletionofrequest
  {
    'b7rp3zds': {
      'en': 'Username/Phone',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'o2bf8mk3': {
      'en': 'Enter Username/Phone',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'xwjomczt': {
      'en': 'Reason',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'k0dihnb2': {
      'en': 'Enter reason',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'c4xac4le': {
      'en': 'Submit',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ufwngcqy': {
      'en': 'Field is required',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '3xcnaeyg': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '15ynz3kd': {
      'en': 'Field is required',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '7iheam9p': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    't5llwjjy': {
      'en': 'Request Deletion ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '01xeoulh': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // notices
  {
    '3a2g8wen': {
      'en': 'Notice Board',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'kjtra433': {
      'en': 'Monthly',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'e6wtkp3w': {
      'en': 'Read More',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'p8rd8s7e': {
      'en': 'Annual',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '9l8n24wf': {
      'en': 'Read More',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'tysktm7o': {
      'en': 'Ecopy',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'dhw6vntt': {
      'en': 'Read More',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'pbbgsivs': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // demo
  {
    'a1pmokrb': {
      'en': 'Page Title',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ezx5fu02': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // webview_payment
  {
    '7re2qlpj': {
      'en': 'Pay now',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'mkn96pit': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // Cartvalue
  {
    'yp9kbm7p': {
      'en': 'Cart',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'zkc8pwsc': {
      'en': 'Cart Items',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'kbpx018a': {
      'en': 'Apply Coupons',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '8hlb008n': {
      'en': 'Select Coupons',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'y2wvf540': {
      'en': 'Whoo Hoo !!',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ewx3s4ch': {
      'en': 'Remove',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'wur683yv': {
      'en':
          'Note : Delivery Charges Will Be Applicable For Workbooks & Previous Year Question Paper ( Physical Copy Only )',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'sp2eee6k': {
      'en': 'Price Details',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '0fnj3s10': {
      'en': 'Cart value',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '1cbpysg2': {
      'en': 'You saved ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '252uzosp': {
      'en': 'Delivery Charges',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'p8uywyao': {
      'en': 'Total Amount',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'gnced78c': {
      'en': 'I agree to Terms & Condition',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '6c8ri30k': {
      'en': 'see more',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'n8dpznnd': {
      'en': 'cart',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // finalpaybutton
  {
    'drfoja51': {
      'en': 'finalpaying',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'fwu068yv': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // paymentfailure
  {
    '260kt6yg': {
      'en': 'Failure!',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'r7ud2pyc': {
      'en': 'Sorry !! your payment failed please try again.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'mkf5yy3c': {
      'en': 'Try Again',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'frzirfa4': {
      'en': 'Or Go to Homepage',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'kevxddk7': {
      'en': 'Homepage',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'lmpbkdem': {
      'en': 'Failure',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'bwutsi66': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // productsmenu
  {
    'pvowosuk': {
      'en': 'Special Offers',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'd06wd1d2': {
      'en': 'Monthly Test',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'i9c93ejf': {
      'en': '3 months',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '1cz44jqn': {
      'en': '6 Months',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '9wc3vk3m': {
      'en': '1 Year',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'o339ehv3': {
      'en': 'Go to cart',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '1in3u6bk': {
      'en': 'Go to cart',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'hayn8cia': {
      'en': 'Continue',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '8q08gygo': {
      'en': 'Special Offer',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // refundpolicy
  {
    'npgv7czg': {
      'en': 'Terms And Conditions',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'vtg5n957': {
      'en': 'REFUND POLICY',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'a16yumja': {
      'en':
          'No Refund / Cancellation / Postponement / Exchange Policy for Registrations\n\n ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '5kn5hnwd': {
      'en':
          '- By registering, you hereby agree to the Terms & Conditions of the Indian Talent Olympiad\n\n- Once the amount is paid, registration fees for Annual Olympiad and/or subscription charges for Monthly Tests and Online Study Materials are non-refundable, and all the purchases and payments made are deemed final and non-refundable.\n\n- Registration for the Olympiad exams is non-returnable and Non-Refundable.\n\n- The product fee is non-transferable as we believe that you are making the registration/payment with complete awareness of the Terms & Conditions of Refund and Cancellation.\n\n- Once registration is done/order is placed, it is processed immediately; hence, once the order is placed, it cannot be canceled/transferred/refunded.\n\n- No refund will be made for any registrations done by a student ‘mistakenly.’\n\n- Any change in the product once registered/purchased cannot be made.\n\n- For any reason, if the couriered study material / any other item is returned due to an insufficient address or door closed or did not receive for any reason mentioned by the courier company or the Indian Postal service, the consignment will not be sent the second time. The student has to pay the delivery charges again to resend the same material.\n\n- Change of address cannot be done once the order is successfully placed. \n\n- If the Student fails to give the Annual Olympiad Exam and Monthly Test on the scheduled date due to any reason, no refund will be provided. ITO shall not be held liable if the notifications sent to you via SMS / Email / Voice Call on the contact number or email address provided by you and registered with your account return as an undelivered due to wrong number or email address or due to any technical issue from the service provider.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '3lpjv1hh': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // roundregistration
  {
    '85xacx66': {
      'en': '₹ ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'hkawktdp': {
      'en': '/',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '4kqt6pcb': {
      'en': 'Buy Round 1 One Certificate',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'rjobuwqa': {
      'en': ' \$ 80 / subject',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '3vbhy8d4': {
      'en': 'Certificate will be delivered after 2nd round result',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'dwowqgdq': {
      'en': 'Round 2 Registration',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '62jegp7c': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // results
  {
    '5l0bjwvu': {
      'en': 'Subject',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '0ra0d9dd': {
      'en': 'Score',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '7wf3q826': {
      'en': 'Remark',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'tz0i2ur5': {
      'en': 'Topper',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'qt6isp12': {
      'en': 'Action ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'zp0dxc0f': {
      'en': 'Register',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'vj4qh330': {
      'en': 'Result',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'er9l0axj': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // CartvalueCopy
  {
    '3smopjnm': {
      'en': 'Cart Items',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'sodpbpk8': {
      'en':
          'Note : Delivery Charges Will Be Applicable For Workbooks & Previous Year Question Paper ( Physical Copy Only )',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '7i2m2l6w': {
      'en': 'Price Details',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'q6hd7u2k': {
      'en': 'Cart value',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'tlevidea': {
      'en': 'Delivery Charges',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'gupms4xu': {
      'en': 'You saved',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '09du24ib': {
      'en': 'Total Amount',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'o1khkvud': {
      'en': 'I agree to Terms & Condition',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'sr9wptaz': {
      'en': 'see more',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'tstbglv9': {
      'en': 'Pay Now',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'v4w1zo7i': {
      'en': 'cart',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // productWebview
  {
    '8m08hc0c': {
      'en': 'Pay now',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'qqkecdr0': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // productFailure
  {
    'ezu2413b': {
      'en': 'Failure!',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ap96eyoa': {
      'en': 'Sorry !! your payment failed please try again.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '9pt57hqa': {
      'en': 'Try Again',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'g2q9glh7': {
      'en': 'Or Go to Homepage',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'p4m1r9pe': {
      'en': 'Homepage',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'yy1ydjcz': {
      'en': 'Failure',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '7eorrnmn': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // summerquiz
  {
    '0j7t3vlw': {
      'en': 'Summer Quiz Competition',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '8ypbl7es': {
      'en': 'Quiz Details',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ghla5cdw': {
      'en': 'Registration Fees',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '04g3ppgo': {
      'en': 'Summer Quiz Date',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'dea2lmit': {
      'en': 'Exam Quidelines',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ke3rabx1': {
      'en': 'Quiz Award',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'wfuvefue': {
      'en': 'FAQs',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ywxpb8s8': {
      'en': 'Flat',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'sxd7ocg4': {
      'en': 'Summer Quiz\n Competition',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '6lsofv2b': {
      'en': 'Select Standard...',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    's85tavls': {
      'en': 'Search for an item...',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '4mc8w55x': {
      'en': 'Option 1',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'yeohu73x': {
      'en': 'Total Product Amount : ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'quvq93lj': {
      'en': 'Enter Coupon Code...',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'q2jl6etd': {
      'en': 'Apply',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'se0kivb6': {
      'en': 'Subscribe',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'c90s07ss': {
      'en': 'You have successfully registered for the class ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'gmr8y531': {
      'en': ' summer quiz competition 2023-24.\n',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'e7ph9xsd': {
      'en': 'You belong to category 4',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '4jtczwei': {
      'en': 'Quiz Details',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '78mpxpb9': {
      'en': 'Registration Fees',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'u5qaje13': {
      'en': 'Summer Quiz Date',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'darce70u': {
      'en': 'Exam Quidelines',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '3gm6fqbp': {
      'en': 'Quiz Award',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'wwfjtqs7': {
      'en': 'FAQs',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ibz6dc69': {
      'en':
          'Indian Talent Olympiad introduces the Summer Quiz Competition for students of Class 1 to 10. An exciting competition where students can test their knowledge. This quiz comprises of questions based on General Knowledge which will offer a fun way to evaluate student’s knowledge, and is a great way to sharpen their learning abilities. The questions will be asked according to the age groups which will help students improve their ability to respond to questions and understand information. This Quiz will also aid in evaluating the student’s performance and recognize areas for development.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'g9a25evx': {
      'en': 'Summer Quiz',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // annualExam
  {
    'ymw2w5bt': {
      'en': 'Round 1',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '9fxheure': {
      'en': 'Round 2',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'b7cvfov7': {
      'en': 'Buy Now',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    's76o7529': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // quizdetails
  {
    'u2n3w0rw': {
      'en': 'QUIZ DETAIILS',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'a6dt72au': {
      'en': 'REGISTRATION FEES',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'h2fw319x': {
      'en': '₹ 500/- Per Student',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'kpriz1y8': {
      'en':
          'Students enrolling for the Summer Quiz can avail discount on the registration fees.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'sxh831qu': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // round2result
  {
    'hx34s5iu': {
      'en': 'Congratulations',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'zqlo4x42': {
      'en': 'Subject ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'hbqawvkf': {
      'en': 'Round 1 Score\n(%)',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '2ytpxpva': {
      'en': 'State Rank R2',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'xiq73b2w': {
      'en': 'Award',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '6pfbm3ma': {
      'en': 'Action',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '2dk2arzo': {
      'en': 'View Certificate',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'nnpht90l': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // Coupons
  {
    'zjyulf79': {
      'en': 'Add Coupons',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ha5uag2q': {
      'en': 'Exciting Offers',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'zb0aja85': {
      'en': 'Apply Coupons',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'fkk67mk2': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // certificateViewer
  {
    'qthbiew9': {
      'en': 'Buy Certificates',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'vqfg20bg': {
      'en': '₹ 80',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'sb1pr095': {
      'en': ' / per Subject',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '3u6lvx2m': {
      'en': 'Certificates  + Covering Letter + PT Usha Madam Letter ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '707ak4zc': {
      'en': 'Proceed to Checkout',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '4pyh4opt': {
      'en': 'Digital Certificate',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'n1t6mbhk': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // powerProducts
  {
    'xqiwpl1p': {
      'en': 'SELECT ANY 1 AND\nSAVE 5%',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '9lje1twj': {
      'en': 'SELECT ANY 2 AND\nSAVE 10%',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'xwi26acd': {
      'en': 'SELECT ANY 3 AND\nSAVE 15%',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'uej0qot5': {
      'en': 'SELECT ANY 4 AND\nSAVE 20%',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'julbjud0': {
      'en':
          'Note : Delivery Charges Will Be Applicable For Workbooks & Previous Year Question Paper ( Physical Copy Only )',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'lk77kwap': {
      'en': 'Price Details',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'j8q7cm8o': {
      'en': 'Cart value',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'n0uomveu': {
      'en': 'You saved',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ouqjcuzy': {
      'en': 'Delivery Charges',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'vqx2rxsw': {
      'en': 'Total Amount',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '5530nr4h': {
      'en': 'I agree to Terms & Condition',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'm14uir75': {
      'en': 'see more',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'mpia3tej': {
      'en': 'Pay Now',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '44wry0zj': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // notifications
  {
    'ohe14bs0': {
      'en': 'High Priority Announcements',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'dxc7z9p2': {
      'en': 'New Notifications',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '3jutqfh1': {
      'en': 'Regular Announcement',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'uavdrpko': {
      'en': 'New Notifications',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'hox76tk8': {
      'en': 'Notifications',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'rp1ite9l': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // testpagetestingdummy
  {
    'c20ysz9w': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // powercart
  {
    'tnz8oyqe': {
      'en': 'Cart',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'tuzqspm9': {
      'en': 'Cart Items',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '3ebkb49c': {
      'en':
          'Note : Delivery Charges Will Be Applicable For Workbooks & Previous Year Question Paper ( Physical Copy Only )',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'cadp9vqa': {
      'en': 'Price Details',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ssri17sy': {
      'en': 'Cart value',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'eo4kao5q': {
      'en': 'You saved ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'cqltccua': {
      'en': 'Delivery Charges',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'wfiu7n99': {
      'en': 'Total Amount',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'o7hx7g6d': {
      'en': 'I agree to Terms & Condition',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'a7iarddc': {
      'en': 'see more',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '8ti6y76k': {
      'en': 'Pay Now',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'rq5xtkqq': {
      'en': 'cart',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // powerwebview
  {
    'zzb4cpgy': {
      'en': 'Pay now',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'wrcj9wko': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // powerfailure
  {
    'o4bvf6ti': {
      'en': 'Failure!',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '2iyr60f7': {
      'en': 'Sorry !! your payment failed please try again.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'hidp557c': {
      'en': 'Try Again',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'sv8coiyw': {
      'en': 'Or Go to Homepage',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'l69l3d4y': {
      'en': 'Homepage',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '51jg0u02': {
      'en': 'Failure',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ahtg8363': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // testDetails
  {
    'xynobkgw': {
      'en': 'Last Minute Instructions',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'c9k182lt': {
      'en': 'A. ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'r2wifaky': {
      'en': 'There will be ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'vo4mfiw0': {
      'en': 'ONLY ONE ATTEMPT',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'toywosxe': {
      'en': '.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'igefqpd2': {
      'en': 'B. ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'qfuag3qp': {
      'en': 'The exam will ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'buacjn5q': {
      'en': 'START IMMEDIATELY ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'o6ra2wjx': {
      'en': 'after clicking the ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '97ar1jiz': {
      'en': '\"START TEST\" ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '41ug8cz7': {
      'en': 'button.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'qxkqwuef': {
      'en': 'C. ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'jh0vm5ta': {
      'en': 'Allow Camera/Microphone Permission (Need Confirmation on this)* .',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '9pesj8m5': {
      'en': 'D. ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'sp8xl3o6': {
      'en': 'DO NOT ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'pzqi3vb7': {
      'en': 'click the ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'qlxqyz8d': {
      'en': 'BACK BUTTON',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    's9d3lzi3': {
      'en': ',',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '45k5wru3': {
      'en': 'MINIMIZE TAB',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '5gawm4si': {
      'en': ', ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '9rr5yohn': {
      'en': 'PRESS ENTER KEY',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'vug7cw6b': {
      'en': ', or ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '0c7kg7kg': {
      'en': 'CLOSE ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ben72nr8': {
      'en':
          'the exam window while attending the exam. Doing so will submit the exam.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '7wkuom63': {
      'en': 'E. ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'f53bufcm': {
      'en': 'DO NOT COVER ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'sua003nw': {
      'en': 'the camera during the exam.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'bk4fbj5g': {
      'en': 'F. ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'vvx1oppd': {
      'en': 'Check your answers ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '9m45zqo6': {
      'en': 'BEFORE SUBMITTING ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'tpma0ldp': {
      'en': 'the exam.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'dafeylv3': {
      'en': 'G. ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'nio9wu9r': {
      'en': 'NO ADDITIONAL ATTEMPT ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'v6g4icoc': {
      'en': 'will be given if the exam is submitted for any reason.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'hum44iv6': {
      'en': 'Test Details',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'i6rdp7ip': {
      'en': 'Test Name :',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    't2bjoghm': {
      'en': 'Subject :',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    's4inq60j': {
      'en': 'Standard :',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'em5aqqet': {
      'en': 'Test Duration :',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'd2vox16y': {
      'en': 'No of Questions :',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '0tb3z9y8': {
      'en': 'Total Marks :',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'nq11d2k3': {
      'en': 'Start Test',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'gm7clnqf': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // outOfversion
  {
    'd4ccmayf': {
      'en': 'New Update Available !!!',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'zovutwke': {
      'en': 'Please click on download to update \nthe app',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ik8t35ia': {
      'en': 'Download',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '6pqnshc3': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // monthlyexamCopy
  {
    'ub67qiyf': {
      'en': 'Buy Now',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '3n5xjjyq': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // CartvalueCopyCopy
  {
    'yh366ar3': {
      'en': 'Cart Items',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'c95igzuv': {
      'en': 'Apply Coupons',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'aasfzfmf': {
      'en': 'Select Coupons',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    's5nld5di': {
      'en': 'Whoo Hoo !!',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'uu1shfiu': {
      'en': 'Remove',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'yw4e34bv': {
      'en':
          'Note : Delivery Charges Will Be Applicable For Workbooks & Previous Year Question Paper ( Physical Copy Only )',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'udcaaday': {
      'en': 'Price Details',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'lxhjg104': {
      'en': 'Cart value',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'vvuzggxv': {
      'en': 'Delivery Charges',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'zyswufon': {
      'en': 'You saved',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'kqi7qo0d': {
      'en': 'Total Amount',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'v8f1e20m': {
      'en': 'I agree to Terms & Condition',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'smrdi1q9': {
      'en': 'see more',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'jnm08cn2': {
      'en': 'Pay Now',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '950y0g1p': {
      'en': 'cart',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // radio
  {
    'h31j1iwt': {
      'en': 'Option 1',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '9gnl1vi6': {
      'en': ' / ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // quizdetailscom
  {
    '5blvyhhq': {
      'en':
          'There will be 5 categories according to the class. \nQuiz Questions wills be accorded as\n per the below class categories',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'daialfpj': {
      'en': 'CATEGORY 1 :',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'y1zq3bcg': {
      'en': ' Class 1 and Class 2',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'stovlbj6': {
      'en': 'CATEGORY 2 :',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '05gsgtxj': {
      'en': ' Class 3 and Class 4',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'qtt071u4': {
      'en': 'CATEGORY 3 : ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'deq29qut': {
      'en': 'Class 5 and Class 6',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'breimx0a': {
      'en': 'CATEGORY 4 : ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'h9a7j096': {
      'en': 'Class 7 and Class 8',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'haqticme': {
      'en': 'CATEGORY 5 : ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'chnz17pj': {
      'en': 'Class 9 and Class 10',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'w7dw32zy': {
      'en':
          'There will be 5 categories according to the class. \nQuiz Questions wills be accorded as\n per the below class categories',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'qdw8989s': {
      'en': 'QUESTIONS :',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ij27vhs7': {
      'en': ' 50 Questions',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ao26fvke': {
      'en': 'QUIZ DURATION :',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'c3j7luoz': {
      'en': ' 50 Minutes',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'k4ay8xa7': {
      'en': 'MARKS : ',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'vmohc2jc': {
      'en': '50 Marks (No Negative Marking)',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'jwxlqj9f': {
      'en':
          'Students participating in Quiz will be given TWO \n MOCK QUIZZES to familiarize them with the \n pattern of the quiz.These Mock Quizzes will depict\n the same pattern and rule as the Actual Quiz.\n Students are advised to practice on the Mock Quiz \n before taking the Main Quiz.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // registrationfees
  {
    '6kr28qda': {
      'en': 'REGISTRATION FEES',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'cea6xbix': {
      'en': '₹ 500/- Per Student',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'pyyf3bpx': {
      'en':
          'Students enrolling for the Summer Quiz can avail discount on the registration fees.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // summerquizDate
  {
    'o3w8hgvv': {
      'en': 'QUIZ DATE',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '902oamvr': {
      'en': 'SUMMER QUIZ DATE: 25th May 2024',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // examquidelines
  {
    '8cc63upn': {
      'en': 'There will be only ONE ATTEMPT provided to the\n students.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '4q518lde': {
      'en':
          'After you start the Quiz, Do not click on the Back \nButton, Do Not press Enter Key, Do Not Minimize\nthe exam window, or Abruptly Close the Window. \nDoing so will only submit your Test Automatically.\nNo second attempt will be provided.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '1f6mzij7': {
      'en':
          'Students who scroll the questions once they \ninitiate the test MUST BE CAREFUL while scrolling.\n If you click on the Submit button By Mistakenly \ntoo on the last question, with fewer or No \nquestions attempted,the Quiz will still be\nsubmitted, automatically and No Second Chance\nwill be provided.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    't5x7u9ah': {
      'en':
          'In any case or for any reason the Exam is getting \nClosed then the Exam will be submitted. No Extra\nattempt will be provided.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '5f1xtdnd': {
      'en':
          'If because of the Internet connection, the Exams \ngets submitted by the Student that will be \nconsidered as  the Exam Submission only.\nThe user must ensure the proper connectivity \nof the internet/Wi-Fi.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // quizAwards
  {
    'n88hbhxn': {
      'en': 'Top 10 ranking students in each Category, will be \nawarded with',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'tmsxnsac': {
      'en': 'QUIZ GEM + CASH PRIZE ₹ 5,000 + COUPON CODE to avail discount',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '3in0d27x': {
      'en': 'The next 90 ranking students will be entitled as',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'y0q8g8yb': {
      'en': 'SHINING QUIZ STAR + COUPON CODE to avail discount.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // faqs
  {
    'm57ahbp9': {
      'en': 'How do I register for summer quiz?',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'b56h4vir': {
      'en':
          'Students registered at ITO can login in their student \nlogin to register for the upcoming Summer Quiz.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'hhbr588x': {
      'en': 'What is the procedure to enroll for \nsummer quiz competition?',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ibydo1sw': {
      'en':
          'Students can login in the student login by entering the \nregistered mobile number and password. Click in the \n‘SUMMER QUIZ’ tab on the dashboard after login.\nSelect the current class and click subscribe. Choose the \npayment mode to complete the payment and registration.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '24k3vive': {
      'en': 'What is quiz format?',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'whg2fpm4': {
      'en':
          'The Summer Quiz comprises of 50 questions for each\nClass Categories. The questionnaire will be based on \nGeneral Knowledge prepared according to the class \ncategories.',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // notificationPopup
  {
    'j6rmyozi': {
      'en': 'New Notications',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // upgrader
  {
    'gkb43sv2': {
      'en': 'New Update Available !!!',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '4ji4gz0o': {
      'en': 'Please click on download to update \nthe app',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'awwpqvzz': {
      'en': 'Download',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
  // Miscellaneous
  {
    '1em5c8p5': {
      'en':
          'This app requires access to the photo library to  uplpoad profile photo',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '0mi1lrso': {
      'en':
          'This app requires access to the photo library to  uplpoad profile photo',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'kmvddmpc': {
      'en':
          'This app requires access to camera.Be aware you are being monitored during your exams only',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '1tefnvfk': {
      'en':
          'This app requires access to the Microphone. Be aware you are being monitored during your exams only',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'yncrfu64': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '7tkrza3t': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'qigh63fo': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'm6ll1dzw': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'z4uktbfu': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'don5o1j0': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'bw7f2pdc': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '39wmodgc': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '4d0mjuhn': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '5ftey4c8': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'fz96q4je': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ro31itgg': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '5xvrav5q': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'bgx2uhd2': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'pgrphe8e': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'eyd6ia48': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'p0s8y9vs': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '8tb5xu0h': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'f9oc04bl': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ft7r8s7f': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '4gvhg28e': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'ya15r7ys': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'iq1q5kx0': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    'k7o5zue9': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
    },
    '2foh4c75': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
