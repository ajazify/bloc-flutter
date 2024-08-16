import 'package:bloc_flutter/features/bloc/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    //! Add a BlocBuilder to know call the Bloc and State
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            //! Trigger the event like below - Decrement
                            context.read<CounterBloc>().add(Decrement());
                          },
                          child: Text(
                            '-',
                            style: TextStyle(fontSize: 40),
                          )),
                      Text(
                        //! Call state like this - It will automatically update when the Event is called!
                        '${state.value}',
                        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            //! Trigger the event like below - Increment
                            context.read<CounterBloc>().add(Increment());
                          },
                          child: Text(
                            '+',
                            style: TextStyle(fontSize: 30),
                          )),
                    ],
                  ),
                  Text(
                    'Simple Bloc Counter',
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton( 
                      onPressed: () {
                        //! Call Reset Event - ResetValue
                        context.read<CounterBloc>().add(ResetValue());
                      },
                      child: Text('Reset'))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
