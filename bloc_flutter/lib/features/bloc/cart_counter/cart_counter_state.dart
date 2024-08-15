part of 'cart_counter_bloc.dart';

class CartCounterState {
  int value;
  
  CartCounterState({required this.value});
}

final class CartCounterInitial extends CartCounterState {
  CartCounterInitial() : super(value: 0);
}
