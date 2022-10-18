import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEventWithOutLibrary { toAmber, toLightBlue }

class ColorBlocWithOutLibrary {
  Color _color = Colors.amber;

  final StreamController<ColorEventWithOutLibrary> _eventController =
      StreamController<ColorEventWithOutLibrary>();
  StreamSink<ColorEventWithOutLibrary> get eventSink => _eventController.sink;
  Stream<ColorEventWithOutLibrary> get _eventStream => _eventController.stream;

  final StreamController<Color> _stateController = StreamController<Color>();
  StreamSink<Color> get _stateSink => _stateController.sink;
  Stream<Color> get stateStream => _stateController.stream;

  void _mapEventToState(ColorEventWithOutLibrary colorEvent) {
    if (colorEvent == ColorEventWithOutLibrary.toAmber) {
      _color = Colors.amber;
    } else {
      _color = Colors.lightBlueAccent;
    }

    _stateSink.add(_color);
  }

  ColorBlocWithOutLibrary() {
    _eventStream.listen(_mapEventToState);
  }

  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}
