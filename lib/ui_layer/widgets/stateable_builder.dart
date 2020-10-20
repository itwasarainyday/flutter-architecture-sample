import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/bloc_layer/stateable.dart';
import 'package:flutterarchitecturesample/data_layer/result.dart';

class StateableBuilder<T> extends StatelessWidget {
  final Stateable stateable;
  final Function() initialize;
  final Widget Function() onUninitialized;
  final Widget Function(T) onLoading;
  final Widget Function(Result) onError;
  final Widget Function(T) onSuccess;
  final Widget Function(Result<T>) onAll;

  StateableBuilder({
    this.stateable,
    this.initialize,
    this.onUninitialized,
    this.onLoading,
    this.onError,
    this.onSuccess,
    this.onAll
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Result<T>>(
      initialData: stateable.currentState,
      stream: stateable.stream,
      builder: (context, snapshot) {
        final result = snapshot.data;

        if (result.status == ResultStatus.uninitialized) {
          initialize?.call();
        }

        switch (result.status) {
          case ResultStatus.uninitialized:
            return onAll?.call(result) ?? onUninitialized?.call();
          case ResultStatus.loading:
            return onAll?.call(result) ?? onLoading?.call(result.data);
          case ResultStatus.error:
            return onAll?.call(result) ?? onError?.call(result);
          case ResultStatus.success:
            break;
        }

        return onAll?.call(result) ?? onSuccess?.call(result.data);
      },
    );
  }
}
