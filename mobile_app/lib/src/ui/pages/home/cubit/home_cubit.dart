import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

export 'home_state.dart';

class HomeCubit extends Cubit<CubitState> {
  final _dates = StreamController<List<int>>();
  Stream get dates => _dates.stream;

  HomeCubit() : super(LoadingState()) {
    _searchDates();
  }

  @override
  Future<void> close() async {
    await _dates.close();

    return super.close();
  }

  void _searchDates() {
    //emit(LoadingState());
    Future.delayed(Duration(seconds: 3)).then(
      (_) {
        _dates.sink.add([1,2,3,4]);
        searchExpensesByDate(4);
      } 
    );
  }

  void searchExpensesByDate(int date) {
    emit(LoadingState());
    Future.delayed(Duration(seconds: 3)).then(
      (_) {
        emit(
        HomeState(          
          totalExpenses: 845.0,
          expenseValues: {
            'Today': [
              500,
              600,
            ],
            'Martes 24': [
              500,
              600,
              500,
              600,
              500,
              600,
            ],
          },
          expenseStatistics: {
            '01-05': 0.4,
            '06-10': 0.1,
            '11-15': 0.2,
            '16-20': 0.6,
            '21-25': 0.0,
            '26-30': 0.2,
          },
        ),
      );
      } 
    );
  }
}
