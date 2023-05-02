import 'package:flutter/material.dart';

import 'custom_app_bar.dart';
import 'custom_button.dart';
import 'custom_test_filed.dart';

class FormBody extends StatefulWidget {
  const FormBody({
    super.key,
    required this.customAppBarTitle,
    required this.onTap,
    this.isEdit = false,
  });
  final String customAppBarTitle;
  final void Function()? onTap;
  final bool isEdit;

  @override
  State<FormBody> createState() => _FormBodyState();
}

class _FormBodyState extends State<FormBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode validateMode = AutovalidateMode.disabled;

  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: validateMode,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        child: Column(
          children: [
            if (widget.isEdit) ...[
              const SizedBox(
                height: 60.0,
              ),
              CustomAppBar(
                iconValue: Icons.check,
                titleText: widget.customAppBarTitle,
              ),
            ],
            const SizedBox(
              height: 60.0,
            ),
            CustomTextFiled(
              hintText: "Title",
              onSaved: (value) {
                title = value;
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextFiled(
              hintText: "Content",
              maxLines: 6,
              onSaved: (value) {
                subTitle = value;
              },
            ),
            const SizedBox(
              height: 62.0,
            ),
            CutomButton(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                } else {
                  validateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
            const SizedBox(
              height: 32.0,
            ),
          ],
        ),
      ),
    );
  }
}