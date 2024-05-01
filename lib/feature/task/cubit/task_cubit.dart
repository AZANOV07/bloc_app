import 'package:bloc/bloc.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(const TaskState());

  void addData(String newData) {
    emit(TaskState(task: [...state.task, newData]));
  }

  void updateData(int index, String newTask) {
    List<String> updatedList = List.from(state.task);
    if (index >= 0 && index < updatedList.length) {
      updatedList[index] = newTask;
      emit(TaskState(task: updatedList));
    } else {
      print('Ошибка: Недопустимый индекс для обновления задачи');
    }
  }

  void deleteData(int index) {
    List<String> updatedList = [...state.task];
    updatedList.removeAt(index);
    emit(TaskState(task: updatedList));
  }

}