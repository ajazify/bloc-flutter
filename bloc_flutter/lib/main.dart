import 'package:bloc_flutter/features/bloc/instagram_feed/instagram_feed_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/bloc/counter/counter_bloc.dart';
import 'package:bloc_flutter/features/bloc/todo_list/todo_bloc.dart';
import 'package:bloc_flutter/features/screen/todo_list_advance.dart';
import 'package:bloc_flutter/features/bloc/todo_list_advance/todo_advance_bloc.dart';

import 'features/screen/instagram_feed.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => TodoListBloc()),
        BlocProvider(create: (context) => TodoListAdvanceBloc()),
        BlocProvider(create: (context) => InstagramFeedBloc()),
      ],
      child: MaterialApp(
        title: 'Bloc Flutter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const InstagramFeed(),
      ),
    );
  }
}
