import 'package:flutter/material.dart';

import '../../../theme/style.dart';

class BarsChart extends StatelessWidget {
  final Map<String, double> valueByGroup;

  const BarsChart({
    Key key,
    @required this.valueByGroup,
  })  : assert(valueByGroup != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (MediaQuery.of(context).size.height * 0.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          valueByGroup.length,
          (i) => _bar(
            valueByGroup[valueByGroup.keys.elementAt(i)],
            valueByGroup.keys.elementAt(i),
          ),
        ),
      ),
    );
  }

  Widget _bar(double value, String footer) => Column(
        children: [
          Expanded(
            child: RotatedBox(
              quarterTurns: 3,
              child: LinearProgressIndicator(
                value: value,
                minHeight: 8.0,
                backgroundColor: kPrimaryColor.withOpacity(0.1),
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            footer,
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
        ],
      );
}
