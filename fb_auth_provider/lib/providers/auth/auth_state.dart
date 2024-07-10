// part of 'auth_provider.dart';

import 'package:firebase_auth/firebase_auth.dart' as fbAuth;

enum AuthStatus {
  unKnown,
  authenticated,
  unauthenticated,
}

class AuthState {
  final AuthStatus authStatus;
  final fbAuth.User? user;

  AuthState({required this.authStatus, this.user});

  factory AuthState.unKnown() {
    return AuthState(authStatus: AuthStatus.unKnown);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthState &&
        other.authStatus == authStatus &&
        other.user == user;
  }

  @override
  int get hashCode => authStatus.hashCode ^ user.hashCode;

  @override
  String toString() => 'AuthState(authStatus: $authStatus, user: $user)';

  AuthState copyWith({
    AuthStatus? authStatus,
    fbAuth.User? user,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      user: user ?? this.user,
    );
  }
}
