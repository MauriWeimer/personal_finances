import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
              _numberButton(1),
              _numberButton(2),
              _numberButton(3),
            ],
          ),
          TableRow(
            children: [
              _numberButton(4),
              _numberButton(5),
              _numberButton(6),
            ],
          ),
          TableRow(
            children: [
              _numberButton(7),
              _numberButton(8),
              _numberButton(9),
            ],
          ),
          TableRow(
            children: [
              _iconButton(
                Icons.backspace,
                () {},
              ),
              _numberButton(0),
              _iconButton(
                Icons.add,
                () {},
                primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _numberButton(int number) => AspectRatio(
        aspectRatio: 1.0,
        child: InkWell(
          child: Center(
            child: Text(
              '$number',
              style: TextStyle(
                color: primaryColor,
                fontSize: 32.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          onTap: () {
            HapticFeedback.lightImpact();

            //TODO: implement numberButton tap
          },
        ),
      );

  Widget _iconButton(IconData icon, VoidCallback onTap,
          [Color backgroundColor]) =>
      Material(
        color: backgroundColor ?? scaffoldBackgroundColor,
        child: AspectRatio(
          aspectRatio: 1.0,
          child: InkWell(
            child: Icon(
              icon,
              size: 32.0,
              color: (backgroundColor == null)
                  ? primaryColor
                  : scaffoldBackgroundColor,
            ),
            onTap: () {
              HapticFeedback.lightImpact();

              onTap();
            },
          ),
        ),
      );
}
