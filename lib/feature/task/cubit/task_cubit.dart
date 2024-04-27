import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(const TaskState());


  void addData(String newData){
    emit(TaskState(task: [...state.task,newData]));
  }

  void updateData(){

  }

  void deleteData(int index){
    List<String> updatedList = [...state.task];
    updatedList.removeAt(index);
    emit(TaskState(task: updatedList));
  }
}
