import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:note_schedule_remid_bloc/blocs/auth/auth_event.dart';
import 'package:note_schedule_remid_bloc/blocs/auth/auth_state.dart';

class GoogleSignInBloc extends Bloc<GoogleSignInEvent, GoogleSignInState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  GoogleSignInBloc() : super(GoogleSignInInitial()) {
    on<GoogleSignInRequested>(_onGoogleSignInRequested);
    on<GoogleSignOutRequested>(_onGoogleSignOutRequested);
  }

  Future<void> _onGoogleSignInRequested(
    GoogleSignInRequested event,
    Emitter<GoogleSignInState> emit,
  ) async {
    emit(GoogleSignInLoading());

    final result = await _handleGoogleSignIn();
    result.fold(
      (failure) => emit(GoogleSignInFailure(failure.toString())),
      (user) => emit(GoogleSignInSuccess(user)),
    );
  }

  Future<void> _onGoogleSignOutRequested(
    GoogleSignOutRequested event,
    Emitter<GoogleSignInState> emit,
  ) async {
    await _auth.signOut();
    emit(GoogleSignInInitial());
  }

  Future<bool> isAuthenticated() async {
    final user = _auth.currentUser;
    log("usr $user");
    return user != null;
  }

  Future<Either<String, User?>> _handleGoogleSignIn() async {
    try {
      await InternetAddress.lookup('google.com');

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return const Left("User cancelled authentication");
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      if (userCredential.user != null) {
        return Right(userCredential.user);
      } else {
        return const Left("Something went wrong!");
      }
    } catch (e) {
      return const Left("No internet connection or something went wrong!");
    }
  }
}
