import 'package:flutter/material.dart';
import 'package:notes_app_hive/views/edit_note.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return const EditNoteView();
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
            color: Colors.green,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(children: [
            ListTile(
              title: const Text(
                "Flutter Tips",
                style: TextStyle(
                  fontSize: 26.0,
                  color: Colors.black,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  "Build Your Carer With Tharat Samy",
                  style: TextStyle(
                    fontSize: 21.0,
                    color: Colors.black.withOpacity(.6),
                  ),
                ),
              ),
              trailing: const Icon(
                Icons.delete,
                color: Colors.black,
                size: 35.0,
              ),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 0.0, bottom: 0.0),
                  child: Text(
                    "May 21 2023",
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
