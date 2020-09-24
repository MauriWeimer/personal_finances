import 'dart:async';

import 'package:flutter/material.dart';

import '../../theme/style.dart';
import './menu_button.dart';
import './menu_scroll_physics.dart';

export 'menu_button.dart';

typedef OnIndexChanged = void Function(int item);

class LateralMenu extends StatefulWidget {
  final List<Widget> children;
  final int initialIndex;
  final OnIndexChanged onIndexChanged;
  final MenuButton topButton;
  final MenuButton bottomButton;

  const LateralMenu({
    Key key,
    @required this.children,
    this.initialIndex = 0,
    this.onIndexChanged,
    this.topButton,
    this.bottomButton,
  })  : assert(children != null),
        super(key: key);

  @override
  _LateralMenuState createState() => _LateralMenuState();
}

class _LateralMenuState extends State<LateralMenu>
    with AutomaticKeepAliveClientMixin<LateralMenu> {
  PageController pageController;

  int currentIndex;

  @override
  void initState() {
    super.initState();

    currentIndex = widget.initialIndex;
    widget.onIndexChanged?.call(currentIndex);

    pageController = PageController(
      initialPage: currentIndex,
      viewportFraction: 0.2,
    );
  }

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SizedBox(
      width: 48.0,
      child: Material(
        color: kPrimaryColor,
        child: Column(
          children: [
            if (widget.topButton != null) widget.topButton,
            if (widget.topButton != null)
              Divider(
                height: 1.0,
                color: Colors.white.withOpacity(0.5),
              ),
            Expanded(
              child: items(),
            ),
            if (widget.bottomButton != null)
              Divider(
                height: 1.0,
                color: Colors.white.withOpacity(0.5),
              ),
            if (widget.bottomButton != null) widget.bottomButton,
          ],
        ),
      ),
    );
  }

  Widget items() => PageView.builder(
        controller: pageController,
        physics: (widget.onIndexChanged == null)
            ? NeverScrollableScrollPhysics()
            : MenuScrollPhysics(itemDimension: 0.2),
        scrollDirection: Axis.vertical,
        itemCount: widget.children.length,
        itemBuilder: (_, i) => RotatedBox(
          quarterTurns: 3,
          child: Center(
            child: Opacity(
              opacity: (i == currentIndex) ? 1.0 : 0.5,
              child: widget.children[i],
            ),
          ),
        ),
        onPageChanged: (i) {
          widget.onIndexChanged(i);

          setState(() => currentIndex = i);
        },
      );

  @override
  bool get wantKeepAlive => widget.onIndexChanged != null;
}
