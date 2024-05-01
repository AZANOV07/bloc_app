import 'package:blok/feature/task/cubit/task_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  TextEditingController taskControler = TextEditingController();
  TextEditingController addControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TaskCubit, TaskState>(builder: (context, state) {
        return ListView.builder(
            itemCount: state.task.length,
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2)),
                child: Center(
                  child: ListTile(
                    title: Text(state.task[index]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () =>
                                context.read<TaskCubit>().deleteData(index),
                            icon: Icon(Icons.delete)),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Редактировать задачу'),
                                  content: TextField(
                                    controller:
                                        addControler, // Используйте контроллер для редактирования текста
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        if (addControler.text.isNotEmpty) {
                                          context.read<TaskCubit>().updateData(
                                              index, addControler.text);
                                          Navigator.pop(context);
                                          addControler.clear();
                                        }
                                      },
                                      child: Text('Да'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Нет'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('добавить данные'),
                  content: TextField(
                    controller: taskControler,
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          if (taskControler.text.isNotEmpty) {
                            BlocProvider.of<TaskCubit>(context)
                                .addData(taskControler.text);
                            Navigator.pop(context);
                            taskControler.clear();
                          }
                        },
                        child: Text('yes')),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('no')),
                  ],
                );
              });
        },
      ),
    );
  }
}
