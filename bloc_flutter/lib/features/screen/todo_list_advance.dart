import '../core/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_flutter/features/bloc/todo_list_advance/todo_advance_bloc.dart';

class TodoListAdvance extends StatelessWidget {
  const TodoListAdvance({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<TodoListAdvanceBloc>().add(FetchTodoList());
    //! Add a BlocBuilder to know call the Bloc and State
    return BlocBuilder<TodoListAdvanceBloc, TodoListAdvanceState>(
      builder: (context, state) {
        return SafeArea(
          child: state.isLoading
              ? Scaffold(
                  body: LinearProgressIndicator(),
                )
              : Scaffold(
                  floatingActionButton: FloatingActionButton.small(
                    onPressed: () {
                      context.read<TodoListAdvanceBloc>().add(FetchTodoList());
                    },
                    child: Icon(Icons.download),
                  ),
                  body: ListView.separated(
                    itemCount: state.listResponse.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                    },
                    itemBuilder: (BuildContext context, int index) {
                      var listResp = state.listResponse[index];
                      return ListTile(
                        dense: true,
                        leading: CircleAvatar(
                          backgroundColor: randomPastelLiteColor(), 
                          child: Text(listResp.id.toString()),
                        ),
                        subtitle: Text(
                          listResp.completed ?? false ? 'Pending' : 'Completed',
                          style: TextStyle(color: listResp.completed ?? false ? Colors.red : Colors.green),
                        ),
                        title: Text(listResp.title ?? '',
                            style: TextStyle(
                                decoration:
                                    listResp.completed ?? false ? TextDecoration.none : TextDecoration.lineThrough)),
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}
