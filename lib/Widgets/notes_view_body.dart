import 'package:flutter/material.dart';

import 'custom_app_bar.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          height: 60.0,
        ),
        CustomAppBar()
      ],
    );
  }
}
