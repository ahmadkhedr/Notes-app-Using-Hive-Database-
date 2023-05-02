import 'package:flutter/material.dart';

import 'custom_button.dart';
import 'custom_test_filed.dart';
import 'form_body.dart';

class AddBottomModelSheet extends StatelessWidget {
  const AddBottomModelSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: SingleChildScrollView(
          child: FormBody(
        customAppBarTitle: ' Note',
        onTap: () {},
      )),
    );
  }
}
