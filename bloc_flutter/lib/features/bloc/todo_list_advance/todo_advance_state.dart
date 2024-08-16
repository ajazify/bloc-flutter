part of 'todo_advance_bloc.dart';

class TodoListAdvanceState {
  final List<TodoAdvanceResponse> listResponse;
  final bool isLoading;
  TodoListAdvanceState({required this.listResponse, required this.isLoading});
}

final class TodoListAdvanceInitial extends TodoListAdvanceState {
  TodoListAdvanceInitial() : super(listResponse: [], isLoading: false);
}
