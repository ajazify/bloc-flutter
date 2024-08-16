part of 'todo_bloc.dart';

@immutable
abstract class TodoListEvent {}

class FetchApiList extends TodoListEvent {}
