import 'package:flutter/material.dart';

typedef LoadingBuilder = Widget Function(BuildContext context);
typedef ErrorBuilder = Widget Function(BuildContext context);
typedef LoadedBuilder<T> = Widget Function(
  BuildContext context,
  T data,
);

class StreamStateBuilder<T> extends StatelessWidget {
  final Stream<T> stream;
  final T initialData;
  final LoadingBuilder loadingBuilder;
  final ErrorBuilder errorBuilder;
  final LoadedBuilder<T> loadedBuilder;

  const StreamStateBuilder({
    Key key,
    @required this.stream,
    this.initialData,
    this.loadingBuilder,
    this.errorBuilder,
    @required this.loadedBuilder,
  })  : assert(stream != null),
        assert(loadedBuilder != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: stream,
      initialData: initialData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData)
          return loadedBuilder(context, snapshot.data);
        else if (snapshot.hasError)
          return errorBuilder?.call(context) ??
              Center(
                child: Text('error'),
              );        

        return loadingBuilder?.call(context) ??
            Center(
              child: Text('loading ...'),
            );
      },
    );
  }
}
