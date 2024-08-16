part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

//! Manage your event below
class Increment extends CounterEvent {}

class Decrement extends CounterEvent {}

class ResetValue extends CounterEvent {}
