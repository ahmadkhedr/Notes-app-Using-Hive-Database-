import 'package:flutter/material.dart';

class CustomSerachIcon extends StatelessWidget {
  CustomSerachIcon({
    super.key,
    required this.iconValue,
  });
  final IconData iconValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.grey.withOpacity(.1),
      ),
      child: Center(
        child: Icon(
          iconValue,
          size: 30.0,
        ),
      ),
    );
  }
}
