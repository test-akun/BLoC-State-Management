import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEvent { toAmber, toLightBlue }

class ColorBloc {
  Color _color = Colors.amber;

  final StreamController<ColorEvent> _eventController =
      StreamController<ColorEvent>();
  StreamSink<ColorEvent> get eventSink => _eventController.sink;
  Stream<ColorEvent> get _eventStream => _eventController.stream;

  final StreamController<Color> _stateController = StreamController<Color>();
  StreamSink<Color> get _stateSink => _stateController.sink;
  Stream<Color> get stateStream => _stateController.stream;

  void _mapEventToState(ColorEvent colorEvent) {
    if (colorEvent == ColorEvent.toAmber) {
      _color = Colors.amber;
    } else {
      _color = Colors.lightBlueAccent;
    }

    _stateSink.add(_color);
  }

  ColorBloc() {
    _eventStream.listen(_mapEventToState);
  }

  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}
