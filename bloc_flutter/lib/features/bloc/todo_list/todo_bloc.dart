import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'todo_event.dart';
part 'todo_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  TodoListBloc() : super(TodoListInitial()) {
    on<FetchApiList>((event, emit) async {
      emit(TodoListState(list: [], isLoading: true));

      var client = http.Client();
      try {
        var response = await client.get(
          Uri.parse('https://jsonplaceholder.typicode.com/photos'),
        );
        print('ResponseCode is ${response.statusCode}');
        var decodedResponse = jsonDecode(response.body);
        List<String> responseList = [];

        for (var i in decodedResponse) { 
          if (i is Map<String, dynamic> && i.containsKey('title')) {
            print('${i['title']}');
            responseList.add(i['title']);
          }
        }
        emit(TodoListState(list: responseList, isLoading: false));
      } finally {
        client.close();
      }
    });
  }
}
