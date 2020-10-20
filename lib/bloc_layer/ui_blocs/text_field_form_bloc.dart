import 'dart:async';

import 'package:flutterarchitecturesample/bloc_layer/bloc.dart';

class TextFieldFormBloc extends Bloc {
  String _input = "";

  StreamController<String> _controller = StreamController.broadcast();

  Stream<String> get stream => _controller.stream;

  String get input => _input;

  Future<void> update(String input) async {
    _input = input;
    _controller.sink.add(_input);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
