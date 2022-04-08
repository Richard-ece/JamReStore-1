import 'package:flutter/material.dart';

class NumbersComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton(context, '1', 'Ranking'),
          buildDivider(),
          buildButton(context, '35', 'Following'),
          buildDivider(),
          buildButton(context, '500', 'Followers'),
        ],
      );
  Widget buildDivider() => Container(
        height: 24,
        child: VerticalDivider(),
      );

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
            ),
            SizedBox(height: 2),
            Text(
              text,
            ),
          ],
        ),
      );
}
