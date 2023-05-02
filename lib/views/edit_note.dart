import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:notes_app_hive/models/note_model.dart';

import '../Widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.item});
  final NoteModel item;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: EditNoteViewBody(
        item: item,
      ),
    );
  }
}
