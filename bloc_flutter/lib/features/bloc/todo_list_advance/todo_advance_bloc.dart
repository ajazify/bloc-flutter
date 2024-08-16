import 'package:bloc/bloc.dart';
import 'package:bloc_flutter/features/bloc/todo_list_advance/network/provider.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'model/todo_advance_response.dart';

part 'todo_advance_event.dart';
part 'todo_advance_state.dart';

class TodoListAdvanceBloc extends Bloc<TodoListAdvanceEvent, TodoListAdvanceState> {
  TodoListAdvanceBloc() : super(TodoListAdvanceInitial()) {
    on<FetchTodoList>((event, emit) async {
      emit(TodoListAdvanceState(listResponse: [], isLoading: true));
      //! Call api provider
      List<dynamic> response = await ApiProvider().FetchApiList(); 
      //! Set response to model
      List<TodoAdvanceResponse> actualResponse = response.map((v) => TodoAdvanceResponse.fromJson(v)).toList();
      emit(TodoListAdvanceState(listResponse: actualResponse, isLoading: false));
    });
  }
}
