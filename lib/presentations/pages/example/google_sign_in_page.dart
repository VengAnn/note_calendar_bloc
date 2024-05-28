import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_schedule_remid_bloc/blocs/auth/auth_bloc.dart';
import 'package:note_schedule_remid_bloc/blocs/auth/auth_event.dart';
import 'package:note_schedule_remid_bloc/blocs/auth/auth_state.dart';
import 'package:note_schedule_remid_bloc/components/dialogs.dart';

class GoogleSignInPage extends StatefulWidget {
  const GoogleSignInPage({super.key});

  @override
  State<GoogleSignInPage> createState() => _GoogleSignInPageState();
}

class _GoogleSignInPageState extends State<GoogleSignInPage> {
  @override
  void initState() {
    super.initState();
    _checkSignInStatus();
  }

  Future<void> _checkSignInStatus() async {
    final bool isAuthenticated =
        await context.read<GoogleSignInBloc>().isAuthenticated();
    log("User authenticated: $isAuthenticated");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Sign-In'),
      ),
      body: BlocConsumer<GoogleSignInBloc, GoogleSignInState>(
        listener: (context, state) {
          if (state is GoogleSignInFailure) {
            Dialogs.showSnackBar(context, state.error);
          }
        },
        builder: (context, state) {
          if (state is GoogleSignInInitial || state is GoogleSignInFailure) {
            log("state 1 : $state");
            return _buildSignInButton(context);
          } else if (state is GoogleSignInLoading) {
            log("state 2 : $state");
            return const Center(child: CircularProgressIndicator());
          } else if (state is GoogleSignInSuccess) {
            log("state 3: $state");
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
        child: Text('sign_up_text'.tr()),
      ),
    );
  }

  Widget _buildSignedInContent(BuildContext context, User? user) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('sign in: ${user?.displayName ?? ''}'),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              context.read<GoogleSignInBloc>().add(GoogleSignOutRequested());
            },
            child: Text('sign_out_text'.tr()),
          ),
        ],
      ),
    );
  }
}
