import 'package:flutter/material.dart';
import '../../core/common_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  //! Call your initial State below 'CounterInitial()'
  CounterBloc() : super(CounterInitial()) {
    //! Emit your State based on your Event Below
    on<Increment>((event, emit) {
      emit(CounterState(value: state.value + 1));
    });

    on<Decrement>((event, emit) {
      print(state.value.toString());
      if (state.value <= 0) {
        showToast('Maximum decrement limit reached!');  
      } else {
        emit(CounterState(value: state.value - 1));
      }
    });
    on<ResetValue>((event, emit) {
      emit(CounterState(value: 0));
    });
  }
}
