// Define states
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class GoogleSignInState extends Equatable {
  const GoogleSignInState();

  @override
  List<Object?> get props => [];
}

class GoogleSignInInitial extends GoogleSignInState {}

class GoogleSignInLoading extends GoogleSignInState {}

class GoogleSignInSuccess extends GoogleSignInState {
  final User? user;

  const GoogleSignInSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class GoogleSignInFailure extends GoogleSignInState {
  final String error;

  const GoogleSignInFailure(this.error);

  @override
  List<Object?> get props => [error];
}
