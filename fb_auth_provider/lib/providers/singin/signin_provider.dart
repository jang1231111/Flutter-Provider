import 'package:fb_auth_provider/models/custom_error.dart';
import 'package:fb_auth_provider/providers/singin/signin_state.dart';
import 'package:fb_auth_provider/repositories/auth_repositories.dart';
import 'package:flutter/material.dart';

class SigninProvider with ChangeNotifier {
  SigninState _state = SigninState.initial();
  SigninState get state => _state;

  SigninProvider({required this.authRepositories});

  final AuthRepositories authRepositories;

  Future<void> signin({
    required String email,
    required String password,
  }) async {
    _state = _state.copyWith(signinStatus: SigninStatus.submitting);
    notifyListeners();

    try {
      await authRepositories.signin(email: email, password: password);
      _state = _state.copyWith(signinStatus: SigninStatus.success);
      notifyListeners();
    } on CustomError catch (e) {
      _state = _state.copyWith(signinStatus: SigninStatus.error, error: e);
      notifyListeners();
      rethrow;
    }
  }
}
