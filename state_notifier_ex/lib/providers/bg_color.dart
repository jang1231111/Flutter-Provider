import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

class BgColorState {
  final Color color;

  BgColorState({required this.color});

  BgColorState copyWith({
    Color? color,
  }) {
    return BgColorState(
      color: color ?? this.color,
    );
  }

  @override
  String toString() => 'BgColorState(color: $color)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BgColorState && other.color == color;
  }

  @override
  int get hashCode => color.hashCode;
}

class BgColor extends StateNotifier<BgColorState> {
  BgColor() : super(BgColorState(color: Colors.blue));

  void changeColor() {
    if (state.color == Colors.blue) {
      state = state.copyWith(color: Colors.black);
    } else if (state.color == Colors.black) {
      state = state.copyWith(color: Colors.red);
    }else  {
      state = state.copyWith(color: Colors.blue);
    }
  }
}
