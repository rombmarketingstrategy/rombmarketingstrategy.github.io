import 'package:flutter/material.dart';
import 'package:rombmarketingstrategy/src/utils/spacers.dart';

class ResponsiveContainer extends StatelessWidget {
  final List<Widget> children;
  const ResponsiveContainer({required this.children});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const maxWidth = 800.0;

    return Row(
      children: [
        Spacers.expanded,
        Container(
          constraints: BoxConstraints(minWidth: 100, maxWidth: screenWidth > maxWidth ? maxWidth : screenWidth),
          child: Column(
            children: children,
          ),
        ),
        Spacers.expanded,
      ],
    );
  }
}
