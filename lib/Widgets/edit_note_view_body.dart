import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_hive/Widgets/custom_test_filed.dart';
import 'package:notes_app_hive/Widgets/note_item.dart';
import 'package:notes_app_hive/cubits/cubit/get_notes_cubit.dart';

import '../models/note_model.dart';
import 'custom_app_bar.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key, required this.item});
  final NoteModel item;

  @override
  Widget build(BuildContext context) {
    return FormBody(
      item: item,
    );
  }
}

class FormBody extends StatefulWidget {
  const FormBody({
    super.key,
    required this.item,
  });
  final NoteModel item;

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
            const SizedBox(
              height: 60.0,
            ),
            CustomAppBar(
              iconValue: Icons.check,
              titleText: 'Edit Note',
              onIconTap: () {
               
                widget.item.title = title ?? widget.item.title;
                widget.item.subTitle = subTitle ?? widget.item.subTitle;
                widget.item.save();
                BlocProvider.of<GetNotesCubit>(context).getAllNotes();
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 60.0,
            ),
            CustomTextFiled(
              hintText: "Title",
              onChanged: (value) {
                title = value;
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextFiled(
              hintText: "Content",
              maxLines: 6,
              onChanged: (value) {
                subTitle = value;
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}
