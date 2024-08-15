import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'cart_counter_event.dart';
part 'cart_counter_state.dart';

class CartCounterBloc extends Bloc<CartCounterEvent, CartCounterState> { 
  CartCounterBloc() : super(CartCounterInitial()) {
    on<Increment>((event, emit) {
      emit(CartCounterState(value: state.value + 1));
    });

    on<Decrement>((event, emit) {
      emit(CartCounterState(value: state.value - 1));
    });
    on<ResetValue>((event, emit) {
      emit(CartCounterState(value: 0));
    });
  }
}
