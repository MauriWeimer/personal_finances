import 'package:flutter/material.dart';

import '../../theme/style.dart';

class MenuButton extends StatelessWidget {
  final Icon icon;
  final Color backgroundColor;
  final VoidCallback onTap;

  const MenuButton({
    Key key,
    @required this.icon,
    this.backgroundColor,
    this.onTap,
  })  : assert(icon != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ?? kPrimaryColor,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: InkWell(
          child: icon,
          onTap: onTap,
        ),
      ),
    );
  }
}
