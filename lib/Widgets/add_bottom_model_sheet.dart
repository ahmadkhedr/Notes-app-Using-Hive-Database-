import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_hive/cubits/cubit/add_note_cubit.dart';
import 'package:notes_app_hive/cubits/cubit/get_notes_cubit.dart';

import 'custom_button.dart';
import 'custom_test_filed.dart';
import 'form_body.dart';

class AddBottomModelSheet extends StatelessWidget {
  const AddBottomModelSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: BlocProvider(
        create: (context) => AddNoteCubit(),
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddNoteFailed) {}

            if (state is AddNoteSuccess) {
              BlocProvider.of<GetNotesCubit>(context).getAllNotes();
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is AddNoteLoading ? true : false,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const SingleChildScrollView(
                  child: FormBody(
                    customAppBarTitle: ' Note',
                    //  onTap: () {},
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
