import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/bloc/cart_counter/cart_counter_bloc.dart';
import 'features/bloc/screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
     providers: [
       BlocProvider(create: (context)=> CartCounterBloc()),
     ],
      child: MaterialApp(
        title: 'Bloc Flutter', 
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
        ),
         home: const Home(),
      ),
    );
  }
}
