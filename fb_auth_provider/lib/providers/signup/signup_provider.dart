import 'package:fb_auth_provider/models/custom_error.dart';
import 'package:fb_auth_provider/providers/signup/signup_state.dart';
import 'package:fb_auth_provider/repositories/auth_repositories.dart';
import 'package:flutter/material.dart';

class SignupProvider with ChangeNotifier {
  SignupState _state = SignupState.initial();
  SignupState get state => _state;

  SignupProvider({required this.authRepositories});

  final AuthRepositories authRepositories;

  Future<void> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    _state = _state.copyWith(signupStatus: SignupStatus.submitting);
    notifyListeners();

    try {
      await authRepositories.signup(
          name: name, email: email, password: password);
      _state = _state.copyWith(signupStatus: SignupStatus.success);
      notifyListeners();
    } on CustomError catch (e) {
      _state = _state.copyWith(signupStatus: SignupStatus.error, error: e);
      notifyListeners();
      rethrow;
    }
  }
}
