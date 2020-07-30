import 'package:flutter/material.dart';

typedef EmptyBuilder = Widget Function(BuildContext context);
typedef LoadingBuilder = Widget Function(BuildContext context);
typedef ErrorBuilder = Widget Function(BuildContext context);
typedef DoneBuilder<T> = Widget Function(
  BuildContext context,
  T data,
);

class StreamStateBuilder<T> extends StatelessWidget {
  final Stream<T> stream;
  final T initialData;
  final EmptyBuilder emptyBuilder;
  final LoadingBuilder loadingBuilder;
  final ErrorBuilder errorBuilder;
  final DoneBuilder doneBuilder;

  const StreamStateBuilder({
    Key key,
    @required this.stream,
    this.initialData,
    this.emptyBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.doneBuilder,
  })  : assert(stream != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: stream,
      initialData: initialData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData)
          return doneBuilder(context, snapshot.data) ?? Container();
        else if (snapshot.hasError)
          return errorBuilder(context) ?? Container();
        else if (snapshot.data == null || !snapshot.hasData)
          return emptyBuilder(context) ?? Container();

        return loadingBuilder(context) ?? Container();
      },
    );
  }
}
