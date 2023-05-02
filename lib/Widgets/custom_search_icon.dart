import 'package:flutter/material.dart';

class CustomSerachIcon extends StatelessWidget {
  const CustomSerachIcon({
    super.key,
    required this.iconValue,
    required this.onIconTap,
  });
  final IconData iconValue;
  final void Function() onIconTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onIconTap,
      child: Container(
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
      ),
    );
  }
}
