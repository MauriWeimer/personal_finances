import 'package:flutter/material.dart';
import 'package:personal_finances/src/ui/widgets/stream_state_builder/stream_state_builder.dart';

import '../../../navigator/routes.dart';
import '../../widgets/lateral_menu/lateral_menu.dart';
import '../../widgets/state_builder/state_builder.dart';
import 'cubit/home_cubit.dart';
import 'widgets/bars_chart.dart';
import 'widgets/expenses_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit();

    return Scaffold(
      body: SafeArea(
        child: StreamStateBuilder<List<int>>(
          stream: cubit.dates,
          loadingBuilder: (_) => Center(
            child: CircularProgressIndicator(),
          ),
          loadedBuilder: (_, dates) => Row(
            children: [
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
                  onTap: () =>
                      Navigator.of(context).pushNamed(addExpensesRoute),
                ),
                items: dates,
                initialItem: dates.last,
                onItemChanged: (i) => cubit.searchExpensesByDate(i),
              ),
              Expanded(
                child: StateBuilder<HomeCubit, HomeState>(
                  cubit: cubit,
                  loadingBuilder: (_) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  loadedBuilder: (context, state) => _body(state),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
