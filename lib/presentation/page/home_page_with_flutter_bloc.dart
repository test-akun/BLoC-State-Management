import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gitpod_flutter_quickstart/color_bloc_with_library.dart';

class HomeWithLibrary extends StatelessWidget {
  const HomeWithLibrary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ColorBlocWithLibrary>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('BLoC dengan Library')),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              bloc.add(ToAmber());
            },
            backgroundColor: Colors.amberAccent,
          ),
          const SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            onPressed: () {
              bloc.add(ToLightBlue());
            },
            backgroundColor: Colors.lightBlueAccent,
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<ColorBlocWithLibrary, ColorStateWithLibrary>(
          builder: (context, state) {
            return AnimatedContainer(
              width: 100,
              height: 100,
              duration: const Duration(
                milliseconds: 500,
              ),
              color: state.color,
            );
          },
        ),
      ),
    );
  }
}
