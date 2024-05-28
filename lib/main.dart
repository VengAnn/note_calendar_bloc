import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:note_schedule_remid_bloc/blocs/auth/auth_bloc.dart';
import 'package:note_schedule_remid_bloc/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:note_schedule_remid_bloc/presentations/pages/example/google_sign_in_page.dart';
import 'package:note_schedule_remid_bloc/utils/localization/custom_localizations.dart';

Future<void> _initializeFirebase() async {
  // Initialize Firebase with credentials
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

void main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize EasyLocalization and Firebase
  await EasyLocalization.ensureInitialized();
  await _initializeFirebase();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('vn'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'), // default language
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // var sizeWidth = MediaQuery.of(context).size.width;
    // var sizeHeigth = MediaQuery.of(context).size.height;
    return MultiBlocProvider(
      providers: [
        BlocProvider<GoogleSignInBloc>(
          create: (context) => GoogleSignInBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Schedule calendar',
        theme: ThemeData(),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          // fix error warning with vn language
          const MyMaterialLocalizationsDelegate(),
          const MyCupertinoLocalizationsDelegate(),
          EasyLocalization.of(context)!.delegate,
        ],
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: const GoogleSignInPage(),
        //home: Container(),
      ),
    );
  }
}

// this for changes language
///  context.setLocale(const Locale('en'));