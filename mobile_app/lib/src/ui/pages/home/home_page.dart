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
          child: Builder(
            builder: (context) {
              final bloc = BlocProvider.of<HomeBloc>(context);

              return Row(
                children: [
                  FutureBuilder<List<Date>>(
                    future: bloc.getDates(),
                    builder: (_, snapshot) {
                      if (!snapshot.hasData)
                        return Center(
                          child: CircularProgressIndicator(),
                        );

                      bloc.searchExpensesByDate(snapshot.data.last);

                      return _menu(context, bloc, snapshot.data);
                    },
                  ),
                  Expanded(
                    child: BlocBuilder<HomeBloc, HomeState>(
                      bloc: bloc,
                      loadingBuilder: (_) => Center(
                        child: CircularProgressIndicator(),
                      ),
                      builder: (_, state) => state.map(
                        success: (state) => _body(state),
                        empty: () => Center(child: Text('empty')),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _menu(BuildContext context, HomeBloc bloc, List<Date> dates) =>
      LateralMenu(
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
        onIndexChanged: (value) => bloc.searchExpensesByDate(dates[value]),
      );

  Widget _body(SuccesState data) => Padding(
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
              '\$${data.totalExpenses}',
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
              valueByGroup: data.statistics,
            ),
            SizedBox(
              height: 32.0,
            ),
            Expanded(
              child: ExpensesList(
                expensesPerDay: data.perDay,
              ),
            ),
          ],
        ),
      );
}
