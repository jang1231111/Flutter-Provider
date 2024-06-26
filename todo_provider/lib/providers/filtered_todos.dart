import 'package:equatable/equatable.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:todo_provider/models/todo_model.dart';
import 'package:todo_provider/providers/providers.dart';

class FilteredTodosState extends Equatable {
  final List<Todo> filteredTodos;

  FilteredTodosState({required this.filteredTodos});

  factory FilteredTodosState.initial() {
    return FilteredTodosState(filteredTodos: []);
  }

  @override
  List<Object?> get props => [filteredTodos];

  FilteredTodosState copyWith({
    List<Todo>? filteredTodos,
  }) {
    return FilteredTodosState(
      filteredTodos: filteredTodos ?? this.filteredTodos,
    );
  }

  @override
  String toString() => 'FilteredTodosState(filteredTodos: $filteredTodos)';
}

class FilteredTodos extends StateNotifier<FilteredTodosState>
    with LocatorMixin {
  FilteredTodos() : super(FilteredTodosState.initial());

  @override
  void update(Locator watch) {
    final Filter filter = watch<TodoFilterState>().filter;
    final String searchTerm = watch<TodoSearchState>().searchTerm;
    final List<Todo> todos = watch<TodoListState>().todos;

    List<Todo> _filteredTodos;

    switch (filter) {
      case Filter.active:
        _filteredTodos = todos.where((Todo todo) => !todo.completed).toList();
        break;
      case Filter.completed:
        _filteredTodos = todos.where((Todo todo) => todo.completed).toList();
        break;
      case Filter.all:
      default:
        _filteredTodos = todos;
    }

    if (searchTerm.isNotEmpty) {
      _filteredTodos = _filteredTodos
          .where(
            (Todo todo) => todo.desc.toLowerCase().contains(searchTerm),
          )
          .toList();
    }

    state = state.copyWith(filteredTodos: _filteredTodos);

    super.update(watch);
  }
}
