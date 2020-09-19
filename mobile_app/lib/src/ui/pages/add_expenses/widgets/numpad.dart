import 'package:application/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:presentation_core/presentation.dart';

import '../../../theme/style.dart';

class Numpad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Table(
        children: [
          TableRow(
            children: [
              _numberButton(context, 1),
              _numberButton(context, 2),
              _numberButton(context, 3),
            ],
          ),
          TableRow(
            children: [
              _numberButton(context, 4),
              _numberButton(context, 5),
              _numberButton(context, 6),
            ],
          ),
          TableRow(
            children: [
              _numberButton(context, 7),
              _numberButton(context, 8),
              _numberButton(context, 9),
            ],
          ),
          TableRow(
            children: [
              _iconButton(
                Icons.backspace,
                BlocProvider.of<AddExpenseBloc>(context).decrement,
              ),
              _numberButton(context, 0),
              _iconButton(
                Icons.add,
                BlocProvider.of<AddExpenseBloc>(context).addExpense,
                kPrimaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _numberButton(BuildContext context, int number) => AspectRatio(
        aspectRatio: 1.0,
        child: InkWell(
          child: Center(
            child: Text(
              '$number',
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 32.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          onTap: () {
            HapticFeedback.lightImpact();

            BlocProvider.of<AddExpenseBloc>(context).increment(number);
          },
        ),
      );

  Widget _iconButton(IconData icon, VoidCallback onTap,
          [Color backgroundColor]) =>
      Material(
        color: backgroundColor ?? kScaffoldBackgroundColor,
        child: AspectRatio(
          aspectRatio: 1.0,
          child: InkWell(
            child: Icon(
              icon,
              size: 32.0,
              color: (backgroundColor == null)
                  ? kPrimaryColor
                  : kScaffoldBackgroundColor,
            ),
            onTap: () {
              HapticFeedback.lightImpact();

              onTap();
            },
          ),
        ),
      );
}
