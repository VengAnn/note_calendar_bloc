import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyMaterialLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const MyMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'vn';

  @override
  Future<MaterialLocalizations> load(Locale locale) =>
      DefaultMaterialLocalizations.load(locale);

  @override
  bool shouldReload(MyMaterialLocalizationsDelegate old) => false;
}

class MyCupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const MyCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'vn';

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      DefaultCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(MyCupertinoLocalizationsDelegate old) => false;
}
