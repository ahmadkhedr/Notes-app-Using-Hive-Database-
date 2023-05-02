import 'package:flutter/material.dart';

import 'custom_app_bar.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
      ),
      child: Column(
        children: const [
          SizedBox(
            height: 60.0,
          ),
          CustomAppBar(
            iconValue: Icons.check,
            titleText: 'Edit Note',
          ),
        ],
      ),
    );
  }
}
