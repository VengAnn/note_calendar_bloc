import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:note_schedule_remid_bloc/presentation/blocs/auth/auth_event.dart';
import 'package:note_schedule_remid_bloc/presentation/blocs/auth/auth_state.dart';

class GoogleSignInBloc extends Bloc<GoogleSignInEvent, GoogleSignInState> {
  final GoogleSignIn _googleSignIn;

  GoogleSignInBloc(this._googleSignIn) : super(GoogleSignInInitial()) {
    on<GoogleSignInRequested>(_onGoogleSignInRequested);
    on<GoogleSignOutRequested>(
        _onGoogleSignOutRequested); // Register event handler for GoogleSignOutRequested
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
    GoogleSignOutRequested event, // Correct event type
    Emitter<GoogleSignInState> emit,
  ) async {
    await _googleSignIn.signOut();
    emit(GoogleSignInInitial());
  }

  // Future<Either<Exception, GoogleSignInAccount?>> _handleGoogleSignIn() async {
  //   try {
  //     final user = await _googleSignIn.signIn();
  //     return Right(user);
  //   } catch (e) {
  //     return Left(Exception(e.toString()));
  //   }
  // }
  Future<Either<Exception, GoogleSignInAccount?>> _handleGoogleSignIn() async {
    try {
      final user = await _googleSignIn.signIn();
      if (user == null) {
        return Left(Exception("User cancelled authentication"));
      }
      return Right(user);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
