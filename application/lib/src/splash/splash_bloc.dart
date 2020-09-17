import 'package:application_core/bloc.dart';
import 'package:domain/domain.dart';

class SplashBloc extends Bloc<bool> {
  final SaveCategories _saveCategories;

  SplashBloc(this._saveCategories) {
    execute<bool>(
      useCase: Stream.fromFuture(_saveCategories.execute()),
      then: (result) => emit(result),
    );
  }
}
