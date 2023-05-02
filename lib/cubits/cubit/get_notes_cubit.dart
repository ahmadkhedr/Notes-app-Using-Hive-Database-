import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app_hive/constants.dart';
import 'package:notes_app_hive/models/note_model.dart';

part 'get_notes_state.dart';

class GetNotesCubit extends Cubit<GetNotesState> {
  GetNotesCubit() : super(GetNotesInitial());
  List<NoteModel>? notesList ;

  getAllNotes() {
    emit(GetNotesLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      notesList = notesBox.values.toList();
      emit(GetNotesSucess());
    } catch (e) {
      emit(GetNotesFailed(e.toString()));
    }
  }
}
