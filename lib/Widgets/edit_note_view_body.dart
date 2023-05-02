import 'package:flutter/material.dart';
import 'package:notes_app_hive/Widgets/custom_test_filed.dart';

import 'custom_app_bar.dart';
import 'form_body.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FormBody(
      customAppBarTitle: 'Edit Note',
      //  onTap: () {},
      isEdit: true,
    );
  }
}
