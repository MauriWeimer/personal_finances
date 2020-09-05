import 'package:flutter/material.dart';

import '../../theme/style.dart';
import '../../widgets/lateral_menu/lateral_menu.dart';
import 'widgets/numpad.dart';

class AddExpensesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Row(
          children: [
            LateralMenu(
              bottomButton: MenuButton(
                backgroundColor: kScaffoldBackgroundColor,
                icon: Icon(
                  Icons.chevron_left,
                  color: kPrimaryColor,
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
              //TODO: items deberia ser una lista de Widgets ...
              items: [
                'Categoria',
                'Categoria',
                'Categoria',
                'Categoria',
                'Categoria',
              ],
              initialItem: 1,
              onItemChanged: (item) => print('item: $item'),
            ),
            Expanded(
              child: _body(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          expense(),
          Expanded(
            child: Numpad(),
          ),
        ],
      );

  Widget header() => Padding(
        padding: const EdgeInsets.fromLTRB(
          24.0,
          24.0,
          24.0,
          32.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'September',
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 2.0,
              ),
            ),
            Text(
              'Monday 14',
              style: TextStyle(
                fontSize: 18.0,
                letterSpacing: 3.0,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Divider(
              color: kTextColor,
              height: 1.0,
              thickness: 1.0,
            ),
          ],
        ),
      );

  Widget expense() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add expenses',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              '\$${200.987.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 32.0,
            ),
            //TODO: Agregar descripcion
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Description',
                labelStyle: TextStyle(
                  color: kTextColor,
                ),
              ),
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      );
}
