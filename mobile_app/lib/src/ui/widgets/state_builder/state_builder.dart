import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finances/src/ui/pages/home/cubit/home_state.dart';

typedef LoadingBuilder = Widget Function(BuildContext context);
typedef ErrorBuilder = Widget Function(BuildContext context);
typedef EmptyBuilder = Widget Function(BuildContext context);
typedef LoadedBuilder<S> = Widget Function(
  BuildContext context,
  S state,
);

class StateBuilder<C extends Cubit<CubitState>, S extends CubitState>
    extends StatelessWidget {
  final C cubit;
  final LoadingBuilder loadingBuilder;
  final ErrorBuilder errorBuilder;
  final EmptyBuilder emptyBuilder;
  final LoadedBuilder<S> loadedBuilder;

  const StateBuilder({
    Key key,
    @required this.cubit,
    this.emptyBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    @required this.loadedBuilder,
  })  : assert(cubit != null),
        assert(loadedBuilder != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: si se hace en un archivo aparte no es necesario explicitar B ...
    return BlocBuilder<C, CubitState>(
      cubit: cubit,
      builder: (context, state) {
        switch (state.runtimeType) {
          case LoadingState:
            return loadingBuilder?.call(context) ??
                Center(
                  child: Text('loading ...'),
                );
          case ErrorState:
            return errorBuilder?.call(context) ??
                Center(
                  child: Text('error'),
                );
          default:
            return loadedBuilder(context, state);
        }
      },
    );
  }
}
