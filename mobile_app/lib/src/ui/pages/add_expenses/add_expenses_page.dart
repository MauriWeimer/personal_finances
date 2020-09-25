import 'package:application/application.dart';
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:presentation_core/presentation.dart';

import '../../theme/style.dart';
import '../../widgets/lateral_menu/lateral_menu.dart';
import 'widgets/numpad.dart';
import '../../../extensions/date_time_extension.dart';

class AddExpensesPage extends StatefulWidget {
  @override
  _AddExpensesPageState createState() => _AddExpensesPageState();
}

class _AddExpensesPageState extends State<AddExpensesPage> {
  FocusNode descriptionNode;

  @override
  void initState() {
    super.initState();

    descriptionNode = FocusNode();
  }

  @override
  void dispose() {
    descriptionNode.unfocus();
    descriptionNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: SafeArea(
          child: BlocProvider<AddExpenseBloc>(
            create: (_) => AddExpenseBloc(g(), g()),
            child: Row(
              children: [
                BlocBuilder<AddExpenseBloc, AddExpenseState>(
                  unsubscribeWhen: (state) => state.categories.isNotEmpty,
                  builder: (context, state) => LateralMenu(
                    bottomButton: MenuButton(
                      backgroundColor: kScaffoldBackgroundColor,
                      icon: Icon(
                        Icons.chevron_left,
                        color: kPrimaryColor,
                      ),
                      onTap: () => Navigator.of(context).pop(),
                    ),
                    children: List.generate(
                      state.categories.length,
                      (i) => Row(
                        children: [
                          Icon(
                            IconData(
                              state.categories[i].icon,
                              fontFamily: 'MaterialIcons',
                            ),
                            color: Colors.white,
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            state.categories[i].name,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    initialIndex: state.categories.length - 1,
                    onIndexChanged:
                        BlocProvider.of<AddExpenseBloc>(context).categoryIndex,
                  ),
                ),
                Expanded(
                  child: body(),
                ),
              ],
            ),
          ),
        ),
        onTap: () => descriptionNode.unfocus(),
      ),
    );
  }

  Widget body() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          Expanded(child: expense()),
          Numpad(),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.date.format('MMMM'),
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2.0,
                    ),
                  ),
                  Text(
                    state.date.format('EEEE dd'),
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
              listenWhen: (_, current) => current.added,
              listener: (context, _) => Navigator.pop(context),
              buildWhen: (previous, current) => previous.value != current.value,
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
            Expanded(
              child: Builder(
                builder: (context) => TextField(
                  focusNode: descriptionNode,
                  maxLines: null,
                  expands: true,
                  keyboardType: TextInputType.multiline,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    alignLabelWithHint: true,
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
            ),
          ],
        ),
      );
}
