import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:note_schedule_remid_bloc/presentation/blocs/auth/auth_bloc.dart';
import 'package:note_schedule_remid_bloc/presentation/blocs/auth/auth_event.dart';
import 'package:note_schedule_remid_bloc/presentation/blocs/auth/auth_state.dart';

class GoogleSignInPage extends StatelessWidget {
  const GoogleSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Sign-In'),
      ),
      body: BlocBuilder<GoogleSignInBloc, GoogleSignInState>(
        builder: (context, state) {
          if (state is GoogleSignInInitial || state is GoogleSignInFailure) {
            return _buildSignInButton(context);
          } else if (state is GoogleSignInLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GoogleSignInSuccess) {
            return _buildSignedInContent(context, state.user);
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildSignInButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          context.read<GoogleSignInBloc>().add(GoogleSignInRequested());
        },
        child: const Text('Sign in with Google'),
      ),
    );
  }

  Widget _buildSignedInContent(
      BuildContext context, GoogleSignInAccount? user) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Signed in as: ${user?.displayName}'),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              context.read<GoogleSignInBloc>().add(GoogleSignOutRequested());
            },
            child: const Text('Sign out'),
          ),
        ],
      ),
    );
  }
}
