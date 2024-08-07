import 'package:fb_auth_provider/models/custom_error.dart';

enum SigninStatus {
  initial,
  submitting,
  success,
  error,
}

class SigninState {
  final SigninStatus signinStatus;
  final CustomError error;

  SigninState({required this.signinStatus, required this.error});

  factory SigninState.initial() {
    return SigninState(
        signinStatus: SigninStatus.initial, error: CustomError());
  }

  @override
  String toString() =>
      'SigninState(signinStatus: $signinStatus, error: $error)';

  SigninState copyWith({
    SigninStatus? signinStatus,
    CustomError? error,
  }) {
    return SigninState(
      signinStatus: signinStatus ?? this.signinStatus,
      error: error ?? this.error,
    );
  }
}
