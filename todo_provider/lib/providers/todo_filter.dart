import 'package:equatable/equatable.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:todo_provider/models/todo_model.dart';

class TodoFilterState extends Equatable {
  final Filter filter;

  TodoFilterState({
    required this.filter,
  });

  factory TodoFilterState.initial() {
    return TodoFilterState(filter: Filter.all);
  }

  @override
  String toString() => 'TodoFilterState(filter: $filter)';

  @override
  List<Object?> get props => [filter];

  TodoFilterState copyWith({
    Filter? filter,
  }) {
    return TodoFilterState(
      filter: filter ?? this.filter,
    );
  }
}

class TodoFilter extends StateNotifier<TodoFilterState> {
  TodoFilter() : super(TodoFilterState.initial());

  void changeFilter(Filter newFilter) {
    state = state.copyWith(filter: newFilter);
  }
}
