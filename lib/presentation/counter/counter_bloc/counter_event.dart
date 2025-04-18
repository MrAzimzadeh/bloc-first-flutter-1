/// Evetler

abstract class CounterEvent {}

class PlusCounterEvent extends CounterEvent {
  final int value;
  PlusCounterEvent(this.value);
}

class DCounterEvent extends CounterEvent {
  final int value;
  DCounterEvent(this.value);
}
