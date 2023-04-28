import 'package:flutter/material.dart';

class CustomSerachIcon extends StatelessWidget {
  const CustomSerachIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      width: 45.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.grey.withOpacity(.1),
      ),
      child: const Center(
        child: Icon(
          Icons.search,
        ),
      ),
    );
  }
}
