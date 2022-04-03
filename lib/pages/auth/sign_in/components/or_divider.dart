import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 2,
              endIndent: 20,
            ),
          ),
          Text("o"),
          Expanded(
            child: Divider(
              thickness: 2,
              indent: 20,
            ),
          ),
        ],
      ),
    );
  }
}
