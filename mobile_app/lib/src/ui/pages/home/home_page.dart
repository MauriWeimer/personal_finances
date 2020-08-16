import 'package:flutter/material.dart';
import 'package:presentation_core/ploc.dart';

import '../../../navigator/routes.dart';
import '../../widgets/lateral_menu/lateral_menu.dart';
import 'ploc/home_ploc.dart';
import 'widgets/bars_chart.dart';
import 'widgets/expenses_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PlocProvider<HomePloc>(
          create: (context) => HomePloc(),
          child: Builder(
            builder: (context) => FutureBuilder<List<int>>(
              future: PlocProvider.of<HomePloc>(context).getDates(),
              //TODO: crear widget future igual al stream ...
              builder: (_, snapshot) => (!snapshot.hasData)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Row(
                      children: [
                        _menu(
                          context,
                          snapshot.data,
                        ),
                        Expanded(
                          child: PlocBuilder<HomePloc, HomeState>(
                            loadingBuilder: (_) => Center(
                              child: CircularProgressIndicator(),
                            ),
                            builder: (context, state) => _body(state),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _menu(BuildContext context, List<int> dates) => LateralMenu(
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
          onTap: () => Navigator.of(context).pushNamed(addExpensesRoute),
        ),
        items: dates,
        initialItem: dates.last,
        onItemChanged: PlocProvider.of<HomePloc>(context).searchExpensesByDate,
      );

  Widget _body(HomeState state) => Padding(
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
              valueByGroup: state.expenseStatistics,
            ),
            SizedBox(
              height: 32.0,
            ),
            Expanded(
              child: ExpensesList(
                valuesByGroup: state.expenseValues,
              ),
            ),
          ],
        ),
      );
}
