import 'package:flutter/material.dart';

abstract class CubitState {}

// class InitialState extends CubitState {
//   final List<int> dates = [];
// }

class LoadingState extends CubitState {}

class ErrorState extends CubitState {}

class HomeState extends CubitState {
  double totalExpenses;
  Map<String, double> expenseStatistics;
  Map<String, List<double>> expenseValues;

  HomeState({
    this.totalExpenses,
    this.expenseStatistics,
    this.expenseValues,
  });

  HomeState copyWith({
    List<int> dates,
    double total,
    Map<String, double> statistics,
    List<double> expenses,
  }) {
    return HomeState(
      totalExpenses: totalExpenses,
      expenseStatistics: expenseStatistics,
      expenseValues: expenseValues,
    );
  }
}
