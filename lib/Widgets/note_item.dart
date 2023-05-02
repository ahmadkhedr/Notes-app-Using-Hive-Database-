import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_hive/cubits/cubit/get_notes_cubit.dart';
import 'package:notes_app_hive/views/edit_note.dart';

import '../models/note_model.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.item,
  });
  final NoteModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(item.color);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return EditNoteView(
              item: item,
            );
          }),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 24.0,
          ),
          decoration: BoxDecoration(
            color: Color(item.color),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(children: [
            ListTile(
              title: Text(
                item.title,
                style: const TextStyle(
                  fontSize: 26.0,
                  color: Colors.black,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  item.subTitle,
                  style: TextStyle(
                    fontSize: 21.0,
                    color: Colors.black.withOpacity(.6),
                  ),
                ),
              ),
              trailing: IconButton(
                  onPressed: () {
                    item.delete();
                    BlocProvider.of<GetNotesCubit>(context).getAllNotes();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 35.0,
                  )),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 0.0, bottom: 0.0),
                  child: Text(
                    item.date,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black.withOpacity(.6),
                    ),
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}
