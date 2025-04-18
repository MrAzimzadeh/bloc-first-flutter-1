import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/presentation/counter/counter_bloc/counter_event.dart';
import 'package:myapp/presentation/counter/counter_bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<PlusCounterEvent>(_plusCount);
    on<DCounterEvent>(_decrementCount);
  }

  // Todo
  Future _plusCount(PlusCounterEvent event, Emitter emit) async {
    emit(ListerCounterState(state.counter));
    emit(CounterState(state.counter! + event.value)); // SetState
  }

  Future _decrementCount(DCounterEvent event, Emitter emit) async {
    emit(ListerCounterState(state.counter));
    emit(CounterState(state.counter! - event.value)); // SetSt
  }
}
