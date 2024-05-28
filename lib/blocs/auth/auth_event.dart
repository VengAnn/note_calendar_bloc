import 'package:equatable/equatable.dart';

// Define events
abstract class GoogleSignInEvent extends Equatable {
  const GoogleSignInEvent();

  @override
  List<Object> get props => [];
}

class GoogleSignInRequested extends GoogleSignInEvent {}

class GoogleSignOutRequested extends GoogleSignInEvent {}

class CheckGoogleSignInStatus extends GoogleSignInEvent {}

// // New event to check if user is already signed in
// class CheckGoogleSignInStatus extends GoogleSignInEvent {}
