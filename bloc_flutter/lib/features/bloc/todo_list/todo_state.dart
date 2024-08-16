part of 'todo_bloc.dart';

class TodoListState {
  List<String> list;
  bool isLoading;
  TodoListState({required this.list, required this.isLoading});
}

final class TodoListInitial extends TodoListState {
  TodoListInitial() : super(list: ['initial value one', 'initial value 2'], isLoading: false);
}
