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

  static List<String> languages() => ['en', 'fr', 'ar'];

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
    String? frText = '',
    String? arText = '',
  }) =>
      [enText, frText, arText][languageIndex] ?? '';

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
      'en': 'Bibliothèque',
      'ar': 'مكتبة',
      'fr': 'Bibliothèque',
    },
    '6ildvoc8': {
      'en': 'Your library, beautifully organized.',
      'ar': 'مكتبتك، منظمة بشكل جميل.',
      'fr': 'Votre bibliothèque, magnifiquement organisée.',
    },
    '2jxjqg3m': {
      'en': 'Welcome back',
      'ar': 'مرحبًا بعودتك',
      'fr': 'Content de te revoir',
    },
    'hhq8ok9n': {
      'en': 'Log in to your library account.',
      'ar': 'قم بتسجيل الدخول إلى حسابك في المكتبة.',
      'fr': 'Connectez-vous à votre compte de bibliothèque.',
    },
    '6fd2fz16': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'fr': 'E-mail',
    },
    'pvp8mzr1': {
      'en': 'you@example.com',
      'ar': 'you@example.com',
      'fr': 'vous@exemple.com',
    },
    'yvxgzlea': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'fr': 'Mot de passe',
    },
    'atvufe9h': {
      'en': 'Enter your password',
      'ar': 'أدخل كلمة المرور الخاصة بك',
      'fr': 'Saisissez votre mot de passe',
    },
    '18rb1l8j': {
      'en': 'Enter your email address',
      'ar': 'أدخل عنوان بريدك الإلكتروني',
      'fr': 'Saisissez votre adresse e-mail',
    },
    '1imjazk3': {
      'en': 'Enter a valid email address',
      'ar': 'أدخل عنوان بريد إلكتروني صحيح',
      'fr': 'Veuillez saisir une adresse e-mail valide',
    },
    'ub2rzoxo': {
      'en': 'Enter your password',
      'ar': 'أدخل كلمة المرور الخاصة بك',
      'fr': 'Saisissez votre mot de passe',
    },
    'jkhuzl6i': {
      'en': 'Forgot password?',
      'ar': 'هل نسيت كلمة السر؟',
      'fr': 'Mot de passe oublié ?',
    },
    '67c7l6k7': {
      'en': 'Log in',
      'ar': 'تسجيل الدخول',
      'fr': 'Se connecter',
    },
    '828nk8kn': {
      'en': 'Don\'t have an account? Register',
      'ar': 'ليس لديك حساب؟ سجل الآن',
      'fr': 'Vous n\'avez pas de compte ? Inscrivez-vous',
    },
    'p6jlgvfr': {
      'en': 'Log in',
      'ar': 'تسجيل الدخول',
      'fr': 'Se connecter',
    },
    'byhagosv': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // registerpage
  {
    'ef7odq7r': {
      'en': 'Create your account',
      'ar': 'أنشئ حسابك',
      'fr': 'Créez votre compte',
    },
    'mfy2z4hu': {
      'en': 'Join the library to borrow and discover books.',
      'ar': 'انضم إلى المكتبة لاستعارة الكتب واكتشافها.',
      'fr':
          'Inscrivez-vous à la bibliothèque pour emprunter et découvrir des livres.',
    },
    'vna1xuwx': {
      'en': 'Full name',
      'ar': 'الاسم الكامل',
      'fr': 'Nom et prénom',
    },
    '51e5yzq1': {
      'en': 'Your full name',
      'ar': 'اسمك الكامل',
      'fr': 'Votre nom complet',
    },
    't82mnm2i': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'fr': 'E-mail',
    },
    'tqcuu7r4': {
      'en': 'you@example.com',
      'ar': 'you@example.com',
      'fr': 'vous@exemple.com',
    },
    'e015vas7': {
      'en': 'Phone number',
      'ar': 'رقم التليفون',
      'fr': 'Numéro de téléphone',
    },
    'ipqh14l2': {
      'en': '+216 12 345 678',
      'ar': '+216 12 345 678',
      'fr': '+216 12 345 678',
    },
    'dt92cmrb': {
      'en': '+216 ',
      'ar': '+216',
      'fr': '+216',
    },
    '1r89snm4': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'fr': 'Mot de passe',
    },
    '8rg0igoj': {
      'en': 'Create a password',
      'ar': 'أنشئ كلمة مرور',
      'fr': 'Créer un mot de passe',
    },
    'ekfr0bot': {
      'en': 'At least 6 characters',
      'ar': 'ستة أحرف على الأقل',
      'fr': 'Au moins 6 caractères',
    },
    'vnbmdwfm': {
      'en': 'Preferred language',
      'ar': 'اللغة المفضلة',
      'fr': 'Langue préférée',
    },
    'aa3uat8h': {
      'en': 'Select your language',
      'ar': 'اختر لغتك',
      'fr': 'Sélectionnez votre langue',
    },
    'qqjmu6uf': {
      'en': 'Français',
      'ar': 'الفرنسية',
      'fr': 'Français',
    },
    'qoefum9b': {
      'en': 'English',
      'ar': 'إنجليزي',
      'fr': 'Anglais',
    },
    'hwqbruoc': {
      'en': 'العربية',
      'ar': 'العربية',
      'fr': 'L\'arabe',
    },
    'jw8mwvwx': {
      'en': 'Enter a username',
      'ar': 'أدخل اسم المستخدم',
      'fr': 'Saisissez un nom d\'utilisateur',
    },
    '22zu9qy4': {
      'en': 'Username must have at least 3 characters',
      'ar': 'يجب أن يتكون اسم المستخدم من 3 أحرف على الأقل',
      'fr': 'Le nom d\'utilisateur doit comporter au moins 3 caractères.',
    },
    'j0b5g887': {
      'en': 'Enter your email address',
      'ar': 'أدخل عنوان بريدك الإلكتروني',
      'fr': 'Saisissez votre adresse e-mail',
    },
    'suhr81va': {
      'en': 'Enter a valid email address',
      'ar': 'أدخل عنوان بريد إلكتروني صحيح',
      'fr': 'Veuillez saisir une adresse e-mail valide',
    },
    'euafthya': {
      'en': 'Enter a password',
      'ar': 'أدخل كلمة المرور',
      'fr': 'Saisissez un mot de passe',
    },
    'gvpnygp0': {
      'en': 'Password must have at least 6 characters',
      'ar': 'يجب أن تتكون كلمة المرور من 6 أحرف على الأقل',
      'fr': 'Le mot de passe doit comporter au moins 6 caractères.',
    },
    '72to9d7t': {
      'en': 'Enter your phone number',
      'ar': 'أدخل رقم هاتفك',
      'fr': 'Saisissez votre numéro de téléphone',
    },
    'ogod5fve': {
      'en': 'Enter a valid phone number',
      'ar': 'أدخل رقم هاتف صحيح',
      'fr': 'Veuillez saisir un numéro de téléphone valide.',
    },
    'nlh28bwa': {
      'en': 'Create account',
      'ar': 'إنشاء حساب',
      'fr': 'Créer un compte',
    },
    'q016irxf': {
      'en': 'Already have an account?',
      'ar': 'هل لديك حساب بالفعل؟',
      'fr': 'Vous avez déjà un compte ?',
    },
    'phkp2ygz': {
      'en': 'Log in',
      'ar': 'تسجيل الدخول',
      'fr': 'Se connecter',
    },
    'lawmzzf5': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // forgetpassword
  {
    'mjehmkmw': {
      'en': 'Page Title',
      'ar': 'عنوان الصفحة',
      'fr': 'Titre de la page',
    },
    'hwgv1qul': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // editprofileforadmin
  {
    'gqjjdv75': {
      'en': 'Your profile',
      'ar': 'ملفك الشخصي',
      'fr': 'Votre profil',
    },
    'ixbu1qm5': {
      'en': 'Update your account details below.',
      'ar': 'قم بتحديث بيانات حسابك أدناه.',
      'fr': 'Mettez à jour les informations de votre compte ci-dessous.',
    },
    'nena4kbd': {
      'en': 'Username',
      'ar': 'اسم المستخدم',
      'fr': 'Nom d\'utilisateur',
    },
    'r1o3cldr': {
      'en': 'Your full name',
      'ar': 'اسمك الكامل',
      'fr': 'Votre nom complet',
    },
    'lpb9xuqw': {
      'en': 'Phone number',
      'ar': 'رقم التليفون',
      'fr': 'Numéro de téléphone',
    },
    'mswq3h08': {
      'en': '+216 12 345 678',
      'ar': '+216 12 345 678',
      'fr': '+216 12 345 678',
    },
    '0qmr7e53': {
      'en': 'Preferred language',
      'ar': 'اللغة المفضلة',
      'fr': 'Langue préférée',
    },
    'jdonkr4n': {
      'en': 'Select your language',
      'ar': 'اختر لغتك',
      'fr': 'Sélectionnez votre langue',
    },
    'hj50jvfw': {
      'en': 'Français',
      'ar': 'الفرنسية',
      'fr': 'Français',
    },
    '24vs9h6p': {
      'en': 'English',
      'ar': 'إنجليزي',
      'fr': 'Anglais',
    },
    '0rl025vy': {
      'en': 'العربية',
      'ar': 'العربية',
      'fr': 'L\'arabe',
    },
    '0xstaeka': {
      'en': 'New password',
      'ar': 'كلمة المرور الجديدة',
      'fr': 'Nouveau mot de passe',
    },
    'gbmjty81': {
      'en': 'Leave empty to keep your current password',
      'ar': 'اترك هذا الحقل فارغًا للاحتفاظ بكلمة مرورك الحالية',
      'fr': 'Laissez vide pour conserver votre mot de passe actuel.',
    },
    '29jpex6y': {
      'en': 'At least 6 characters',
      'ar': 'ستة أحرف على الأقل',
      'fr': 'Au moins 6 caractères',
    },
    '1f4t1qf6': {
      'en': 'Enter your username',
      'ar': 'أدخل اسم المستخدم الخاص بك',
      'fr': 'Saisissez votre nom d\'utilisateur',
    },
    'dsm02cbc': {
      'en': 'Username must have at least 3 characters',
      'ar': 'يجب أن يتكون اسم المستخدم من 3 أحرف على الأقل',
      'fr': 'Le nom d\'utilisateur doit comporter au moins 3 caractères.',
    },
    'o4msb9fv': {
      'en': 'Enter your phone number',
      'ar': 'أدخل رقم هاتفك',
      'fr': 'Saisissez votre numéro de téléphone',
    },
    'c1fwxmvp': {
      'en': 'Enter a valid phone number',
      'ar': 'أدخل رقم هاتف صحيح',
      'fr': 'Veuillez saisir un numéro de téléphone valide.',
    },
    'ljsz3seu': {
      'en': 'Save changes',
      'ar': 'حفظ التغييرات',
      'fr': 'Enregistrer les modifications',
    },
    'qxmiqtb1': {
      'en': 'Update profile',
      'ar': 'تحديث الملف الشخصي',
      'fr': 'Mettre à jour le profil',
    },
    '4igtwza2': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // addbookforadmin
  {
    '3b4r75vh': {
      'en': 'Book title',
      'ar': 'عنوان الكتاب',
      'fr': 'Titre du livre',
    },
    'ex33eki3': {
      'en': 'Enter the book title',
      'ar': 'أدخل عنوان الكتاب',
      'fr': 'Saisissez le titre du livre',
    },
    '6ozz34d3': {
      'en': 'ISBN',
      'ar': 'رقم الكتاب المعياري الدولي (ISBN)',
      'fr': 'ISBN',
    },
    'yi11cjy9': {
      'en': 'e.g. 978-3-16-148410-0',
      'ar': 'مثال: 978-3-16-148410-0',
      'fr': 'par exemple 978-3-16-148410-0',
    },
    'vlzl06yb': {
      'en': 'Author',
      'ar': 'مؤلف',
      'fr': 'Auteur',
    },
    '5l9tdvjr': {
      'en': 'Enter the author name',
      'ar': 'أدخل اسم المؤلف',
      'fr': 'Saisissez le nom de l\'auteur',
    },
    'o7451jse': {
      'en': 'Category',
      'ar': 'فئة',
      'fr': 'Catégorie',
    },
    'zlc7i8zs': {
      'en': 'Select a category',
      'ar': 'اختر فئة',
      'fr': 'Sélectionnez une catégorie',
    },
    'x4t424hq': {
      'en': 'Informatique',
      'ar': 'المعلوماتية',
      'fr': 'Informatique',
    },
    'swpokxnv': {
      'en': 'Sciences',
      'ar': 'علوم',
      'fr': 'Sciences',
    },
    'p6hvfrom': {
      'en': 'Littérature',
      'ar': 'الأدب',
      'fr': 'Littérature',
    },
    'ukj6zpzo': {
      'en': 'Histoire',
      'ar': 'تاريخ',
      'fr': 'Histoire',
    },
    'dtb6cxjn': {
      'en': 'Économie',
      'ar': 'الاقتصاد',
      'fr': 'Économie',
    },
    'xar8nveu': {
      'en': 'Description',
      'ar': 'وصف',
      'fr': 'Description',
    },
    'l5wduwj8': {
      'en': 'Short description of the book',
      'ar': 'وصف موجز للكتاب',
      'fr': 'Brève description du livre',
    },
    'igdwoez1': {
      'en': 'Cover URL',
      'ar': 'رابط الصفحة الرئيسية',
      'fr': 'URL de couverture',
    },
    'ebay1cu5': {
      'en': 'https://example.com/cover.jpg',
      'ar': 'https://example.com/cover.jpg',
      'fr': 'https://example.com/cover.jpg',
    },
    '9wgt8019': {
      'en': 'Publish year',
      'ar': 'سنة النشر',
      'fr': 'Année de publication',
    },
    'axnyou72': {
      'en': 'e.g. 2020',
      'ar': 'مثال: 2020',
      'fr': 'par exemple, 2020',
    },
    'mu0i5uws': {
      'en': 'Price (DT)',
      'ar': 'السعر (بالدولار التركي)',
      'fr': 'Prix ​​(DT)',
    },
    'a0u7j4og': {
      'en': 'e.g. 25.500',
      'ar': 'مثال: 25.500',
      'fr': 'par exemple 25 500',
    },
    'fyina1hu': {
      'en': 'Book count',
      'ar': 'عدد الكتب',
      'fr': 'Nombre de livres',
    },
    'q23xmefq': {
      'en': 'Number of copies, e.g. 3',
      'ar': 'عدد النسخ، على سبيل المثال 3',
      'fr': 'Nombre d\'exemplaires, par exemple 3',
    },
    'mmgvo4r3': {
      'en': 'Enter the book title',
      'ar': 'أدخل عنوان الكتاب',
      'fr': 'Saisissez le titre du livre',
    },
    'javw65mj': {
      'en': 'Enter the ISBN',
      'ar': 'أدخل رقم ISBN',
      'fr': 'Saisissez l\'ISBN',
    },
    'jqbbnh2f': {
      'en': 'Enter the author',
      'ar': 'أدخل اسم المؤلف',
      'fr': 'Entrez l\'auteur',
    },
    'ejrb40jt': {
      'en': 'Enter the number of copies',
      'ar': 'أدخل عدد النسخ',
      'fr': 'Saisissez le nombre de copies',
    },
    'up5av81z': {
      'en': 'Enter the price',
      'ar': 'أدخل السعر',
      'fr': 'Saisissez le prix',
    },
    'v9x48inv': {
      'en': 'Add book',
      'ar': 'أضف كتابًا',
      'fr': 'Ajouter un livre',
    },
    'ngnwt23h': {
      'en': 'Add book',
      'ar': 'أضف كتابًا',
      'fr': 'Ajouter un livre',
    },
    '5yube0rt': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // homeforadmin
  {
    'plkylhff': {
      'en': 'Welcome back',
      'ar': 'مرحبًا بعودتك',
      'fr': 'Content de te revoir',
    },
    'j0c5dsaa': {
      'en': 'Manage the catalog and your account from one place.',
      'ar': 'يمكنك إدارة الكتالوج وحسابك من مكان واحد.',
      'fr':
          'Gérez votre catalogue et votre compte depuis un seul et même endroit.',
    },
    '13hl0r8e': {
      'en': 'Quick actions',
      'ar': 'إجراءات سريعة',
      'fr': 'Actions rapides',
    },
    '9rb2g6g5': {
      'en': 'Browse books',
      'ar': 'تصفح الكتب',
      'fr': 'Parcourez les livres',
    },
    'jbr5hmh4': {
      'en': 'Search and manage the catalog',
      'ar': 'البحث في الكتالوج وإدارته',
      'fr': 'Rechercher et gérer le catalogue',
    },
    '37h0wivg': {
      'en': 'Add book',
      'ar': 'أضف كتابًا',
      'fr': 'Ajouter un livre',
    },
    'ns4erjzz': {
      'en': 'Add a new title to the shelves',
      'ar': 'أضف عنوانًا جديدًا إلى الرفوف',
      'fr': 'Ajouter un nouveau titre aux rayons',
    },
    'wfm9mmz8': {
      'en': 'My profile',
      'ar': 'ملفي الشخصي',
      'fr': 'Mon profil',
    },
    '0114xocg': {
      'en': 'View your account details',
      'ar': 'اطلع على تفاصيل حسابك',
      'fr': 'Consultez les détails de votre compte',
    },
    'oqlgupsv': {
      'en': 'Edit profile',
      'ar': 'تعديل الملف الشخصي',
      'fr': 'Modifier le profil',
    },
    '07fscmz4': {
      'en': 'Update your name, phone or password',
      'ar': 'قم بتحديث اسمك أو رقم هاتفك أو كلمة مرورك',
      'fr':
          'Mettez à jour votre nom, votre numéro de téléphone ou votre mot de passe.',
    },
    'o9v617ec': {
      'en': 'Dashboard',
      'ar': 'لوحة التحكم',
      'fr': 'Tableau de bord',
    },
    'ha72bttz': {
      'en': 'Menu',
      'ar': 'قائمة طعام',
      'fr': 'Menu',
    },
    'pc4kbue9': {
      'en': 'View profile',
      'ar': 'عرض الملف الشخصي',
      'fr': 'Voir le profil',
    },
    'dxs4c1nd': {
      'en': 'Update profile',
      'ar': 'تحديث الملف الشخصي',
      'fr': 'Mettre à jour le profil',
    },
    '0pze3o9v': {
      'en': 'Add book',
      'ar': 'أضف كتابًا',
      'fr': 'Ajouter un livre',
    },
    '3v5rwshv': {
      'en': 'Browse books',
      'ar': 'تصفح الكتب',
      'fr': 'Parcourez les livres',
    },
    'qrpqzf88': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // homeforuser
  {
    'qrbnnxtx': {
      'en': 'Welcome to the library',
      'ar': 'أهلاً بكم في المكتبة',
      'fr': 'Bienvenue à la bibliothèque',
    },
    '8vwro7sz': {
      'en': 'Discover, borrow and enjoy great books.',
      'ar': 'اكتشف الكتب الرائعة، واستعرها، واستمتع بها.',
      'fr': 'Découvrez, empruntez et appréciez de grands livres.',
    },
    '5u9ncc2y': {
      'en': 'Your account',
      'ar': 'حسابك',
      'fr': 'Votre compte',
    },
    's556z8sf': {
      'en': 'Browse books',
      'ar': 'تصفح الكتب',
      'fr': 'Parcourez les livres',
    },
    'mrogcpw2': {
      'en': 'Search the catalog by title, author or category',
      'ar': 'ابحث في الفهرس حسب العنوان أو المؤلف أو الفئة',
      'fr': 'Recherchez dans le catalogue par titre, auteur ou catégorie',
    },
    'n4joquy1': {
      'en': 'My favourites',
      'ar': 'مفضلاتي',
      'fr': 'Mes favoris',
    },
    '83bsxvad': {
      'en': 'Books you saved for later',
      'ar': 'الكتب التي حفظتها لوقت لاحق',
      'fr': 'Livres que vous avez enregistrés pour plus tard',
    },
    'zn5arnki': {
      'en': 'My purchases',
      'ar': 'مشترياتي',
      'fr': 'Mes achats',
    },
    'itx118p6': {
      'en': 'Books you bought',
      'ar': '',
      'fr': '',
    },
    '3ed2bdu3': {
      'en': 'Reading challenge',
      'ar': 'تحدي القراءة',
      'fr': 'Défi lecture',
    },
    '1uqw3jgy': {
      'en': 'Play a quick guessing game',
      'ar': 'العب لعبة تخمين سريعة',
      'fr': 'Jouez à un petit jeu de devinettes',
    },
    'a72vdh2o': {
      'en': 'My profile',
      'ar': 'ملفي الشخصي',
      'fr': 'Mon profil',
    },
    'v0yvcd29': {
      'en': 'View your details, edit them or log out',
      'ar': 'يمكنك الاطلاع على بياناتك أو تعديلها أو تسجيل الخروج.',
      'fr': 'Consultez vos informations, modifiez-les ou déconnectez-vous',
    },
    'a8t6rqq5': {
      'en': 'A reader lives a thousand lives before he dies.',
      'ar': 'يعيش القارئ ألف حياة قبل أن يموت.',
      'fr': 'Un lecteur vit mille vies avant de mourir.',
    },
    'wdplmps3': {
      'en': '— George R.R. Martin',
      'ar': '— جورج آر. آر. مارتن',
      'fr': '— George R.R. Martin',
    },
    'sr258xp7': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
    'gj1d757y': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // profileforadmin
  {
    'lrzruzhd': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'fr': 'E-mail',
    },
    '8rymsfym': {
      'en': 'Phone number',
      'ar': 'رقم التليفون',
      'fr': 'Numéro de téléphone',
    },
    'cjn39jsd': {
      'en': 'Joined at',
      'ar': 'انضم في',
      'fr': 'Inscrit à',
    },
    'md2lzygm': {
      'en': 'Edit profile',
      'ar': 'تعديل الملف الشخصي',
      'fr': 'Modifier le profil',
    },
    '50zm15ao': {
      'en': 'Log out',
      'ar': 'تسجيل الخروج',
      'fr': 'Déconnexion',
    },
    'wv9dc6q2': {
      'en': 'My profile',
      'ar': 'ملفي الشخصي',
      'fr': 'Mon profil',
    },
    'a1vh8wlk': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // browsebooksforadmin
  {
    'c7e4q3ln': {
      'en': 'Search by title, author or category',
      'ar': 'ابحث حسب العنوان أو المؤلف أو الفئة',
      'fr': 'Recherche par titre, auteur ou catégorie',
    },
    '1pqcprm1': {
      'en': 'All',
      'ar': 'الجميع',
      'fr': 'Tous',
    },
    'dbfewuqm': {
      'en': 'All',
      'ar': 'الجميع',
      'fr': 'Tous',
    },
    'c5ncpwgo': {
      'en': 'Informatique',
      'ar': 'المعلوماتية',
      'fr': 'Informatique',
    },
    '7wxaaj6q': {
      'en': 'Informatique',
      'ar': 'المعلوماتية',
      'fr': 'Informatique',
    },
    'ebcwv7p6': {
      'en': 'Sciences',
      'ar': 'علوم',
      'fr': 'Sciences',
    },
    '89g82jid': {
      'en': 'Sciences',
      'ar': 'علوم',
      'fr': 'Sciences',
    },
    'p0xdu3uo': {
      'en': 'Littérature',
      'ar': 'الأدب',
      'fr': 'Littérature',
    },
    'ra2e0dgv': {
      'en': 'Littérature',
      'ar': 'الأدب',
      'fr': 'Littérature',
    },
    '18ie20cb': {
      'en': 'Histoire',
      'ar': 'تاريخ',
      'fr': 'Histoire',
    },
    '1kybnpha': {
      'en': 'Histoire',
      'ar': 'تاريخ',
      'fr': 'Histoire',
    },
    'i4m9yvcw': {
      'en': 'Économie',
      'ar': 'الاقتصاد',
      'fr': 'Économie',
    },
    'b0krenum': {
      'en': 'Économie',
      'ar': 'الاقتصاد',
      'fr': 'Économie',
    },
    '2jgi9z6k': {
      'en': 'No books found',
      'ar': 'لم يتم العثور على أي كتاب',
      'fr': 'Aucun livre trouvé',
    },
    'wpwlxlkz': {
      'en': 'Books',
      'ar': 'الكتب',
      'fr': 'Livres',
    },
    'i9a2ooz0': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // bookdetailsforadmin
  {
    'emzwxhtp': {
      'en': 'ISBN',
      'ar': 'رقم الكتاب المعياري الدولي (ISBN)',
      'fr': 'ISBN',
    },
    'lsog4kwv': {
      'en': 'Publish year',
      'ar': 'سنة النشر',
      'fr': 'Année de publication',
    },
    'pac7lzz7': {
      'en': 'Description',
      'ar': 'وصف',
      'fr': 'Description',
    },
    '3c0k4730': {
      'en': 'Edit',
      'ar': 'يحرر',
      'fr': 'Modifier',
    },
    '9vj7omvi': {
      'en': 'Delete',
      'ar': 'يمسح',
      'fr': 'Supprimer',
    },
    'nuq8ijdd': {
      'en': 'Book details',
      'ar': 'تفاصيل الكتاب',
      'fr': 'Détails du livre',
    },
    '0o70dh62': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // editbookforadmin
  {
    '4g4jfq2c': {
      'en': 'Book title',
      'ar': 'عنوان الكتاب',
      'fr': 'Titre du livre',
    },
    'elb8fify': {
      'en': 'Enter the book title',
      'ar': 'أدخل عنوان الكتاب',
      'fr': 'Saisissez le titre du livre',
    },
    '1hdtxgil': {
      'en': 'ISBN',
      'ar': 'رقم الكتاب المعياري الدولي (ISBN)',
      'fr': 'ISBN',
    },
    'l9xxzg70': {
      'en': 'e.g. 978-3-16-148410-0',
      'ar': 'مثال: 978-3-16-148410-0',
      'fr': 'par exemple 978-3-16-148410-0',
    },
    'kl9ulbv6': {
      'en': 'Author',
      'ar': 'مؤلف',
      'fr': 'Auteur',
    },
    '0rmzmb7i': {
      'en': 'Enter the author name',
      'ar': 'أدخل اسم المؤلف',
      'fr': 'Saisissez le nom de l\'auteur',
    },
    'zv302sha': {
      'en': 'Category',
      'ar': 'فئة',
      'fr': 'Catégorie',
    },
    '2kblp1lz': {
      'en': 'Select a category',
      'ar': 'اختر فئة',
      'fr': 'Sélectionnez une catégorie',
    },
    'msbhemd9': {
      'en': 'Informatique',
      'ar': 'المعلوماتية',
      'fr': 'Informatique',
    },
    '9jxxwbsk': {
      'en': 'Sciences',
      'ar': 'علوم',
      'fr': 'Sciences',
    },
    '60xn9yb0': {
      'en': 'Littérature',
      'ar': 'الأدب',
      'fr': 'Littérature',
    },
    'teo5wbsp': {
      'en': 'Histoire',
      'ar': 'تاريخ',
      'fr': 'Histoire',
    },
    'f09jr9ad': {
      'en': 'Économie',
      'ar': 'الاقتصاد',
      'fr': 'Économie',
    },
    '38rogpkj': {
      'en': 'Description',
      'ar': 'وصف',
      'fr': 'Description',
    },
    '4lhb1xbe': {
      'en': 'Short description of the book',
      'ar': 'وصف موجز للكتاب',
      'fr': 'Brève description du livre',
    },
    'io0e6t0a': {
      'en': 'Cover URL',
      'ar': 'رابط الصفحة الرئيسية',
      'fr': 'URL de couverture',
    },
    'k278p3pi': {
      'en': 'https://example.com/cover.jpg',
      'ar': 'https://example.com/cover.jpg',
      'fr': 'https://example.com/cover.jpg',
    },
    '9kqnxmpn': {
      'en': 'Publish year',
      'ar': 'سنة النشر',
      'fr': 'Année de publication',
    },
    'lyuvdpyt': {
      'en': 'e.g. 2020',
      'ar': 'مثال: 2020',
      'fr': 'par exemple, 2020',
    },
    'qol86rl1': {
      'en': 'Enter the book title',
      'ar': 'أدخل عنوان الكتاب',
      'fr': 'Saisissez le titre du livre',
    },
    '8n7mya8j': {
      'en': 'Enter the ISBN',
      'ar': 'أدخل رقم ISBN',
      'fr': 'Saisissez l\'ISBN',
    },
    'v0rh9ul8': {
      'en': 'Enter the author',
      'ar': 'أدخل اسم المؤلف',
      'fr': 'Entrez l\'auteur',
    },
    'dkui5pnq': {
      'en': 'Save changes',
      'ar': 'حفظ التغييرات',
      'fr': 'Enregistrer les modifications',
    },
    'l8h7bjky': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
    },
    'b53wzg4e': {
      'en': 'Edit book',
      'ar': 'تحرير كتاب',
      'fr': 'Livre d\'édition',
    },
    '8f0pzto5': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // browsebooksforuser
  {
    '6dk1zq1x': {
      'en': 'Search by title, author or category',
      'ar': 'ابحث حسب العنوان أو المؤلف أو الفئة',
      'fr': 'Recherche par titre, auteur ou catégorie',
    },
    'rkskwwyh': {
      'en': 'All',
      'ar': 'الجميع',
      'fr': 'Tous',
    },
    'fsbu19re': {
      'en': 'All',
      'ar': 'الجميع',
      'fr': 'Tous',
    },
    'gbgiri74': {
      'en': 'Informatique',
      'ar': 'المعلوماتية',
      'fr': 'Informatique',
    },
    'wilal4zp': {
      'en': 'Informatique',
      'ar': 'المعلوماتية',
      'fr': 'Informatique',
    },
    '9jjxtfz5': {
      'en': 'Sciences',
      'ar': 'علوم',
      'fr': 'Sciences',
    },
    'femtyfh1': {
      'en': 'Sciences',
      'ar': 'علوم',
      'fr': 'Sciences',
    },
    'ig8nmcwg': {
      'en': 'Littérature',
      'ar': 'الأدب',
      'fr': 'Littérature',
    },
    'oas65wz2': {
      'en': 'Littérature',
      'ar': 'الأدب',
      'fr': 'Littérature',
    },
    '39oqnhz7': {
      'en': 'Histoire',
      'ar': 'تاريخ',
      'fr': 'Histoire',
    },
    'e088h9b6': {
      'en': 'Histoire',
      'ar': 'تاريخ',
      'fr': 'Histoire',
    },
    '0g72oh8v': {
      'en': 'Économie',
      'ar': 'الاقتصاد',
      'fr': 'Économie',
    },
    'tbcr5939': {
      'en': 'Économie',
      'ar': 'الاقتصاد',
      'fr': 'Économie',
    },
    '701z5q75': {
      'en': 'Buy',
      'ar': 'يشتري',
      'fr': 'Acheter',
    },
    'enljow4o': {
      'en': 'Sold out',
      'ar': 'نفذ',
      'fr': 'Épuisé',
    },
    'rtqc407h': {
      'en': 'No books found',
      'ar': 'لم يتم العثور على أي كتاب',
      'fr': 'Aucun livre trouvé',
    },
    'rs6m2h3a': {
      'en': 'Books',
      'ar': 'الكتب',
      'fr': 'Livres',
    },
    'w1o2yrpj': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // favoritebooksforuser
  {
    'ft51ctrm': {
      'en': 'No favourites yet',
      'ar': 'لا توجد مفضلات حتى الآن',
      'fr': 'Pas encore de favoris',
    },
    'jpiskzld': {
      'en': 'Tap the heart on any book to save it here.',
      'ar': 'انقر على القلب الموجود على أي كتاب لحفظه هنا.',
      'fr': 'Touchez le cœur de n\'importe quel livre pour l\'enregistrer ici.',
    },
    'bekgskpq': {
      'en': 'Browse books',
      'ar': 'تصفح الكتب',
      'fr': 'Parcourez les livres',
    },
    '5epqaq6t': {
      'en': 'My favourites',
      'ar': 'مفضلاتي',
      'fr': 'Mes favoris',
    },
    'x3ibevld': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // profileforuser
  {
    'u3d8x5ap': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'fr': 'E-mail',
    },
    'ls1hx2bc': {
      'en': 'Phone number',
      'ar': 'رقم التليفون',
      'fr': 'Numéro de téléphone',
    },
    'nxcze77y': {
      'en': 'Preferred language',
      'ar': 'اللغة المفضلة',
      'fr': 'Langue préférée',
    },
    'mhtp8jac': {
      'en': 'Member since',
      'ar': 'عضو منذ',
      'fr': 'Membre depuis',
    },
    '6el7lg3r': {
      'en': 'Edit profile',
      'ar': 'تعديل الملف الشخصي',
      'fr': 'Modifier le profil',
    },
    '2yqvcy64': {
      'en': 'Log out',
      'ar': 'تسجيل الخروج',
      'fr': 'Déconnexion',
    },
    '3jobnwgh': {
      'en': 'My profile',
      'ar': 'ملفي الشخصي',
      'fr': 'Mon profil',
    },
    'tqmqkgfm': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // editprofileforuser
  {
    'p6s1qxqj': {
      'en': 'Your profile',
      'ar': 'ملفك الشخصي',
      'fr': 'Votre profil',
    },
    'gzajf4pz': {
      'en': 'Keep your library account details up to date.',
      'ar': 'احرص على تحديث بيانات حسابك في المكتبة باستمرار.',
      'fr':
          'Veuillez tenir à jour les informations relatives à votre compte de bibliothèque.',
    },
    'ho80xkig': {
      'en': 'Username',
      'ar': 'اسم المستخدم',
      'fr': 'Nom d\'utilisateur',
    },
    '69lp8dhu': {
      'en': 'Your full name',
      'ar': 'اسمك الكامل',
      'fr': 'Votre nom complet',
    },
    '8xy2lq16': {
      'en': 'Phone number',
      'ar': 'رقم التليفون',
      'fr': 'Numéro de téléphone',
    },
    'hc1w2ywa': {
      'en': '+216 12 345 678',
      'ar': '+216 12 345 678',
      'fr': '+216 12 345 678',
    },
    'cxg65c6m': {
      'en': 'Preferred language',
      'ar': 'اللغة المفضلة',
      'fr': 'Langue préférée',
    },
    'dxa6zcxb': {
      'en': 'Select your language',
      'ar': 'اختر لغتك',
      'fr': 'Sélectionnez votre langue',
    },
    'js6fj1dx': {
      'en': 'Français',
      'ar': 'الفرنسية',
      'fr': 'Français',
    },
    'g3s046s6': {
      'en': 'English',
      'ar': 'إنجليزي',
      'fr': 'Anglais',
    },
    'xwcrcuzd': {
      'en': 'العربية',
      'ar': 'العربية',
      'fr': 'L\'arabe',
    },
    '0pzf9c4y': {
      'en': 'New password',
      'ar': 'كلمة المرور الجديدة',
      'fr': 'Nouveau mot de passe',
    },
    'wc41heoi': {
      'en': 'Leave empty to keep your current password',
      'ar': 'اترك هذا الحقل فارغًا للاحتفاظ بكلمة مرورك الحالية',
      'fr': 'Laissez vide pour conserver votre mot de passe actuel.',
    },
    'tnugul8u': {
      'en': 'At least 6 characters',
      'ar': 'ستة أحرف على الأقل',
      'fr': 'Au moins 6 caractères',
    },
    'fth1y9i3': {
      'en': 'Enter your username',
      'ar': 'أدخل اسم المستخدم الخاص بك',
      'fr': 'Saisissez votre nom d\'utilisateur',
    },
    '95g9w7wc': {
      'en': 'Username must have at least 3 characters',
      'ar': 'يجب أن يتكون اسم المستخدم من 3 أحرف على الأقل',
      'fr': 'Le nom d\'utilisateur doit comporter au moins 3 caractères.',
    },
    'vpbhf75g': {
      'en': 'Enter your phone number',
      'ar': 'أدخل رقم هاتفك',
      'fr': 'Saisissez votre numéro de téléphone',
    },
    'kgb1lrjl': {
      'en': 'Enter a valid phone number',
      'ar': 'أدخل رقم هاتف صحيح',
      'fr': 'Veuillez saisir un numéro de téléphone valide.',
    },
    'ply5f9r4': {
      'en': 'Save changes',
      'ar': 'حفظ التغييرات',
      'fr': 'Enregistrer les modifications',
    },
    'w3x7yn6f': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
    },
    'hieruka5': {
      'en': 'Edit profile',
      'ar': 'تعديل الملف الشخصي',
      'fr': 'Modifier le profil',
    },
    'vefmk3ms': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // boughtbooksforuser
  {
    'miv2wd2c': {
      'en': 'No purchases yet',
      'ar': 'لم يتم إجراء أي عمليات شراء حتى الآن',
      'fr': 'Aucun achat pour le moment',
    },
    '3ibqt29r': {
      'en': 'Books you buy will appear here.',
      'ar': 'ستظهر الكتب التي تشتريها هنا.',
      'fr': 'Les livres que vous achetez apparaîtront ici.',
    },
    'h4e3n02a': {
      'en': 'Browse books',
      'ar': 'تصفح الكتب',
      'fr': 'Parcourez les livres',
    },
    'xojskhat': {
      'en': 'My purchases',
      'ar': 'مشترياتي',
      'fr': 'Mes achats',
    },
    'r8s73pv4': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // bookdetailsforuser
  {
    'ubyh490m': {
      'en': 'Book details',
      'ar': 'تفاصيل الكتاب',
      'fr': 'Détails du livre',
    },
    'eumb7t3o': {
      'en': 'Price',
      'ar': 'سعر',
      'fr': 'Prix',
    },
    '2fef7we0': {
      'en': 'ISBN',
      'ar': 'رقم الكتاب المعياري الدولي (ISBN)',
      'fr': 'ISBN',
    },
    't2guhei1': {
      'en': 'Publish year',
      'ar': 'سنة النشر',
      'fr': 'Année de publication',
    },
    '9awskrzo': {
      'en': 'Description',
      'ar': 'وصف',
      'fr': 'Description',
    },
    'k3jvrlum': {
      'en': 'Buy',
      'ar': 'يشتري',
      'fr': 'Acheter',
    },
    'd05ydw1a': {
      'en': 'Sold out',
      'ar': 'نفذ',
      'fr': 'Épuisé',
    },
    'nonfr628': {
      'en': 'Favourite',
      'ar': 'مفضل',
      'fr': 'Préféré',
    },
    'k5aikuwe': {
      'en': 'Favourited',
      'ar': 'مفضل',
      'fr': 'Favori',
    },
  },
  // defilecture
  {
    'ifwvbkrn': {
      'en': 'Reading challenge',
      'ar': 'تحدي القراءة',
      'fr': 'Défi lecture',
    },
    'd7kwj8k0': {
      'en': 'Guess the book from its summary',
      'ar': 'خمّن الكتاب من ملخصه',
      'fr': 'Devinez le livre à partir de son résumé',
    },
    'ut8odv9b': {
      'en': 'Score',
      'ar': 'النتيجة',
      'fr': 'Score',
    },
    'hu4r7ga2': {
      'en': 'Which book is this?',
      'ar': 'ما هو هذا الكتاب؟',
      'fr': 'Quel est ce livre ?',
    },
    'e0mxhsrn': {
      'en': 'Correct!',
      'ar': 'إجابة صحيحة!',
      'fr': 'Bravo !',
    },
    'lhxyzrrg': {
      'en': 'Not quite, try another title',
      'ar': 'ليس تماماً، جرّب عنواناً آخر',
      'fr': 'Pas tout à fait, essayez un autre titre',
    },
    '45kopjkh': {
      'en': 'Next question',
      'ar': 'السؤال التالي',
      'fr': 'Question suivante',
    },
  },
  // BuySuccessDialog
  {
    '9agwont6': {
      'en': 'Book bought!',
      'ar': 'تم شراء الكتاب!',
      'fr': 'Livre acheté !',
    },
    'hghjkd3a': {
      'en': 'You can find it in My purchases.',
      'ar': 'ستجده في مشترياتي.',
      'fr': 'Vous le retrouverez dans Mes achats.',
    },
  },
  // Miscellaneous
  {
    'hax8g4p9': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'ushf1f49': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'qiinm4up': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'z7ilp2lv': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'uk9tm1nf': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'hu2u9324': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '3ws8zvwt': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'aut3jttn': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'pyq6b7e7': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'uq4qdb7l': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'xqft2sl8': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '81xu02en': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'h47zmk93': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'mu7spsc4': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'vwnslzst': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'igqmam6v': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'eg8gpp6s': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'aq8dpusv': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'tlzpqnps': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'tiaqp9mm': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'hpsgqjp2': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'zgu7pr45': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'mrxinuhk': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'h46fzris': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'uc1ovha9': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'r08pwbjt': {
      'en': '',
      'ar': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
