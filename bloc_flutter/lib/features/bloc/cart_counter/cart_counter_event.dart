part of 'cart_counter_bloc.dart';

@immutable
abstract class CartCounterEvent {}

class Increment extends CartCounterEvent{}
class Decrement extends CartCounterEvent{}
class ResetValue extends CartCounterEvent{}
