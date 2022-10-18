import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:bloc/bloc.dart';

class ColorBlocWithLibrary
    extends Bloc<ColorEventWithLibrary, ColorStateWithLibrary> {
  ColorBlocWithLibrary(super.initialState) {
    on<ToAmber>((event, emit) {
      emit(const ColorStateWithLibrary(color: Colors.amberAccent));
    });
    on<ToLightBlue>((event, emit) {
      emit(const ColorStateWithLibrary(color: Colors.lightBlueAccent));
    });
    // on<ToLightBlue>((event, emit) => emit(LightBlueState()));
  }
}

@immutable
abstract class ColorEventWithLibrary extends Equatable {
  @override
  List<Object?> get props => [];
}

class ToAmber extends ColorEventWithLibrary {}

class ToLightBlue extends ColorEventWithLibrary {}

// ///////////////////// //
@immutable
class ColorStateWithLibrary extends Equatable {
  final Color color;

  const ColorStateWithLibrary({required this.color});

  @override
  List<Object?> get props => [color];
}

class InitialState extends ColorStateWithLibrary {
  const InitialState({required super.color});
}