import 'package:blok/feature/couner/cubit/counter_cubit.dart';
import 'package:blok/feature/couner/cubit/like_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CaounterScreen extends StatelessWidget {
  const CaounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, CounterState>(builder: (context, state) {
              return Text('${state.count}');
            }),
            BlocBuilder<LikeCubit, LikeState>(builder: (context, state) {
              return IconButton(
                  onPressed: () => context.read<LikeCubit>().like(),
                  icon: state.like
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.favorite_border,
                          color: Colors.black,
                        ));
            })
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => context.read<CounterCubit>().plus(),
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () => context.read<CounterCubit>().minus(),
              child: const Icon(Icons.remove_outlined),
            )
          ],
        ));
  }
}
