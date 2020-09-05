import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:application/application.dart';
import 'package:presentation_core/presentation.dart';

import 'widgets/bars_chart.dart';
import 'widgets/expenses_list.dart';
import '../../widgets/lateral_menu/lateral_menu.dart';
import '../../../navigator/routes.dart';

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = useBloc(bloc: HomeBloc());

    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            FutureBuilder<List<int>>(
              future: bloc.getDates(),
              builder: (_, snapshot) => (!snapshot.hasData)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : _menu(context, bloc, snapshot.data),
            ),
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                bloc: bloc,
                loadingBuilder: (_) => Center(
                  child: CircularProgressIndicator(),
                ),
                builder: (context, state) => _body(state),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menu(BuildContext context, HomeBloc bloc, List<int> dates) =>
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
        items: dates,
        initialItem: dates.last,
        onItemChanged: (value) => bloc.searchExpensesByDate(
          Date(year: 2020, month: 08, day: 01),
        ),
      );

  Widget _body(HomeState data) => Padding(
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
