import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../theme/style.dart';

class ExpensesList extends StatelessWidget {
  final Map<Date, List<Expense>> expensesPerDay;
  final double itemHeight;

  const ExpensesList({
    Key key,
    @required this.expensesPerDay,
    this.itemHeight = 48.0,
  })  : assert(expensesPerDay != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 24.0),
      itemCount: expensesPerDay.length,
      itemBuilder: (_, index) {
        final values = expensesPerDay[expensesPerDay.keys.elementAt(index)];

        return Column(
          children: [
            _itemTitle(expensesPerDay.keys.elementAt(index)),
            SizedBox(
              height: 8.0,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: values.length,
              itemBuilder: (_, index) => _item(values[index]),
              separatorBuilder: (_, index) => SizedBox(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 16.0,
                    width: 1.0,
                    margin: EdgeInsets.only(left: itemHeight * 0.5),
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
          ],
        );
      },
      separatorBuilder: (_, __) => Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
      ),
    );
  }

  Widget _itemTitle(Date date) => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '${date.day}',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: Container(
              height: 1.0,
              margin: const EdgeInsets.only(bottom: 4.0),
              color: kTextColor,
            ),
          ),
        ],
      );

  Widget _item(Expense expense) => SizedBox(
        height: itemHeight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: kPrimaryColor,
                  ),
                ),
                child: Icon(
                  Icons.font_download,
                  color: kPrimaryColor,
                ),
              ),
            ),
            SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      expense.category.name,
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    Text(
                      expense.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FractionallySizedBox(
              heightFactor: 1.0,
              child: Center(
                child: Text(
                  '\$${expense.value}',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
