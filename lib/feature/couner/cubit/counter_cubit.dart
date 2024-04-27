import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState());

  void plus(){
    emit(CounterState(count: state.count + 1));
  }

  void minus(){
    emit(CounterState(count: state.count - 1));
  }
}
