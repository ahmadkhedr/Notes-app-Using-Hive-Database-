import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app_hive/cubits/cubit/add_note_cubit.dart';
import 'package:notes_app_hive/models/note_model.dart';

import 'custom_app_bar.dart';
import 'custom_button.dart';
import 'custom_test_filed.dart';
import '';

class FormBody extends StatefulWidget {
  const FormBody({
    super.key,
    required this.customAppBarTitle,
    // required this.onTap,
    this.isEdit = false,
  });
  final String customAppBarTitle;
  // final void Function()? onTap;
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
                onIconTap: () {},
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
            BlocBuilder<AddNoteCubit, AddNoteState>(
              builder: (context, state) {
                return CutomButton(
                  isLoading: state is AddNoteLoading ? true : false,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var time = DateTime.now();
                      String formattedCurrentDate =
                          DateFormat('dd-mm-yyyy').format(time);
                      var model = NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: formattedCurrentDate,
                        color: Colors.blue.value,
                      );
                      BlocProvider.of<AddNoteCubit>(context).addNote(model);
                    } else {
                      validateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                );
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
