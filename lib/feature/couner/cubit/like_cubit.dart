import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'like_state.dart';

class LikeCubit extends Cubit<LikeState> {
  LikeCubit() : super(LikeState());

  void like(){
    emit(LikeState(like: !state.like));
  }
}
