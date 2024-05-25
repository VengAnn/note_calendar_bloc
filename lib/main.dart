import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:note_schedule_remid_bloc/firebase_options.dart';
import 'package:note_schedule_remid_bloc/presentation/blocs/auth/auth_bloc.dart';
import 'package:note_schedule_remid_bloc/presentation/pages/example/google_sign_in_page.dart';

Future<void> _initializeFirebase() async {
  // initialize with Firebase credentials
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _initializeFirebase();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GoogleSignInBloc(GoogleSignIn()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Schedule calendar',
        home: GoogleSignInPage(),
      ),
    );
  }
}
