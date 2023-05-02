import 'package:flutter/material.dart';

import 'custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.iconValue,
    required this.titleText,
  });
  final String titleText;
  final IconData iconValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titleText,
          style: const TextStyle(
            fontSize: 28.0,
          ),
        ),
        CustomSerachIcon(
          iconValue: iconValue,
        )
      ],
    );
  }
}
