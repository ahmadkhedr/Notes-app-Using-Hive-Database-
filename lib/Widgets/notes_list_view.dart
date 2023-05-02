import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_hive/cubits/cubit/get_notes_cubit.dart';

import 'note_item.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  void initState() {
    BlocProvider.of<GetNotesCubit>(context).getAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: BlocBuilder<GetNotesCubit, GetNotesState>(
        builder: (context, state) {
          if (state is GetNotesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetNotesSucess) {
            return BlocProvider.of<GetNotesCubit>(context).notesList!.isNotEmpty
                ? ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: BlocProvider.of<GetNotesCubit>(context)
                        .notesList!
                        .length,
                    itemBuilder: (context, index) {
                      return NoteItem(
                        item: BlocProvider.of<GetNotesCubit>(context)
                            .notesList![index],
                      );
                    })
                : const Center(
                    child: Text("No Data Found Here"),
                  );
          } else if (state is GetNotesFailed) {
            String err = (state).erroString;
            return Center(
              child: Text(err),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
