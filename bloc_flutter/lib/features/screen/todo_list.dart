import 'package:bloc_flutter/features/bloc/todo_list/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<TodoListBloc>().add(FetchApiList());
    //! Add a BlocBuilder to know call the Bloc and State
    return BlocBuilder<TodoListBloc, TodoListState>(
      builder: (context, state) {
        return SafeArea(
          child: state.isLoading
              ? Scaffold(
                  body: LinearProgressIndicator(),
                )
              : Scaffold(
                  floatingActionButton: FloatingActionButton.small(
                    onPressed: () {
                      context.read<TodoListBloc>().add(FetchApiList());
                    },
                    child: Icon(Icons.download),
                  ),
                  body: ListView.separated(
                    itemCount: state.list.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(state.list[index]),
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}
