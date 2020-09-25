import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../theme/style.dart';
import '../../../../extensions/date_time_extension.dart';

class ExpensesList extends StatelessWidget {
  final Map<DateTime, List<Expense>> expensesPerDay;
  final double itemHeight;

  const ExpensesList({
    Key key,
    @required this.expensesPerDay,
    this.itemHeight = 48.0,
  })  : assert(expensesPerDay != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ScrollConfiguration(
          behavior: _ExpensesScrollBehavior(),
          child: ListView.separated(
            padding: const EdgeInsets.only(top: 16.0, bottom: 24.0),
            itemCount: expensesPerDay.length,
            itemBuilder: (_, index) {
              final values =
                  expensesPerDay[expensesPerDay.keys.elementAt(index)];

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
          ),
        ),
        Container(
          height: 24.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).scaffoldBackgroundColor,
                Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }

  Widget _itemTitle(DateTime date) => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            date.format('EEEE dd', detectToday: true, detectYesterday: true),
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
                  IconData(expense.category.icon, fontFamily: 'MaterialIcons'),
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
                    if (expense.description?.isNotEmpty ?? false)
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
                  '\$${expense.value.toStringAsFixed(2)}',
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

class _ExpensesScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    _,
    Widget child,
    __,
  ) =>
      child;
}
