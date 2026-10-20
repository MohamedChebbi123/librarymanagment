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

  static List<String> languages() => ['fr', 'en', 'ar'];

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
    String? frText = '',
    String? enText = '',
    String? arText = '',
  }) =>
      [frText, enText, arText][languageIndex] ?? '';

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
  // loginpage
  {
    'bnt9lwa1': {
      'fr': 'Bibliothèque',
      'ar': '',
      'en': '',
    },
    '6ildvoc8': {
      'fr': 'Your library, beautifully organized.',
      'ar': '',
      'en': '',
    },
    '2jxjqg3m': {
      'fr': 'Welcome back',
      'ar': '',
      'en': '',
    },
    'hhq8ok9n': {
      'fr': 'Log in to your library account.',
      'ar': '',
      'en': '',
    },
    '6fd2fz16': {
      'fr': 'Email',
      'ar': '',
      'en': '',
    },
    'pvp8mzr1': {
      'fr': 'you@example.com',
      'ar': '',
      'en': '',
    },
    'yvxgzlea': {
      'fr': 'Password',
      'ar': '',
      'en': '',
    },
    'atvufe9h': {
      'fr': 'Enter your password',
      'ar': '',
      'en': '',
    },
    '18rb1l8j': {
      'fr': 'Enter your email address',
      'ar': '',
      'en': '',
    },
    '1imjazk3': {
      'fr': 'Enter a valid email address',
      'ar': '',
      'en': '',
    },
    'ub2rzoxo': {
      'fr': 'Enter your password',
      'ar': '',
      'en': '',
    },
    'jkhuzl6i': {
      'fr': 'Forgot password?',
      'ar': '',
      'en': '',
    },
    '67c7l6k7': {
      'fr': 'Log in',
      'ar': '',
      'en': '',
    },
    '828nk8kn': {
      'fr': 'Don\'t have an account? Register',
      'ar': '',
      'en': '',
    },
    'p6jlgvfr': {
      'fr': 'Log in',
      'ar': '',
      'en': '',
    },
    'byhagosv': {
      'fr': 'Home',
      'ar': '',
      'en': '',
    },
  },
  // registerpage
  {
    'ef7odq7r': {
      'fr': 'Create your account',
      'ar': '',
      'en': '',
    },
    'mfy2z4hu': {
      'fr': 'Join the library to borrow and discover books.',
      'ar': '',
      'en': '',
    },
    'vna1xuwx': {
      'fr': 'Full name',
      'ar': '',
      'en': '',
    },
    '51e5yzq1': {
      'fr': 'Your full name',
      'ar': '',
      'en': '',
    },
    't82mnm2i': {
      'fr': 'Email',
      'ar': '',
      'en': '',
    },
    'tqcuu7r4': {
      'fr': 'you@example.com',
      'ar': '',
      'en': '',
    },
    'e015vas7': {
      'fr': 'Phone number',
      'ar': '',
      'en': '',
    },
    'ipqh14l2': {
      'fr': '+216 12 345 678',
      'ar': '',
      'en': '',
    },
    'dt92cmrb': {
      'fr': '+216 ',
      'ar': '',
      'en': '',
    },
    '1r89snm4': {
      'fr': 'Password',
      'ar': '',
      'en': '',
    },
    '8rg0igoj': {
      'fr': 'Create a password',
      'ar': '',
      'en': '',
    },
    'ekfr0bot': {
      'fr': 'At least 6 characters',
      'ar': '',
      'en': '',
    },
    'vnbmdwfm': {
      'fr': 'Preferred language',
      'ar': '',
      'en': '',
    },
    'aa3uat8h': {
      'fr': 'Select your language',
      'ar': '',
      'en': '',
    },
    'qqjmu6uf': {
      'fr': 'Français',
      'ar': '',
      'en': '',
    },
    'qoefum9b': {
      'fr': 'English',
      'ar': '',
      'en': '',
    },
    'hwqbruoc': {
      'fr': 'العربية',
      'ar': '',
      'en': '',
    },
    'jw8mwvwx': {
      'fr': 'Enter a username',
      'ar': '',
      'en': '',
    },
    '22zu9qy4': {
      'fr': 'Username must have at least 3 characters',
      'ar': '',
      'en': '',
    },
    'j0b5g887': {
      'fr': 'Enter your email address',
      'ar': '',
      'en': '',
    },
    'suhr81va': {
      'fr': 'Enter a valid email address',
      'ar': '',
      'en': '',
    },
    'euafthya': {
      'fr': 'Enter a password',
      'ar': '',
      'en': '',
    },
    'gvpnygp0': {
      'fr': 'Password must have at least 6 characters',
      'ar': '',
      'en': '',
    },
    '72to9d7t': {
      'fr': 'Enter your phone number',
      'ar': '',
      'en': '',
    },
    'ogod5fve': {
      'fr': 'Enter a valid phone number',
      'ar': '',
      'en': '',
    },
    'nlh28bwa': {
      'fr': 'Create account',
      'ar': '',
      'en': '',
    },
    'q016irxf': {
      'fr': 'Already have an account?',
      'ar': '',
      'en': '',
    },
    'phkp2ygz': {
      'fr': 'Log in',
      'ar': '',
      'en': '',
    },
    'lawmzzf5': {
      'fr': 'Home',
      'ar': '',
      'en': '',
    },
  },
  // forgetpassword
  {
    'mjehmkmw': {
      'fr': 'Page Title',
      'ar': '',
      'en': '',
    },
    'hwgv1qul': {
      'fr': 'Home',
      'ar': '',
      'en': '',
    },
  },
  // editprofileforadmin
  {
    'gqjjdv75': {
      'fr': 'Your profile',
      'ar': '',
      'en': '',
    },
    'ixbu1qm5': {
      'fr': 'Update your account details below.',
      'ar': '',
      'en': '',
    },
    'nena4kbd': {
      'fr': 'Username',
      'ar': '',
      'en': '',
    },
    'r1o3cldr': {
      'fr': 'Your full name',
      'ar': '',
      'en': '',
    },
    'lpb9xuqw': {
      'fr': 'Phone number',
      'ar': '',
      'en': '',
    },
    'mswq3h08': {
      'fr': '+216 12 345 678',
      'ar': '',
      'en': '',
    },
    '0qmr7e53': {
      'fr': 'Preferred language',
      'ar': '',
      'en': '',
    },
    'jdonkr4n': {
      'fr': 'Select your language',
      'ar': '',
      'en': '',
    },
    'hj50jvfw': {
      'fr': 'Français',
      'ar': '',
      'en': '',
    },
    '24vs9h6p': {
      'fr': 'English',
      'ar': '',
      'en': '',
    },
    '0rl025vy': {
      'fr': 'العربية',
      'ar': '',
      'en': '',
    },
    '0xstaeka': {
      'fr': 'New password',
      'ar': '',
      'en': '',
    },
    'gbmjty81': {
      'fr': 'Leave empty to keep your current password',
      'ar': '',
      'en': '',
    },
    '29jpex6y': {
      'fr': 'At least 6 characters',
      'ar': '',
      'en': '',
    },
    '1f4t1qf6': {
      'fr': 'Enter your username',
      'ar': '',
      'en': '',
    },
    'dsm02cbc': {
      'fr': 'Username must have at least 3 characters',
      'ar': '',
      'en': '',
    },
    'o4msb9fv': {
      'fr': 'Enter your phone number',
      'ar': '',
      'en': '',
    },
    'c1fwxmvp': {
      'fr': 'Enter a valid phone number',
      'ar': '',
      'en': '',
    },
    'ljsz3seu': {
      'fr': 'Save changes',
      'ar': '',
      'en': '',
    },
    'qxmiqtb1': {
      'fr': 'Update profile',
      'ar': '',
      'en': '',
    },
    '4igtwza2': {
      'fr': 'Home',
      'ar': '',
      'en': '',
    },
  },
  // addbookforadmin
  {
    '3b4r75vh': {
      'fr': 'Book title',
      'ar': '',
      'en': '',
    },
    'ex33eki3': {
      'fr': 'Enter the book title',
      'ar': '',
      'en': '',
    },
    '6ozz34d3': {
      'fr': 'ISBN',
      'ar': '',
      'en': '',
    },
    'yi11cjy9': {
      'fr': 'e.g. 978-3-16-148410-0',
      'ar': '',
      'en': '',
    },
    'vlzl06yb': {
      'fr': 'Author',
      'ar': '',
      'en': '',
    },
    '5l9tdvjr': {
      'fr': 'Enter the author name',
      'ar': '',
      'en': '',
    },
    'o7451jse': {
      'fr': 'Category',
      'ar': '',
      'en': '',
    },
    'zlc7i8zs': {
      'fr': 'Select a category',
      'ar': '',
      'en': '',
    },
    'x4t424hq': {
      'fr': 'Informatique',
      'ar': '',
      'en': '',
    },
    'swpokxnv': {
      'fr': 'Sciences',
      'ar': '',
      'en': '',
    },
    'p6hvfrom': {
      'fr': 'Littérature',
      'ar': '',
      'en': '',
    },
    'ukj6zpzo': {
      'fr': 'Histoire',
      'ar': '',
      'en': '',
    },
    'dtb6cxjn': {
      'fr': 'Économie',
      'ar': '',
      'en': '',
    },
    'xar8nveu': {
      'fr': 'Description',
      'ar': '',
      'en': '',
    },
    'l5wduwj8': {
      'fr': 'Short description of the book',
      'ar': '',
      'en': '',
    },
    'igdwoez1': {
      'fr': 'Cover URL',
      'ar': '',
      'en': '',
    },
    'ebay1cu5': {
      'fr': 'https://example.com/cover.jpg',
      'ar': '',
      'en': '',
    },
    '9wgt8019': {
      'fr': 'Publish year',
      'ar': '',
      'en': '',
    },
    'axnyou72': {
      'fr': 'e.g. 2020',
      'ar': '',
      'en': '',
    },
    'mu0i5uws': {
      'fr': 'Price (DT)',
      'ar': '',
      'en': '',
    },
    'a0u7j4og': {
      'fr': 'e.g. 25.500',
      'ar': '',
      'en': '',
    },
    'fyina1hu': {
      'fr': 'Book count',
      'ar': '',
      'en': '',
    },
    'q23xmefq': {
      'fr': 'Number of copies, e.g. 3',
      'ar': '',
      'en': '',
    },
    'mmgvo4r3': {
      'fr': 'Enter the book title',
      'ar': '',
      'en': '',
    },
    'javw65mj': {
      'fr': 'Enter the ISBN',
      'ar': '',
      'en': '',
    },
    'jqbbnh2f': {
      'fr': 'Enter the author',
      'ar': '',
      'en': '',
    },
    'ejrb40jt': {
      'fr': 'Enter the number of copies',
      'ar': '',
      'en': '',
    },
    'up5av81z': {
      'fr': 'Enter the price',
      'ar': '',
      'en': '',
    },
    'v9x48inv': {
      'fr': 'Add book',
      'ar': '',
      'en': '',
    },
    'ngnwt23h': {
      'fr': 'Add book',
      'ar': '',
      'en': '',
    },
    '5yube0rt': {
      'fr': 'Home',
      'ar': '',
      'en': '',
    },
  },
  // homeforadmin
  {
    'plkylhff': {
      'fr': 'Welcome back',
      'ar': '',
      'en': '',
    },
    'j0c5dsaa': {
      'fr': 'Manage the catalog and your account from one place.',
      'ar': '',
      'en': '',
    },
    '13hl0r8e': {
      'fr': 'Quick actions',
      'ar': '',
      'en': '',
    },
    '9rb2g6g5': {
      'fr': 'Browse books',
      'ar': '',
      'en': '',
    },
    'jbr5hmh4': {
      'fr': 'Search and manage the catalog',
      'ar': '',
      'en': '',
    },
    '37h0wivg': {
      'fr': 'Add book',
      'ar': '',
      'en': '',
    },
    'ns4erjzz': {
      'fr': 'Add a new title to the shelves',
      'ar': '',
      'en': '',
    },
    'wfm9mmz8': {
      'fr': 'My profile',
      'ar': '',
      'en': '',
    },
    '0114xocg': {
      'fr': 'View your account details',
      'ar': '',
      'en': '',
    },
    'oqlgupsv': {
      'fr': 'Edit profile',
      'ar': '',
      'en': '',
    },
    '07fscmz4': {
      'fr': 'Update your name, phone or password',
      'ar': '',
      'en': '',
    },
    'o9v617ec': {
      'fr': 'Dashboard',
      'ar': '',
      'en': '',
    },
    'ha72bttz': {
      'fr': 'Menu',
      'ar': '',
      'en': '',
    },
    'pc4kbue9': {
      'fr': 'View profile',
      'ar': '',
      'en': '',
    },
    'dxs4c1nd': {
      'fr': 'Update profile',
      'ar': '',
      'en': '',
    },
    '0pze3o9v': {
      'fr': 'Add book',
      'ar': '',
      'en': '',
    },
    '3v5rwshv': {
      'fr': 'Browse books',
      'ar': '',
      'en': '',
    },
    'qrpqzf88': {
      'fr': 'Home',
      'ar': '',
      'en': '',
    },
  },
  // homeforuser
  {
    'qrbnnxtx': {
      'fr': 'Welcome to the library',
      'ar': '',
      'en': '',
    },
    '8vwro7sz': {
      'fr': 'Discover, borrow and enjoy great books.',
      'ar': '',
      'en': '',
    },
    '5u9ncc2y': {
      'fr': 'Your account',
      'ar': '',
      'en': '',
    },
    's556z8sf': {
      'fr': 'Browse books',
      'ar': '',
      'en': '',
    },
    'mrogcpw2': {
      'fr': 'Search the catalog by title, author or category',
      'ar': '',
      'en': '',
    },
    'n4joquy1': {
      'fr': 'My favourites',
      'ar': '',
      'en': '',
    },
    '83bsxvad': {
      'fr': 'Books you saved for later',
      'ar': '',
      'en': '',
    },
    '3mb7ven4': {
      'fr': 'My purchases',
      'ar': '',
      'en': '',
    },
    'gfahdm8k': {
      'fr': 'Books you bought',
      'ar': '',
      'en': '',
    },
    'a72vdh2o': {
      'fr': 'My profile',
      'ar': '',
      'en': '',
    },
    'v0yvcd29': {
      'fr': 'View your details, edit them or log out',
      'ar': '',
      'en': '',
    },
    'a8t6rqq5': {
      'fr': 'A reader lives a thousand lives before he dies.',
      'ar': '',
      'en': '',
    },
    'wdplmps3': {
      'fr': '— George R.R. Martin',
      'ar': '',
      'en': '',
    },
    'sr258xp7': {
      'fr': 'Home',
      'ar': '',
      'en': '',
    },
    'gj1d757y': {
      'fr': 'Home',
      'ar': '',
      'en': '',
    },
  },
  // profileforadmin
  {
    'lrzruzhd': {
      'fr': 'Email',
      'ar': '',
      'en': '',
    },
    '8rymsfym': {
      'fr': 'Phone number',
      'ar': '',
      'en': '',
    },
    'cjn39jsd': {
      'fr': 'Joined at',
      'ar': '',
      'en': '',
    },
    'md2lzygm': {
      'fr': 'Edit profile',
      'ar': '',
      'en': '',
    },
    '50zm15ao': {
      'fr': 'Log out',
      'ar': '',
      'en': '',
    },
    'wv9dc6q2': {
      'fr': 'My profile',
      'ar': '',
      'en': '',
    },
    'a1vh8wlk': {
      'fr': 'Home',
      'ar': '',
      'en': '',
    },
  },
  // browsebooksforadmin
  {
    'c7e4q3ln': {
      'fr': 'Search by title, author or category',
      'ar': '',
      'en': '',
    },
    '1pqcprm1': {
      'fr': 'All',
      'ar': '',
      'en': '',
    },
    'dbfewuqm': {
      'fr': 'All',
      'ar': '',
      'en': '',
    },
    'c5ncpwgo': {
      'fr': 'Informatique',
      'ar': '',
      'en': '',
    },
    '7wxaaj6q': {
      'fr': 'Informatique',
      'ar': '',
      'en': '',
    },
    'ebcwv7p6': {
      'fr': 'Sciences',
      'ar': '',
      'en': '',
    },
    '89g82jid': {
      'fr': 'Sciences',
      'ar': '',
      'en': '',
    },
    'p0xdu3uo': {
      'fr': 'Littérature',
      'ar': '',
      'en': '',
    },
    'ra2e0dgv': {
      'fr': 'Littérature',
      'ar': '',
      'en': '',
    },
    '18ie20cb': {
      'fr': 'Histoire',
      'ar': '',
      'en': '',
    },
    '1kybnpha': {
      'fr': 'Histoire',
      'ar': '',
      'en': '',
    },
    'i4m9yvcw': {
      'fr': 'Économie',
      'ar': '',
      'en': '',
    },
    'b0krenum': {
      'fr': 'Économie',
      'ar': '',
      'en': '',
    },
    'wpwlxlkz': {
      'fr': 'Books',
      'ar': '',
      'en': '',
    },
    'i9a2ooz0': {
      'fr': 'Home',
      'ar': '',
      'en': '',
    },
  },
  // bookdetailsforadmin
  {
    'emzwxhtp': {
      'fr': 'ISBN',
      'ar': '',
      'en': '',
    },
    'lsog4kwv': {
      'fr': 'Publish year',
      'ar': '',
      'en': '',
    },
    'pac7lzz7': {
      'fr': 'Description',
      'ar': '',
      'en': '',
    },
    '3c0k4730': {
      'fr': 'Edit',
      'ar': '',
      'en': '',
    },
    '9vj7omvi': {
      'fr': 'Delete',
      'ar': '',
      'en': '',
    },
    'nuq8ijdd': {
      'fr': 'Book details',
      'ar': '',
      'en': '',
    },
    '0o70dh62': {
      'fr': 'Home',
      'ar': '',
      'en': '',
    },
  },
  // editbookforadmin
  {
    '4g4jfq2c': {
      'fr': 'Book title',
      'ar': '',
      'en': '',
    },
    'elb8fify': {
      'fr': 'Enter the book title',
      'ar': '',
      'en': '',
    },
    '1hdtxgil': {
      'fr': 'ISBN',
      'ar': '',
      'en': '',
    },
    'l9xxzg70': {
      'fr': 'e.g. 978-3-16-148410-0',
      'ar': '',
      'en': '',
    },
    'kl9ulbv6': {
      'fr': 'Author',
      'ar': '',
      'en': '',
    },
    '0rmzmb7i': {
      'fr': 'Enter the author name',
      'ar': '',
      'en': '',
    },
    'zv302sha': {
      'fr': 'Category',
      'ar': '',
      'en': '',
    },
    '2kblp1lz': {
      'fr': 'Select a category',
      'ar': '',
      'en': '',
    },
    'msbhemd9': {
      'fr': 'Informatique',
      'ar': '',
      'en': '',
    },
    '9jxxwbsk': {
      'fr': 'Sciences',
      'ar': '',
      'en': '',
    },
    '60xn9yb0': {
      'fr': 'Littérature',
      'ar': '',
      'en': '',
    },
    'teo5wbsp': {
      'fr': 'Histoire',
      'ar': '',
      'en': '',
    },
    'f09jr9ad': {
      'fr': 'Économie',
      'ar': '',
      'en': '',
    },
    '38rogpkj': {
      'fr': 'Description',
      'ar': '',
      'en': '',
    },
    '4lhb1xbe': {
      'fr': 'Short description of the book',
      'ar': '',
      'en': '',
    },
    'io0e6t0a': {
      'fr': 'Cover URL',
      'ar': '',
      'en': '',
    },
    'k278p3pi': {
      'fr': 'https://example.com/cover.jpg',
      'ar': '',
      'en': '',
    },
    '9kqnxmpn': {
      'fr': 'Publish year',
      'ar': '',
      'en': '',
    },
    'lyuvdpyt': {
      'fr': 'e.g. 2020',
      'ar': '',
      'en': '',
    },
    'qol86rl1': {
      'fr': 'Enter the book title',
      'ar': '',
      'en': '',
    },
    '8n7mya8j': {
      'fr': 'Enter the ISBN',
      'ar': '',
      'en': '',
    },
    'v0rh9ul8': {
      'fr': 'Enter the author',
      'ar': '',
      'en': '',
    },
    'dkui5pnq': {
      'fr': 'Save changes',
      'ar': '',
      'en': '',
    },
    'l8h7bjky': {
      'fr': 'Cancel',
      'ar': '',
      'en': '',
    },
    'b53wzg4e': {
      'fr': 'Edit book',
      'ar': '',
      'en': '',
    },
    '8f0pzto5': {
      'fr': 'Home',
      'ar': '',
      'en': '',
    },
  },
  // browsebooksforuser
  {
    '6dk1zq1x': {
      'fr': 'Search by title, author or category',
      'ar': '',
      'en': '',
    },
    'rkskwwyh': {
      'fr': 'All',
      'ar': '',
      'en': '',
    },
    'fsbu19re': {
      'fr': 'All',
      'ar': '',
      'en': '',
    },
    'gbgiri74': {
      'fr': 'Informatique',
      'ar': '',
      'en': '',
    },
    'wilal4zp': {
      'fr': 'Informatique',
      'ar': '',
      'en': '',
    },
    '9jjxtfz5': {
      'fr': 'Sciences',
      'ar': '',
      'en': '',
    },
    'femtyfh1': {
      'fr': 'Sciences',
      'ar': '',
      'en': '',
    },
    'ig8nmcwg': {
      'fr': 'Littérature',
      'ar': '',
      'en': '',
    },
    'oas65wz2': {
      'fr': 'Littérature',
      'ar': '',
      'en': '',
    },
    '39oqnhz7': {
      'fr': 'Histoire',
      'ar': '',
      'en': '',
    },
    'e088h9b6': {
      'fr': 'Histoire',
      'ar': '',
      'en': '',
    },
    '0g72oh8v': {
      'fr': 'Économie',
      'ar': '',
      'en': '',
    },
    'tbcr5939': {
      'fr': 'Économie',
      'ar': '',
      'en': '',
    },
    '5up10ksv': {
      'fr': 'Buy',
      'ar': '',
      'en': '',
    },
    'ajci6y56': {
      'fr': 'Sold out',
      'ar': '',
      'en': '',
    },
    'rs6m2h3a': {
      'fr': 'Books',
      'ar': '',
      'en': '',
    },
    'w1o2yrpj': {
      'fr': 'Home',
      'ar': '',
      'en': '',
    },
  },
  // favoritebooksforuser
  {
    'ft51ctrm': {
      'fr': 'No favourites yet',
      'ar': '',
      'en': '',
    },
    'jpiskzld': {
      'fr': 'Tap the heart on any book to save it here.',
      'ar': '',
      'en': '',
    },
    'bekgskpq': {
      'fr': 'Browse books',
      'ar': '',
      'en': '',
    },
    '5epqaq6t': {
      'fr': 'My favourites',
      'ar': '',
      'en': '',
    },
    'x3ibevld': {
      'fr': 'Home',
      'ar': '',
      'en': '',
    },
  },
  // profileforuser
  {
    'u3d8x5ap': {
      'fr': 'Email',
      'ar': '',
      'en': '',
    },
    'ls1hx2bc': {
      'fr': 'Phone number',
      'ar': '',
      'en': '',
    },
    'nxcze77y': {
      'fr': 'Preferred language',
      'ar': '',
      'en': '',
    },
    'mhtp8jac': {
      'fr': 'Member since',
      'ar': '',
      'en': '',
    },
    '6el7lg3r': {
      'fr': 'Edit profile',
      'ar': '',
      'en': '',
    },
    '2yqvcy64': {
      'fr': 'Log out',
      'ar': '',
      'en': '',
    },
    '3jobnwgh': {
      'fr': 'My profile',
      'ar': '',
      'en': '',
    },
    'tqmqkgfm': {
      'fr': 'Home',
      'ar': '',
      'en': '',
    },
  },
  // editprofileforuser
  {
    'p6s1qxqj': {
      'fr': 'Your profile',
      'ar': '',
      'en': '',
    },
    'gzajf4pz': {
      'fr': 'Keep your library account details up to date.',
      'ar': '',
      'en': '',
    },
    'ho80xkig': {
      'fr': 'Username',
      'ar': '',
      'en': '',
    },
    '69lp8dhu': {
      'fr': 'Your full name',
      'ar': '',
      'en': '',
    },
    '8xy2lq16': {
      'fr': 'Phone number',
      'ar': '',
      'en': '',
    },
    'hc1w2ywa': {
      'fr': '+216 12 345 678',
      'ar': '',
      'en': '',
    },
    'cxg65c6m': {
      'fr': 'Preferred language',
      'ar': '',
      'en': '',
    },
    'dxa6zcxb': {
      'fr': 'Select your language',
      'ar': '',
      'en': '',
    },
    'js6fj1dx': {
      'fr': 'Français',
      'ar': '',
      'en': '',
    },
    'g3s046s6': {
      'fr': 'English',
      'ar': '',
      'en': '',
    },
    'xwcrcuzd': {
      'fr': 'العربية',
      'ar': '',
      'en': '',
    },
    '0pzf9c4y': {
      'fr': 'New password',
      'ar': '',
      'en': '',
    },
    'wc41heoi': {
      'fr': 'Leave empty to keep your current password',
      'ar': '',
      'en': '',
    },
    'tnugul8u': {
      'fr': 'At least 6 characters',
      'ar': '',
      'en': '',
    },
    'fth1y9i3': {
      'fr': 'Enter your username',
      'ar': '',
      'en': '',
    },
    '95g9w7wc': {
      'fr': 'Username must have at least 3 characters',
      'ar': '',
      'en': '',
    },
    'vpbhf75g': {
      'fr': 'Enter your phone number',
      'ar': '',
      'en': '',
    },
    'kgb1lrjl': {
      'fr': 'Enter a valid phone number',
      'ar': '',
      'en': '',
    },
    'ply5f9r4': {
      'fr': 'Save changes',
      'ar': '',
      'en': '',
    },
    'w3x7yn6f': {
      'fr': 'Cancel',
      'ar': '',
      'en': '',
    },
    'hieruka5': {
      'fr': 'Edit profile',
      'ar': '',
      'en': '',
    },
    'vefmk3ms': {
      'fr': 'Home',
      'ar': '',
      'en': '',
    },
  },
  // boughtbooksforuser
  {
    'miv2wd2c': {
      'fr': 'No purchases yet',
      'ar': '',
      'en': '',
    },
    '3ibqt29r': {
      'fr': 'Books you buy will appear here.',
      'ar': '',
      'en': '',
    },
    'h4e3n02a': {
      'fr': 'Browse books',
      'ar': '',
      'en': '',
    },
    'xojskhat': {
      'fr': 'My purchases',
      'ar': '',
      'en': '',
    },
    'r8s73pv4': {
      'fr': 'Home',
      'ar': '',
      'en': '',
    },
  },
  // bookdetailsforuser
  {
    'ubyh490m': {
      'fr': 'Book details',
      'ar': '',
      'en': '',
    },
    'eumb7t3o': {
      'fr': 'Price',
      'ar': '',
      'en': '',
    },
    '2fef7we0': {
      'fr': 'ISBN',
      'ar': '',
      'en': '',
    },
    't2guhei1': {
      'fr': 'Publish year',
      'ar': '',
      'en': '',
    },
    '9awskrzo': {
      'fr': 'Description',
      'ar': '',
      'en': '',
    },
    'k3jvrlum': {
      'fr': 'Buy',
      'ar': '',
      'en': '',
    },
    'd05ydw1a': {
      'fr': 'Sold out',
      'ar': '',
      'en': '',
    },
    'nonfr628': {
      'fr': 'Favourite',
      'ar': '',
      'en': '',
    },
    'k5aikuwe': {
      'fr': 'Favourited',
      'ar': '',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'hax8g4p9': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'ushf1f49': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'qiinm4up': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'z7ilp2lv': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'uk9tm1nf': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'hu2u9324': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    '3ws8zvwt': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'aut3jttn': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'pyq6b7e7': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'uq4qdb7l': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'xqft2sl8': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    '81xu02en': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'h47zmk93': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'mu7spsc4': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'vwnslzst': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'igqmam6v': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'eg8gpp6s': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'aq8dpusv': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'tlzpqnps': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'tiaqp9mm': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'hpsgqjp2': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'zgu7pr45': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'mrxinuhk': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'h46fzris': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'uc1ovha9': {
      'fr': '',
      'ar': '',
      'en': '',
    },
    'r08pwbjt': {
      'fr': '',
      'ar': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
