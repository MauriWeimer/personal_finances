import 'package:flutter/material.dart';

import '../../theme/style.dart';
import 'menu_button.dart';

export 'menu_button.dart';

typedef OnItemChanged = void Function(int item);

class LateralMenu<T> extends StatefulWidget {
  final List<T> items;
  final int initialItem;
  final OnItemChanged onItemChanged;
  final MenuButton topButton;
  final MenuButton bottomButton;

  const LateralMenu({
    Key key,
    @required this.items,
    this.initialItem = 0,
    this.onItemChanged,
    this.topButton,
    this.bottomButton,
  })  : assert(items != null),
        super(key: key);

  @override
  _LateralMenuState createState() => _LateralMenuState();
}

class _LateralMenuState extends State<LateralMenu> {
  PageController pageController;

  int currentIndex;

  @override
  void initState() {
    super.initState();

    currentIndex = widget.initialItem;

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
        scrollDirection: Axis.vertical,
        itemCount: widget.items.length,
        itemBuilder: (_, i) {
          return RotatedBox(
            quarterTurns: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${widget.items[i]}',
                  style: TextStyle(
                    color: (i == currentIndex)
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          );
        },
        onPageChanged: (i) {
          widget.onItemChanged(i);

          setState(() => currentIndex = i);
        },
      );
}
