import 'package:bloc_flutter/features/bloc/cart_counter/cart_counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCounterBloc, CartCounterState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            floatingActionButton: Row(
              children: [
                FloatingActionButton(
                    child: const Text('+'),
                    onPressed: () {
                      context.read<CartCounterBloc>().add(Increment());
                    }),
                FloatingActionButton(
                    child: const Text('-'),
                    onPressed: () {
                      context.read<CartCounterBloc>().add(Decrement());
                    })
              ],
            ),
            body: Center(
              child: Column( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'The value is :: ${state.value}',
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
