import 'package:flutter/material.dart';

import '../../../navigator/routes.dart';
import '../../widgets/lateral_menu/lateral_menu.dart';
import 'widgets/bars_chart.dart';
import 'widgets/expenses_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
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
                onTap: () => Navigator.of(context).pushNamed(addExpensesRoute),
              ),

              //TODO: debería tomar el PRIMER MES cargado en la bd y el MES ACTUAL y en base a eso mostrar los meses, con alineacion abajo ...
              items: [
                'Enero',
                'Febrero',
                'Marzo',
                'Abril',
                'Mayo',
              ],
              initialItem: 1,
              onItemChanged: (month) => print('mes: ${month + 1}'),
            ),
            Expanded(
              child: _body(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body() => Padding(
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
              '\$5000,50',
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
              valueByGroup: {
                '01-05': 0.4,
                '06-10': 0.1,
                '11-15': 0.2,
                '16-20': 0.6,
                '21-25': 0.0,
                '26-30': 0.2,
              },
            ),
            SizedBox(
              height: 32.0,
            ),
            Expanded(
              child: ExpensesList(
                valuesByGroup: {
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
              ),
            ),
          ],
        ),
      );
}
