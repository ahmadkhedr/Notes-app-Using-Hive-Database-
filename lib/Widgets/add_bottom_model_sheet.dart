import 'package:flutter/material.dart';

import 'custom_button.dart';
import 'custom_test_filed.dart';

class AddBottomModelSheet extends StatelessWidget {
  const AddBottomModelSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(
              height: 32,
            ),
            CustomTextFiled(
              hintText: 'Title',
            ),
            SizedBox(
              height: 32.0,
            ),
            CustomTextFiled(
              hintText: 'Description',
              maxLines: 6,
            ),
            SizedBox(
              height: 62.0,
            ),
            CutomButton(),
            SizedBox(
              height: 32.0,
            ),
          ],
        ),
      ),
    );
  }
}
