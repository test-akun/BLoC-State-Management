import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(ColorInitial()) {
    on<ColorEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
