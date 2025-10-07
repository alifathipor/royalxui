import 'package:get/get.dart';

class Locale extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      LocaleConst.changeLanguage: 'Change Language',
      LocaleConst.en: 'English',
      LocaleConst.fa: 'Persian',
      LocaleConst.changeTheme: 'Change Theme',
      LocaleConst.dark: 'Dark',
      LocaleConst.light: 'Light',
      LocaleConst.teal: 'Teal',
      LocaleConst.green: 'Green',
      LocaleConst.blue: 'Blue',
      LocaleConst.royal: 'Royal',
      LocaleConst.deepPurple: 'Deep Purple',
      LocaleConst.changeColor: 'Change Color',
      LocaleConst.start: 'Start',
      LocaleConst.next: 'Next',
      LocaleConst.exit: 'Exit',
      LocaleConst.previous: 'Previous',
      LocaleConst.initialSetup: 'Initial Setup',
      LocaleConst.enterVerificationCode: 'Enter Verification Code',
      LocaleConst.sendVerificationEmail: 'Send Verification Email',
      LocaleConst.loginToYourAccount: 'Login To Your Account',
      LocaleConst.verifyEmail: 'Verify Email',
      LocaleConst.confirmCode: 'Confirm Code',
      LocaleConst.cannotBeEmpty: 'Cannot Be Empty',
      LocaleConst.email: 'Email',
      LocaleConst.parentTag: 'ParentTag',
      LocaleConst.emailCannotBeEmpty: 'Email Cannot Be Empty',
      LocaleConst.parentTagCannotBeEmpty: 'Parent Tag Cannot Be Empty',
    },
    'fa': {
      LocaleConst.changeLanguage: 'تغییر زبان',
      LocaleConst.en: 'انگلیسی',
      LocaleConst.fa: 'فارسی',
      LocaleConst.changeTheme: 'تغییر تم',
      LocaleConst.dark: 'تاریک',
      LocaleConst.light: 'روشن',
      LocaleConst.teal: 'فیروزه‌ای',
      LocaleConst.green: 'سبز',
      LocaleConst.blue: 'آبی',
      LocaleConst.royal: 'رویال',
      LocaleConst.deepPurple: 'ارغوانی',
      LocaleConst.changeColor: 'تغییر رنگ',
      LocaleConst.start: 'شروع',
      LocaleConst.next: 'بعدی',
      LocaleConst.exit: 'پایان',
      LocaleConst.previous: 'قبلی',
      LocaleConst.initialSetup: 'تنظیمات اولیه',
      LocaleConst.enterVerificationCode: 'ورود به حساب کاربری',
      LocaleConst.sendVerificationEmail: 'ارسال ایمیل تایید',
      LocaleConst.loginToYourAccount: 'ورود کد تایید',
      LocaleConst.verifyEmail: 'تایید ایمیل',
      LocaleConst.confirmCode: 'تایید کد',
      LocaleConst.cannotBeEmpty: 'نمی تواند خالی باشد',
      LocaleConst.email: 'ایمیل',
      LocaleConst.parentTag: 'تگ مدیر',
      LocaleConst.emailCannotBeEmpty: 'ایمیل نمی تواند خالی باشد',
      LocaleConst.parentTagCannotBeEmpty: 'تگ مدیر نمی تواند خالی باشد',
    },
  };
}

class LocaleConst {
  static String changeLanguage = 'changeLanguage';
  static String dark = 'dark';
  static String light = 'light';
  static String changeTheme = 'changeTheme';
  static String en = 'en';
  static String fa = 'fa';
  static String teal = 'teal';
  static String green = 'green';
  static String blue = 'blue';
  static String deepPurple = 'deepPurple';
  static String royal = 'royal';
  static String changeColor = 'changeColor';
  static String start = 'start';
  static String next = 'next';
  static String exit = 'exit';
  static String previous = 'previous';
  static String initialSetup = 'initialSetup';
  static String enterVerificationCode = 'enterVerificationCode';
  static String sendVerificationEmail = 'sendVerificationEmail';
  static String loginToYourAccount = 'loginToYourAccount';
  static String verifyEmail = 'verifyEmail';
  static String confirmCode = 'confirmCode';
  static String cannotBeEmpty = 'cannotBeEmpty';
  static String email = 'email';
  static String parentTag = 'parentTag';
  static String emailCannotBeEmpty = 'emailcannotBeEmpty';
  static String parentTagCannotBeEmpty = 'parentTagCannotBeEmpty';
}
