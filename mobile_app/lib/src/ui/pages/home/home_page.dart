import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:application/application.dart';
import 'package:presentation_core/presentation.dart';
import 'package:di/di.dart';

import 'widgets/bars_chart.dart';
import 'widgets/expenses_list.dart';
import '../../widgets/lateral_menu/lateral_menu.dart';
import '../../../navigator/routes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider<HomeBloc>(
          create: (_) => HomeBloc(g(), g()),
          child: Row(
            children: [
              BlocBuilder<HomeBloc, HomeState>(
                unsubscribeWhen: (state) {
                  final result = state?.dates?.isNotEmpty ?? false;
                  print(
                      '\n------------------------\nunsuscribing menu: $result\n------------------------\n');
                  return result;
                },
                loadingBuilder: (_) {
                  print(
                      '\n------------------------\nbuilding loading menu\n------------------------\n');
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
                builder: (context, state) {
                  print(
                      '\n------------------------\nbuilding menu\n------------------------\n');
                  return _menu(context, state.dates);
                },
              ),
              Expanded(
                child: BlocBuilder<HomeBloc, HomeState>(
                  buildWhen: (_, current) {
                    final result = current.map(
                      (state) => state.totalExpenses != null,
                      empty: () => true,
                    );

                    print(
                        '\n------------------------\nbuilding expenses: $result\n------------------------\n');
                    return result;
                  },
                  loadingBuilder: (_) {
                    print(
                        '\n------------------------\nbuilding loading expenses\n------------------------\n');
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  builder: (_, state) {
                    print(
                        '\n------------------------\nbuilding expenses\n------------------------\n');
                    return state.map(
                      (state) => _body(state),
                      empty: () => Center(child: Text('empty')),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menu(BuildContext context, List<Date> dates) => LateralMenu(
        topButton: MenuButton(
          icon: Icon(
            Icons.power_settings_new,
            color: Colors.white,
          ),
        ),
        bottomButton: MenuButton(
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onTap: () => Navigator.of(context).pushNamed(kAddExpensesRoute),
        ),
        children: List.generate(
          dates.length,
          (i) => Text(
            '${dates[i].year}\n${dates[i].month}',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        initialIndex: dates.length - 1,
        onIndexChanged: (value) => BlocProvider.of<HomeBloc>(context)
            .searchExpensesByDate(dates[value]),
      );

  Widget _body(SuccesState state) => Padding(
        padding: const EdgeInsets.fromLTRB(
          24.0,
          24.0,
          24.0,
          0.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Total expenses',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              '\$${state.totalExpenses}',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 32.0,
            ),
            BarsChart(
              valueByGroup: state.statistics,
            ),
            SizedBox(
              height: 32.0,
            ),
            Expanded(
              child: ExpensesList(
                expensesPerDay: state.perDay,
              ),
            ),
          ],
        ),
      );
}
