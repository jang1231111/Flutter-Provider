// part 'auth_state.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
import 'package:fb_auth_provider/providers/auth/auth_state.dart';
import 'package:fb_auth_provider/repositories/auth_repositories.dart';

class AuthProvider with ChangeNotifier {
  AuthState _state = AuthState.unKnown();
  AuthState get state => _state;

  final AuthRepositories authRepositories;

  AuthProvider({
    required this.authRepositories,
  });

  void udpate(fbAuth.User? user) {
    if (user != null) {
      _state = _state.copyWith(
        authStatus: AuthStatus.authenticated,
        user: user,
      );
    } else {
      _state = _state.copyWith(authStatus: AuthStatus.unauthenticated);
    }

    print('authState: $_state');
    notifyListeners();
  }

  void signout() async {
    await authRepositories.signout();
  }
}
