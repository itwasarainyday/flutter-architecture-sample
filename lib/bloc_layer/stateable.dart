import 'dart:async';

import 'package:flutterarchitecturesample/bloc_layer/bloc.dart';
import 'package:flutterarchitecturesample/data_layer/result.dart';

mixin Stateable<T> on Bloc {
  Result<T> _currentState = Result.uninitialized();

  Result<T> get currentState => _currentState;

  StreamController<Result<T>> _controller = StreamController.broadcast();

  Stream<Result<T>> get stream => _controller.stream;

  void setState(Result<T> state) {
    _currentState = state;
    _controller.sink.add(_currentState);
  }

  void resetState() {
    _currentState = Result.uninitialized();
  }

  void refreshStream() {
    _controller.sink.add(_currentState);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
