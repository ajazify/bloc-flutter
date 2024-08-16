part of 'counter_bloc.dart';

class CounterState {
  //! value as the count state
  int value;
  CounterState({required this.value});
}

//! Set an initial value to the counterState as a separate Sub class
//! Based on separation of concerns 
final class CounterInitial extends CounterState {
  CounterInitial() : super(value: 0);
}
