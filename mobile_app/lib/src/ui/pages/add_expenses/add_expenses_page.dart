import 'package:application/application.dart';
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:presentation_core/presentation.dart';

import '../../theme/style.dart';
import '../../widgets/lateral_menu/lateral_menu.dart';
import 'widgets/numpad.dart';

class AddExpensesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocProvider<AddExpenseBloc>(
          create: (_) => AddExpenseBloc(g(), g()),
          child: Row(
            children: [
              Builder(
                builder: (context) {
                  final bloc = BlocProvider.of<AddExpenseBloc>(context);
                  final categories = bloc.getCategories();

                  bloc.category = categories.last;

                  return LateralMenu(
                    bottomButton: MenuButton(
                      backgroundColor: kScaffoldBackgroundColor,
                      icon: Icon(
                        Icons.chevron_left,
                        color: kPrimaryColor,
                      ),
                      onTap: () => Navigator.of(context).pop(),
                    ),
                    children: List.generate(
                      categories.length,
                      (i) => Text(
                        categories[i].name,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    initialIndex: categories.length - 1,
                    onIndexChanged: (i) => bloc.category = categories[i],
                  );
                },
              ),
              Expanded(
                child: _body(),
              ),
            ],
          ),
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
            BlocBuilder<AddExpenseBloc, AddExpenseState>(
              unsubscribeWhen: (state) => state.date != null,
              builder: (_, state) => Column(
                children: [
                  Text(
                    '${state.date.month}',
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2.0,
                    ),
                  ),
                  Text(
                    '${state.date.day}',
                    style: TextStyle(
                      fontSize: 18.0,
                      letterSpacing: 3.0,
                    ),
                  ),
                ],
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
            BlocConsumer<AddExpenseBloc, AddExpenseState>(
              listener: (context, state) {
                if (state.added) Navigator.pop(context);
              },
              builder: (_, state) => Text(
                '\$${(state.value / 100).toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            SizedBox(
              height: 32.0,
            ),
            Builder(
              builder: (context) => TextField(
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
                onChanged: (value) => BlocProvider.of<AddExpenseBloc>(context)
                    .description = value,
              ),
            ),
          ],
        ),
      );
}
