import 'package:flutter/material.dart';
import 'package:application/application.dart';
import 'package:presentation_core/presentation.dart';
import 'package:di/di.dart';

import 'widgets/bars_chart.dart';
import 'widgets/expenses_list.dart';
import '../../widgets/lateral_menu/lateral_menu.dart';
import '../../../navigator/routes.dart';
import '../../../extensions/date_time_extension.dart';

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
                unsubscribeWhen: (state) => state?.dates?.isNotEmpty ?? false,
                loadingBuilder: (context) => Center(
                  child: CircularProgressIndicator(),
                ),
                //TODO: deshabilitar boton si currentDate != state.dates.last
                builder: (context, state) => _menu(context, state.dates),
              ),
              Expanded(
                child: BlocBuilder<HomeBloc, HomeState>(
                  buildWhen: (_, current) => current.map(
                    (state) => state.totalExpenses != null,
                    empty: () => true,
                  ),
                  loadingBuilder: (_) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  builder: (_, state) => state.map(
                    (state) => _body(state),
                    empty: () => Center(child: Text('empty')),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menu(BuildContext context, List<DateTime> dates) => LateralMenu(
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
            '${dates[i].year}\n${dates[i].format('MMMM')}',
            textAlign: TextAlign.center,
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
              '\$${state.totalExpenses.toStringAsFixed(2)}',
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
              height: 16.0,
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
