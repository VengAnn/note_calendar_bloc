import 'package:equatable/equatable.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class GoogleSignInState extends Equatable {
  const GoogleSignInState();

  @override
  List<Object?> get props => [];
}

class GoogleSignInInitial extends GoogleSignInState {}

class GoogleSignInLoading extends GoogleSignInState {}

class GoogleSignInSuccess extends GoogleSignInState {
  final GoogleSignInAccount? user;

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